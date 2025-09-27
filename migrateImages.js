import fs from 'fs';
import path from 'path';
import mysql from 'mysql2/promise';

const uploadDir = path.join(process.cwd(), 'uploads');

async function migrateImages() {
  // Create DB connection (adjust config if needed)
  const db = await mysql.createConnection({
    host: 'localhost',
    user: 'root',
    password: '',
    database: 'auth_db',
  });

  async function migrateCategory(category) {
    const table = category.toLowerCase();
    const [rows] = await db.query(`SELECT id, image_path FROM ${table}`);

    for (const { id, image_path } of rows) {
      const ext = path.extname(image_path);
      const oldPath = path.join(uploadDir, image_path);
      const newFilename = `${table}-${id}${ext}`;
      const newPath = path.join(uploadDir, newFilename);

      if (!fs.existsSync(oldPath)) {
        console.warn(`File not found: ${oldPath}, skipping...`);
        continue;
      }

      try {
        fs.renameSync(oldPath, newPath);
        console.log(`Renamed: ${image_path} → ${newFilename}`);

        await db.query(`UPDATE ${table} SET image_path = ? WHERE id = ?`, [newFilename, id]);
        console.log(`Updated DB: ${table} id ${id}`);
      } catch (err) {
        console.error(`Error migrating id ${id} in ${table}:`, err);
      }
    }
  }

  try {
    await migrateCategory('books');
    await migrateCategory('phones');
    console.log('Migration complete!');
  } catch (err) {
    console.error('Migration failed:', err);
  } finally {
    await db.end();
  }
}

migrateImages();