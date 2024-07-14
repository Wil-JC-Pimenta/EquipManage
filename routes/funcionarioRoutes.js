const express = require('express');
const router = express.Router();
const funcionarioController = require('../controllers/funcionarioController');
const funcionarioValidator = require('../validators/funcionarioValidator');

router.post('/', funcionarioValidator.validateFuncionario, funcionarioController.createFuncionario);

module.exports = router;
