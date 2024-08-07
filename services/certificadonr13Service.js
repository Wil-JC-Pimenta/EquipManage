const certificadonr13Model = require('../models/certificadonr13Model');

exports.getAllCertificates = () => {
    return certificadonr13Model.getAllCertificates();
};

exports.getCertificateById = (id) => {
    return certificadonr13Model.getCertificateById(id);
};

exports.createCertificate = (certificate) => {
    return certificadonr13Model.createCertificate(certificate);
};

exports.updateCertificate = (id, certificate) => {
    return certificadonr13Model.updateCertificate(id, certificate);
};

exports.deleteCertificate = (id) => {
    return certificadonr13Model.deleteCertificate(id);
};
