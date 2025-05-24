const express = require('express');
const bcrypt = require('bcrypt');
const jwt = require('jsonwebtoken');

const SECRET_KEY = 'your_secret_key'; // Replace with env var in production

module.exports = function (db) {
  const router = express.Router();

  // Test route to check if the user route is working
  router.get('/test', (req, res) => {
    res.json({ message: "User route works!" });
  });

  // Signup
  router.post('/signup', async (req, res) => {
    const { email, username, password } = req.body;
    if (!email || !username || !password) {
      return res.status(400).json({ message: 'Missing fields' });
    }

    const hashedPassword = await bcrypt.hash(password, 10);

    db.run(
      'INSERT INTO Users (user_ID, email, username, password, account_date_creation) VALUES (?, ?, ?, ?, ?)',
      [Date.now().toString(), email, username, hashedPassword, new Date().toISOString()],
      function (err) {
        if (err) {
          return res.status(400).json({ message: 'User already exists or DB error', error: err.message });
        }
        res.json({ message: 'User created' });
      }
    );
  });

  // Login
  router.post('/login', (req, res) => {
    const { username, password } = req.body;
    db.get('SELECT * FROM Users WHERE username = ?', [username], async (err, user) => {
      if (err) return res.status(500).json({ message: 'DB error', error: err.message });
      if (!user) return res.status(401).json({ message: 'Invalid username or password' });

      const validPassword = await bcrypt.compare(password, user.password);
      if (!validPassword) return res.status(401).json({ message: 'Invalid username or password' });

      const token = jwt.sign({ userId: user.user_ID, username: user.username }, SECRET_KEY, { expiresIn: '1d' });
      res.json({ token, userId: user.user_ID, username: user.username });
    });
  });

  return router;
};
