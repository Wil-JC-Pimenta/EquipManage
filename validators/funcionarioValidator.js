exports.validateFuncionario = (req, res, next) => {
  const { name, email, role } = req.body;

  if (!name || !email || !role) {
    return res.status(400).send('Nome, email e cargo são obrigatórios.');
  }

  next();
};
