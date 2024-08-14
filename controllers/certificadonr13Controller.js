const certificadonr13Service = require('../services/certificadonr13Service');

exports.getAllCertificates = async (req, res) => {
    try {
        const certificates = await certificadonr13Service.getAllCertificates();
        res.status(200).json(certificates);
    } catch (error) {
        res.status(500).json({ message: error.message });
    }
};

exports.getCertificateById = async (req, res) => {
    try {
        const certificate = await certificadonr13Service.getCertificateById(req.params.id);
        if (!certificate) return res.status(404).json({ message: 'Certificate not found' });
        res.status(200).json(certificate);
    } catch (error) {
        res.status(500).json({ message: error.message });
    }
};

exports.createCertificate = async (req, res) => {
    try {
        const newCertificate = await certificadonr13Service.createCertificate(req.body);
        res.status(201).json(newCertificate);
    } catch (error) {
        res.status(500).json({ message: error.message });
    }
};

exports.updateCertificate = async (req, res) => {
    try {
        const updatedCertificate = await certificadonr13Service.updateCertificate(req.params.id, req.body);
        if (!updatedCertificate) return res.status(404).json({ message: 'Certificate not found' });
        res.status(200).json(updatedCertificate);
    } catch (error) {
        res.status(500).json({ message: error.message });
    }
};

exports.deleteCertificate = async (req, res) => {
    try {
        const deletedCertificate = await certificadonr13Service.deleteCertificate(req.params.id);
        if (!deletedCertificate) return res.status(404).json({ message: 'Certificate not found' });
        res.status(200).json({ message: 'Certificate deleted' });
    } catch (error) {
        res.status(500).json({ message: error.message });
    }
};
