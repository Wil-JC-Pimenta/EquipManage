const Admin = require('../models/adminModel');

exports.createAdmin = async (adminData) => {
  const { name, email, password } = adminData;
  const admin = await Admin.create({ name, email, password });
  return admin;
};

exports.getAdmins = async () => {
  const admins = await Admin.findAll();
  return admins;
};

exports.getAdminById = async (id) => {
  const admin = await Admin.findByPk(id);
  return admin;
};

exports.updateAdmin = async (id, adminData) => {
  const { name, email, password } = adminData;
  const admin = await Admin.findByPk(id);
  if (!admin) return null;
  admin.name = name;
  admin.email = email;
  admin.password = password;
  await admin.save();
  return admin;
};

exports.deleteAdmin = async (id) => {
  const admin = await Admin.findByPk(id);
  if (!admin) return null;
  await admin.destroy();
  return admin;
};
