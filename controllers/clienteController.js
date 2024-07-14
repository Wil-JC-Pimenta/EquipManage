exports.createCliente = (req, res) => {
  const { name, email, address } = req.body;
  res.send(`Cliente ${name} com email ${email} e endereço ${address} criado com sucesso!`);
};
