const path = require('path');

exports.home = (req, res) => {
  res.sendFile(path.join(__dirname, '../views/index.html'));
};

exports.about = (req, res) => {
  res.sendFile(path.join(__dirname, '../views/about.html'));
};

exports.createUser = (req, res) => {
  const { name, email } = req.body;
  res.send(`Usuário ${name} com email ${email} criado com sucesso!`);
};
