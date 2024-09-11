exports.validateUser = (req, res, next) => {
  const { name, email, password } = req.body;

  if (!name || !email || !password) {
    return res.status(400).send('Nome, email e senha são obrigatórios.');
  }

  next();
};
