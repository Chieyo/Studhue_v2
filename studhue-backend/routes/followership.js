// followRoutes.js
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

// Follow a user
router.post('/follow/:followingId', authenticateToken, (req, res) => {
  const followerId = req.user.userId;
  const followingId = req.params.followingId;

  if (followerId === followingId) return res.status(400).json({ message: 'Cannot follow yourself' });

  db.run(
    'INSERT INTO Followers (follower_id, following_id) VALUES (?, ?)',
    [followerId, followingId],
    function (err) {
      if (err) return res.status(400).json({ message: 'Already following or error' });
      res.json({ message: 'Followed user' });
    }
  );
});

// Unfollow a user
router.delete('/unfollow/:followingId', authenticateToken, (req, res) => {
  const followerId = req.user.userId;
  const followingId = req.params.followingId;

  db.run(
    'DELETE FROM Followers WHERE follower_id = ? AND following_id = ?',
    [followerId, followingId],
    function (err) {
      if (err) return res.status(500).json({ message: 'DB error' });
      res.json({ message: 'Unfollowed user' });
    }
  );
});

module.exports = router;
