const express = require('express');
const router = express.Router();
const userController = require('../controllers/userController');
const userValidator = require('../validators/userValidator');


router.post('/', userValidator.validateUser, userController.createUser);
router.get('/', userController.getUsers);
router.get('/:id', userController.getUser);
router.put('/:id', userValidator.validateUser, userController.updateUser);
router.delete('/:id', userController.deleteUser);

module.exports = router;
