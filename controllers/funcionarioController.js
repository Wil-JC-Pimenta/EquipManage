exports.createFuncionario = (req, res) => {
  const { name, email, role } = req.body;
  res.send(`Funcionário ${name} com email ${email} e cargo ${role} criado com sucesso!`);
};
