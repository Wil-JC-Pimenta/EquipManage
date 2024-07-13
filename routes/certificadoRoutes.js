const express = require('express');
const router = express.Router();
const certificadoController = require('../controllers/certificadoController');

router.post('/', certificadoController.createCertificate);

module.exports = router;
