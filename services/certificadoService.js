const Certificate = require('../models/certificadoModel');
const Equipment = require('../models/equipamentoModel');
const Client = require('../models/clienteModel');
const Employee = require('../models/funcionarioModel');

class CertificadoService {
  async createCertificate(data) {
    return await Certificate.create(data);
  }

  async getCertificates() {
    return await Certificate.findAll({
      include: [
        { model: Equipment, as: 'equipamento' },
        { model: Client, as: 'cliente' },
        { model: Employee, as: 'funcionario' }
      ]
    });
  }

  async getCertificateById(id) {
    return await Certificate.findByPk(id, {
      include: [
        { model: Equipment, as: 'equipamento' },
        { model: Client, as: 'cliente' },
        { model: Employee, as: 'funcionario' }
      ]
    });
  }

  async updateCertificate(id, data) {
    const certificate = await Certificate.findByPk(id);
    if (certificate) {
      return await certificate.update(data);
    }
    return null;
  }

  async deleteCertificate(id) {
    const certificate = await Certificate.findByPk(id);
    if (certificate) {
      await certificate.destroy();
      return true;
    }
    return false;
  }
}

module.exports = new CertificadoService();
