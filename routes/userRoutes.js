const express = require('express');
const router = express.Router();
const userController = require('../controllers/userController');
const userValidator = require('../validators/userValidator');

router.get('/', userController.home);
router.get('/about', userController.about);
router.post('/', userValidator.validateUser, userController.createUser);

module.exports = router;
