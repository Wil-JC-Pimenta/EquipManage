const { body, validationResult } = require('express-validator');

exports.validateFuncionario = [
    body('name').notEmpty().withMessage('Nome é obrigatório'),
    body('email').isEmail().withMessage('Email deve ser válido'),
    body('role').notEmpty().withMessage('Cargo é obrigatório'),
    (req, res, next) => {
        const errors = validationResult(req);
        if (!errors.isEmpty()) {
            return res.status(400).json({ errors: errors.array() });
        }
        next();
    }
];
