'use strict';

module.exports = {
  up: async (queryInterface, Sequelize) => {
    await queryInterface.addColumn('certificados', 'createdAt', {
      type: Sequelize.DATE,
      allowNull: true, // Permitir nulos temporariamente
    });

    await queryInterface.addColumn('certificados', 'updatedAt', {
      type: Sequelize.DATE,
      allowNull: true, // Permitir nulos temporariamente
    });

    // Atualizar registros existentes com timestamps
    await queryInterface.sequelize.query(`
      UPDATE certificados
      SET "createdAt" = NOW(), "updatedAt" = NOW()
      WHERE "createdAt" IS NULL OR "updatedAt" IS NULL;
    `);

    // Definir colunas como NOT NULL após atualizar registros existentes
    await queryInterface.changeColumn('certificados', 'createdAt', {
      type: Sequelize.DATE,
      allowNull: false,
    });

    await queryInterface.changeColumn('certificados', 'updatedAt', {
      type: Sequelize.DATE,
      allowNull: false,
    });
  },

  down: async (queryInterface, Sequelize) => {
    await queryInterface.removeColumn('certificados', 'createdAt');
    await queryInterface.removeColumn('certificados', 'updatedAt');
  }
};
