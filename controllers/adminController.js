exports.createAdmin = (req, res) => {
    const { id, name, email, password } = req.body;
    // Adicionar lógica para salvar o admin no banco de dados
    res.send(`Admin ${name} criado com sucesso!`);
  };
  