const express = require('express');
const router = express.Router();
const adminController = require('../controllers/adminController');
const adminValidator = require('../validators/adminValidator');

router.post('/', adminValidator.validateAdmin, adminController.createAdmin);
router.get('/', adminController.getAdmins);
router.get('/:id', adminController.getAdminById);
router.put('/:id', adminValidator.validateAdmin, adminController.updateAdmin);
router.delete('/:id', adminController.deleteAdmin);

module.exports = router;
