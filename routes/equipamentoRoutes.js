const express = require('express');
const router = express.Router();
const equipamentoController = require('../controllers/equipamentoController');
const equipamentoValidator = require('../validators/equipamentoValidator');

router.post('/equipamento', equipamentoValidator.validateEquipamento, equipamentoController.createEquipamento);

module.exports = router;
