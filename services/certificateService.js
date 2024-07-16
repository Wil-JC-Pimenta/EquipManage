// services/certificate.service.js

const Certificate = require('../models/certificate.model');
const Equipment = require('../models/equipment.model');
const Client = require('../models/client.model');
const Employee = require('../models/employee.model');

class CertificateService {
  async createCertificate(data) {
    return await Certificate.create(data);
  }

  async getCertificates() {
    return await Certificate.findAll({
      include: [Equipment, Client, Employee]
    });
  }

  async getCertificateById(id) {
    return await Certificate.findByPk(id, {
      include: [Equipment, Client, Employee]
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

module.exports = new CertificateService();
