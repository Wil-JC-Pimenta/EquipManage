exports.createEquipamento = (req, res) => {
    const { id, name, type, serialNumber, clientId } = req.body;
    // Adicionar lógica para salvar o equipamento no banco de dados
    res.send(`Equipamento ${name} criado com sucesso!`);
  };
  