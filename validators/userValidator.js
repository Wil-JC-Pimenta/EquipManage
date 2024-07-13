exports.validateUser = (req, res, next) => {
  const { name, email } = req.body;
  console.log('Validating user:', name, email);

  if (!name || !email) {
    return res.status(400).send('Nome e email são obrigatórios.');
  }

  if (!/\S+@\S+\.\S+/.test(email)) {
    return res.status(400).send('Email inválido.');
  }

  next();
};
