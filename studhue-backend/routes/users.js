// userRoutes.js
const express = require('express');
const router = express.Router();
const sqlite3 = require('sqlite3').verbose();
const db = new sqlite3.Database('./db/database.sqlite');
const bcrypt = require('bcrypt');
const jwt = require('jsonwebtoken');

const SECRET_KEY = 'your_secret_key'; // replace with env variable in prod

// Signup
router.post('/signup', async (req, res) => {
  const { email, username, password } = req.body;
  if (!email || !username || !password) return res.status(400).json({ message: 'Missing fields' });

  const hashedPassword = await bcrypt.hash(password, 10);

  db.run(
    'INSERT INTO Users (user_ID, email, username, password, account_date_creation) VALUES (?, ?, ?, ?, ?)',
    [Date.now().toString(), email, username, hashedPassword, new Date().toISOString()],
    function (err) {
      if (err) {
        return res.status(400).json({ message: 'User already exists or DB error' });
      }
      res.json({ message: 'User created' });
    }
  );
});

// Login
router.post('/login', (req, res) => {
  const { username, password } = req.body;
  db.get('SELECT * FROM Users WHERE username = ?', [username], async (err, user) => {
    if (err) return res.status(500).json({ message: 'DB error' });
    if (!user) return res.status(401).json({ message: 'Invalid username or password' });

    const validPassword = await bcrypt.compare(password, user.password);
    if (!validPassword) return res.status(401).json({ message: 'Invalid username or password' });

    // Generate JWT token
    const token = jwt.sign({ userId: user.user_ID, username: user.username }, SECRET_KEY, { expiresIn: '1d' });
    res.json({ token, userId: user.user_ID, username: user.username });
  });
});

module.exports = router;
