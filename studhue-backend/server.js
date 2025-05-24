const express = require('express');
const cors = require('cors');
const sqlite3 = require('sqlite3').verbose();
const bodyParser = require('body-parser');
const app = express();
const port = 3000;

// Middleware
app.use(cors());
app.use(bodyParser.json());

// Initialize SQLite database
const db = new sqlite3.Database('./database.db', (err) => {
  if (err) {
    console.error('Database connection error:', err.message);
  } else {
    console.log('Connected to SQLite database.');
  }
});

// Routes
const userRoutes = require('./routes/users');
const postRoutes = require('./routes/posts');
const followershipRoutes = require('./routes/followership');
const pinboardRoutes = require('./routes/pinboards');

app.use('/api/users', userRoutes(db));
app.use('/api/posts', postRoutes(db));
app.use('/api/followership', followershipRoutes(db));
app.use('/api/pinboards', pinboardRoutes(db));

// Initialize DB schema on startup
try {
  require('./DB/init');
} catch (error) {
  console.error('Failed to initialize DB:', error.message);
}

// Start server
app.listen(port, () => {
  console.log(`Server is running on http://localhost:${port}`);
});
