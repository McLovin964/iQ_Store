import mysql from 'mysql2/promise';
import fs from 'fs';
import path from 'path';

const connection = await mysql.createConnection({
  host: 'localhost',
  user: 'YOUR_DB_USER',
  password: 'YOUR_DB_PASS',
  database: 'auth_db',
});

// Step 1: Read the backup JSON
const backupFile = path.join(__dirname, 'image_path_backup.json');
if (!fs.existsSync(backupFile)) {
  console.error('Backup file not found! Cannot undo.');
  process.exit(1);
}

const backupData = JSON.parse(fs.readFileSync(backupFile, 'utf-8'));

// Step 2: Restore original image paths
for (const product of backupData) {
  await connection.query('UPDATE products SET image_path = ? WHERE id = ?', [
    product.image_path,
    product.id,
  ]);
}

console.log('Restored original image paths from backup!');

await connection.end();