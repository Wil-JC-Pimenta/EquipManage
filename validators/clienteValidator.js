exports.validateCliente = (req, res, next) => {
    const { name, email, address, phone } = req.body;
  
    if (!name || !email || !address || !phone) {
      return res.status(400).send('Nome, email, endereço e telefone são obrigatórios.');
    }
  
    next();
  };
  