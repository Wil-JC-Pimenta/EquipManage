const express = require('express');
const router = express.Router();
const clienteController = require('../controllers/clienteController');
const clienteValidator = require('../validators/clienteValidator');

router.post('/', clienteValidator.validateCliente, clienteController.createCliente);

module.exports = router;
