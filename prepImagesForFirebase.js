import mysql from 'mysql2/promise';
import fs from 'fs';
import path from 'path';
import { fileURLToPath } from 'url';
import { dirname } from 'path';

const __filename = fileURLToPath(import.meta.url);
const __dirname = dirname(__filename);

// MySQL connection
const connection = await mysql.createConnection({
  host: 'localhost',
  user: 'root',
  password: '',
  database: 'auth_db',
});

// Step 1: Fetch all products
const [products] = await connection.query('SELECT id, image_path FROM products');

// Step 2: Save current image paths to backup JSON
const backupFile = path.join(__dirname, 'image_path_backup.json');
fs.writeFileSync(backupFile, JSON.stringify(products, null, 2)); // pretty-print JSON
console.log(`Backup saved to ${backupFile}`);

// Step 3: Update image paths for production (example)
for (const product of products) {
  const newPath = `/uploads/${path.basename(product.image_path)}`; // prep for Firebase Hosting
  await connection.query('UPDATE products SET image_path = ? WHERE id = ?', [newPath, product.id]);
}

console.log('Updated image paths for production!');

await connection.end();