const express = require('express');
const router = express.Router();
const funcionarioController = require('../controllers/funcionarioController');
const funcionarioValidator = require('../validators/funcionarioValidator');

router.post('/', funcionarioValidator.validateFuncionario, funcionarioController.createFuncionario);
router.get('/', funcionarioController.getFuncionarios);
router.get('/:id', funcionarioController.getFuncionario);
router.put('/:id', funcionarioValidator.validateFuncionario, funcionarioController.updateFuncionario);
router.delete('/:id', funcionarioController.deleteFuncionario);

module.exports = router;
