const axios = require('axios');
const certificadoService = require('../services/certificadoService');

exports.criarCertificado = async (req, res) => {
  const { equipamento_id, cliente_id, funcionario_id, other_details } = req.body;

  try {
    const equipamentoResponse = await axios.get(`http://localhost:3001/equipamentos/${equipamento_id}`);
    const clienteResponse = await axios.get(`http://localhost:3001/clientes/${cliente_id}`);
    const funcionarioResponse = await axios.get(`http://localhost:3001/funcionarios/${funcionario_id}`);

    const equipamento = equipamentoResponse.data;
    const cliente = clienteResponse.data;
    const funcionario = funcionarioResponse.data;

    const certificado = await certificadoService.createCertificate({
      equipamento_id,
      cliente_id,
      funcionario_id,
      otherDetails: other_details,
    });

    res.status(201).json(certificado);

  } catch (error) {
    if (error.response && error.response.status === 404) {
      return res.status(404).json({ message: 'Equipamento, Cliente ou Funcionário não encontrado' });
    }
    console.error(error);
    res.status(500).json({ message: 'Erro interno do servidor' });
  }
};
