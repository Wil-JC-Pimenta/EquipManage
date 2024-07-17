const express = require('express');
const router = express.Router();
const certificadoController = require('../controllers/certificadoController');

router.post('/certificados', certificadoController.criarCertificado);

module.exports = router;