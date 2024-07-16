const express = require('express');
const router = express.Router();
const clienteController = require('../controllers/clienteController');
const clienteValidator = require('../validators/clienteValidator');

router.post('/', clienteValidator.validateCliente, clienteController.createCliente);
router.get('/', clienteController.getClientes);
router.get('/:id', clienteController.getClienteById);
router.put('/:id', clienteValidator.validateCliente, clienteController.updateCliente);
router.delete('/:id', clienteController.deleteCliente);

module.exports = router;
