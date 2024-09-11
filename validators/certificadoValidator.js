const { body, validationResult } = require('express-validator');

exports.validateCertificado = [
  body('equipamento_id').isInt().withMessage('Equipment ID must be an integer'),
  body('cliente_id').isInt().withMessage('Client ID must be an integer'),
  body('funcionario_id').isInt().withMessage('Employee ID must be an integer'),
  (req, res, next) => {
    const errors = validationResult(req);
    if (!errors.isEmpty()) {
      return res.status(400).json({ errors: errors.array() });
    }
    next();
  }
];
