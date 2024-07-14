const express = require('express');
const router = express.Router();
const adminController = require('../controllers/adminController');
const adminValidator = require('../validators/adminValidator');

router.post('/', adminValidator.validateAdmin, adminController.createAdmin);

module.exports = router;
