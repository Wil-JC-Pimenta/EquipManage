exports.validateEquipamento = (req, res, next) => {
    const { name, type, serialNumber, clientId } = req.body;
  
    if (!name || !type || !serialNumber || !clientId) {
      return res.status(400).send('Nome, tipo, número de série e ID do cliente são obrigatórios.');
    }
  
    next();
  };
  