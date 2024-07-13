exports.createCliente = (req, res) => {
    const { id, name, email, address, phone } = req.body;
    // Adicionar lógica para salvar o cliente no banco de dados
    res.send(`Cliente ${name} criado com sucesso!`);
  };
  