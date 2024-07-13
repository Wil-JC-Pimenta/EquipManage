exports.createFuncionario = (req, res) => {
    const { id, name, email, role } = req.body;
    // Adicionar lógica para salvar o funcionário no banco de dados
    res.send(`Funcionário ${name} criado com sucesso!`);
  };
  