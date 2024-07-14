exports.validateEquipamento = (req, res, next) => {
  const { name, type, serialNumber } = req.body;

  if (!name || !type || !serialNumber) {
    return res.status(400).send('Nome, tipo e número de série são obrigatórios.');
  }

  next();
};
