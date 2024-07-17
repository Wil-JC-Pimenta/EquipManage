const { body, validationResult } = require('express-validator');

exports.validateCertificado = [
  body('name').notEmpty().withMessage('Name is required'),
  body('clientId').isInt().withMessage('Client ID must be an integer'),
  body('equipmentId').isInt().withMessage('Equipment ID must be an integer'),
  (req, res, next) => {
    const errors = validationResult(req);
    if (!errors.isEmpty()) {
      return res.status(400).json({ errors: errors.array() });
    }
    next();
  }
];
