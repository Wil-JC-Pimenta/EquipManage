const certificadoService = require('../services/certificadoService');

exports.createCertificate = async (req, res) => {
  const { equipamento_id, cliente_id, funcionario_id, otherDetails } = req.body;

  try {
    const certificado = await certificadoService.createCertificate({
      equipamento_id,
      cliente_id,
      funcionario_id,
      otherDetails,
    });
    res.status(201).json(certificado);
  } catch (error) {
    console.error(error);
    res.status(500).json({ message: 'Erro interno do servidor' });
  }
};

exports.getCertificates = async (req, res) => {
  try {
    const certificados = await certificadoService.getCertificates();
    res.json(certificados);
  } catch (error) {
    console.error(error);
    res.status(500).json({ message: 'Erro interno do servidor' });
  }
};

exports.getCertificateById = async (req, res) => {
  const { id } = req.params;

  try {
    const certificado = await certificadoService.getCertificateById(id);
    if (!certificado) {
      return res.status(404).json({ message: 'Certificado não encontrado' });
    }
    res.json(certificado);
  } catch (error) {
    console.error(error);
    res.status(500).json({ message: 'Erro interno do servidor' });
  }
};

exports.updateCertificate = async (req, res) => {
  const { id } = req.params;
  const { equipamento_id, cliente_id, funcionario_id, otherDetails } = req.body;

  try {
    const updatedCertificado = await certificadoService.updateCertificate(id, {
      equipamento_id,
      cliente_id,
      funcionario_id,
      otherDetails,
    });
    if (!updatedCertificado) {
      return res.status(404).json({ message: 'Certificado não encontrado' });
    }
    res.json(updatedCertificado);
  } catch (error) {
    console.error(error);
    res.status(500).json({ message: 'Erro interno do servidor' });
  }
};

exports.deleteCertificate = async (req, res) => {
  const { id } = req.params;

  try {
    const deleted = await certificadoService.deleteCertificate(id);
    if (!deleted) {
      return res.status(404).json({ message: 'Certificado não encontrado' });
    }
    res.status(204).end();
  } catch (error) {
    console.error(error);
    res.status(500).json({ message: 'Erro interno do servidor' });
  }
};
