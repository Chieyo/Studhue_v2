// pinboardRoutes.js
const express = require('express');
const router = express.Router();
const sqlite3 = require('sqlite3').verbose();
const db = new sqlite3.Database('./db/database.sqlite');
const jwt = require('jsonwebtoken');

const SECRET_KEY = 'your_secret_key';

function authenticateToken(req, res, next) {
  const authHeader = req.headers['authorization'];
  const token = authHeader && authHeader.split(' ')[1];
  if (!token) return res.sendStatus(401);

  jwt.verify(token, SECRET_KEY, (err, user) => {
    if (err) return res.sendStatus(403);
    req.user = user;
    next();
  });
}

// Pin a post to pinboard
router.post('/pin', authenticateToken, (req, res) => {
  const { board_ID, post_ID } = req.body;
  const userId = req.user.userId;

  // Optionally verify board belongs to user here...

  db.run(
    'INSERT INTO Pinboard_Posts (board_ID, post_ID) VALUES (?, ?)',
    [board_ID, post_ID],
    function (err) {
      if (err) return res.status(400).json({ message: 'Already pinned or error' });
      res.json({ message: 'Post pinned to pinboard' });
    }
  );
});

// Unpin a post from pinboard
router.delete('/pin', authenticateToken, (req, res) => {
  const { board_ID, post_ID } = req.body;
  const userId = req.user.userId;

  db.run(
    'DELETE FROM Pinboard_Posts WHERE board_ID = ? AND post_ID = ?',
    [board_ID, post_ID],
    function (err) {
      if (err) return res.status(500).json({ message: 'DB error' });
      res.json({ message: 'Post unpinned from pinboard' });
    }
  );
});

module.exports = router;
