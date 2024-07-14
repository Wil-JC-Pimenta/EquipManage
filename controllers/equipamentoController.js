exports.createEquipamento = (req, res) => {
  const { name, type, serialNumber } = req.body;
  res.send(`Equipamento ${name} do tipo ${type} com número de série ${serialNumber} criado com sucesso!`);
};
