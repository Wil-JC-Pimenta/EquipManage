const express = require('express');
const router = express.Router();
const certificadonr13Controller = require('../controllers/certificadonr13Controller');

router.get('/', certificadonr13Controller.getAllCertificates);
router.get('/:id', certificadonr13Controller.getCertificateById);
router.post('/', certificadonr13Controller.createCertificate);
router.put('/:id', certificadonr13Controller.updateCertificate);
router.delete('/:id', certificadonr13Controller.deleteCertificate);

module.exports = router;
