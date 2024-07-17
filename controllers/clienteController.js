const Cliente = require('../models/clienteModel'); // Ajuste o caminho conforme necessário
const Equipamento = require('../models/equipamentoModel'); // Ajuste o caminho conforme necessário

exports.createCliente = async (req, res) => {
  try {
    const { name, email, address } = req.body;
    const cliente = await Cliente.create({ name, email, address });
    res.status(201).json(cliente);
  } catch (error) {
    console.error(error);
    res.status(500).send('Erro ao criar cliente');
  }
};

exports.getClientes = async (req, res) => {
  try {
    const clientes = await Cliente.findAll();
    res.status(200).json(clientes);
  } catch (error) {
    console.error(error);
    res.status(500).send('Erro ao buscar clientes');
  }
};

exports.getClienteById = async (req, res) => {
  try {
    const { id } = req.params;
    const cliente = await Cliente.findByPk(id);
    if (cliente) {
      res.status(200).json(cliente);
    } else {
      res.status(404).send('Cliente não encontrado');
    }
  } catch (error) {
    console.error(error);
    res.status(500).send('Erro ao buscar cliente');
  }
};

exports.updateCliente = async (req, res) => {
  try {
    const { id } = req.params;
    const { name, email, address } = req.body;
    const cliente = await Cliente.findByPk(id);
    if (cliente) {
      cliente.name = name;
      cliente.email = email;
      cliente.address = address;
      await cliente.save();
      res.status(200).json(cliente);
    } else {
      res.status(404).send('Cliente não encontrado');
    }
  } catch (error) {
    console.error(error);
    res.status(500).send('Erro ao atualizar cliente');
  }
};

exports.deleteCliente = async (req, res) => {
  try {
    const { id } = req.params;
    console.log(`Recebendo solicitação para deletar cliente com ID: ${id}`);
    
    // Verificar se há equipamentos associados ao cliente
    const equipamentosAssociados = await Equipamento.findOne({ where: { clienteId: id } });

    if (equipamentosAssociados) {
      return res.status(400).send('Não é possível deletar o cliente. Existem equipamentos associados a este cliente.');
    }

    const cliente = await Cliente.findByPk(id);

    if (cliente) {
      await cliente.destroy();
      console.log(`Cliente com ID: ${id} deletado com sucesso`);
      res.status(204).send();
    } else {
      console.log(`Cliente com ID: ${id} não encontrado`);
      res.status(404).send('Cliente não encontrado');
    }
  } catch (error) {
    console.error('Erro ao deletar cliente:', error);
    res.status(500).send('Erro ao deletar cliente');
  }
};
