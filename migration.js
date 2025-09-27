import mysql from 'mysql2/promise';
import fs from 'fs';
import path from 'path';

const uploadDir = path.join(process.cwd(), 'uploads');

// Connect to new database (products table)
const newDb = await mysql.createPool({
  host: 'localhost',
  user: 'root',
  password: '',
  database: 'auth_db',
});

// Connect to old database (books/phones)
const oldDb = await mysql.createPool({
  host: 'localhost',
  user: 'root',
  password: '',
  database: 'old_db',  // <- old tables
});

async function migrateCategory(oldTable, categoryName) {
  // Get category id in new DB
  const [catRows] = await newDb.query('SELECT id FROM categories WHERE name=?', [categoryName]);
  if (catRows.length === 0) throw new Error(`Category ${categoryName} not found`);
  const categoryId = catRows[0].id;

  // Read from old DB
  const [rows] = await oldDb.query(`SELECT * FROM ${oldTable}`);

  for (const row of rows) {
    const oldImage = row.image_path; // e.g., phones-1.webp
    const realExt = path.extname(oldImage); // keep actual extension

    // Insert into new DB first to get new auto-increment ID
    const [result] = await newDb.query(`
      INSERT INTO products (name, category_id, old_price, new_price, image_path)
      VALUES (?, ?, ?, ?, ?)
    `, [row.name, categoryId, row.old_price, row.new_price, 'TEMP']); // temporary image_path

    const newId = result.insertId; // this is the new product ID
    const newFilename = `${categoryName.toLowerCase()}-${newId}${realExt}`;

    // Rename file in /uploads
    const oldPath = path.join(uploadDir, oldImage);
    const newPath = path.join(uploadDir, newFilename);
    if (fs.existsSync(oldPath)) fs.renameSync(oldPath, newPath);

    // Update product with correct filename
    await newDb.query('UPDATE products SET image_path=? WHERE id=?', [newFilename, newId]);
  }
}

// Run migration
(async () => {
  await migrateCategory('books', 'Books');
  await migrateCategory('phones', 'Phones');
  console.log('Migration complete!');
  process.exit(0);
})();
