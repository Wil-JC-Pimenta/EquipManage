const Certificate = require('../certificates/certificateGenerator');
const Equipamento = require('../models/equipamentoModel');
const Cliente = require('../models/clienteModel');
const Funcionario = require('../models/funcionarioModel');

exports.createCertificate = async (req, res) => {
  const { equipamentoId, clienteId, funcionarioId, otherDetails } = req.body;

  try {
    const equipamento = await Equipamento.findByPk(equipamentoId);
    const cliente = await Cliente.findByPk(clienteId);
    const funcionario = await Funcionario.findByPk(funcionarioId);

    if (!equipamento || !cliente || !funcionario) {
      return res.status(400).send('Equipamento, Cliente ou Funcionário não encontrado');
    }

    const certificate = new Certificate(equipamento, cliente, funcionario, otherDetails);
    const certificateContent = certificate.generate();

    res.send(certificateContent);
  } catch (error) {
    res.status(500).send('Erro ao gerar certificado');
  }
};
