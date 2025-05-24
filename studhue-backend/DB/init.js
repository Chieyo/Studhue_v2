const sqlite3 = require('sqlite3').verbose();
const fs = require('fs');
const path = require('path');

// Path to database file
const dbPath = path.resolve(__dirname, 'database.sqlite');
const schemaPath = path.resolve(__dirname, 'schema.sql');

// Open connection to DB
const db = new sqlite3.Database(dbPath, (err) => {
  if (err) {
    console.error('❌ Failed to connect to SQLite database:', err.message);
  } else {
    console.log('✅ Connected to SQLite database.');
  }
});

// Read SQL schema and run it
fs.readFile(schemaPath, 'utf8', (err, schema) => {
  if (err) {
    console.error('❌ Failed to read schema.sql:', err.message);
    return;
  }

  db.exec(schema, (err) => {
    if (err) {
      console.error('❌ Failed to initialize schema:', err.message);
    } else {
      console.log('✅ Database schema initialized.');
    }

    // Close connection
    db.close();
  });
});
