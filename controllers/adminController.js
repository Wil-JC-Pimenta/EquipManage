exports.createAdmin = (req, res) => {
  const { name, email, password } = req.body;
  res.send(`Admin ${name} com email ${email} criado com sucesso!`);
};
