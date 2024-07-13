const express = require('express');
const router = express.Router();
const userController = require('../controllers/userController');
const userValidator = require('../validators/userValidator');

router.get('/', (req, res) => {
  console.log('GET /');
  userController.home(req, res);
});

router.get('/about', (req, res) => {
  console.log('GET /about');
  userController.about(req, res);
});

router.post('/user', (req, res, next) => {
  console.log('POST /user');
  userValidator.validateUser(req, res, next);
}, (req, res) => {
  userController.createUser(req, res);
});

module.exports = router;
