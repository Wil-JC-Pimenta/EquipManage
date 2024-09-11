exports.validateCliente = (req, res, next) => {
  const { name, email, address } = req.body;

  if (!name || !email || !address) {
    return res.status(400).send('Nome, email e endereço são obrigatórios.');
  }

  next();
};
