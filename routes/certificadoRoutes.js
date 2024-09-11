const express = require('express');
const router = express.Router();
const certificadoController = require('../controllers/certificadoController');

router.post('/', certificadoController.createCertificate);
router.get('/', certificadoController.getCertificates);
router.get('/:id', certificadoController.getCertificateById);
router.put('/:id', certificadoController.updateCertificate);
router.delete('/:id', certificadoController.deleteCertificate);

module.exports = router;
