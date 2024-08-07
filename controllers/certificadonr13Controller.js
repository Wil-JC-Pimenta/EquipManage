const { CertificadoNR13 } = require('../models/certificadonr13Model');

exports.getAllCertificates = async (req, res) => {
  try {
    const certificates = await CertificadoNR13.findAll();
    res.status(200).json(certificates);
  } catch (error) {
    res.status(500).json({ message: error.message });
  }
};

exports.getCertificateById = async (req, res) => {
  try {
    const certificate = await CertificadoNR13.findByPk(req.params.id);
    if (!certificate) return res.status(404).json({ message: 'Certificate not found' });
    res.status(200).json(certificate);
  } catch (error) {
    res.status(500).json({ message: error.message });
  }
};

exports.createCertificate = async (req, res) => {
  try {
    const newCertificate = await CertificadoNR13.create(req.body);
    res.status(201).json(newCertificate);
  } catch (error) {
    res.status(500).json({ message: error.message });
  }
};

exports.updateCertificate = async (req, res) => {
  try {
    const [updated] = await CertificadoNR13.update(req.body, {
      where: { id: req.params.id }
    });
    if (!updated) return res.status(404).json({ message: 'Certificate not found' });
    const updatedCertificate = await CertificadoNR13.findByPk(req.params.id);
    res.status(200).json(updatedCertificate);
  } catch (error) {
    res.status(500).json({ message: error.message });
  }
};

exports.deleteCertificate = async (req, res) => {
  try {
    const deleted = await CertificadoNR13.destroy({
      where: { id: req.params.id }
    });
    if (!deleted) return res.status(404).json({ message: 'Certificate not found' });
    res.status(204).json({ message: 'Certificate deleted' });
  } catch (error) {
    res.status(500).json({ message: error.message });
  }
};
