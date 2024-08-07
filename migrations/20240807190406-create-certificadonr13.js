'use strict';
module.exports = {
  up: async (queryInterface, Sequelize) => {
    await queryInterface.createTable('certificadonr13', {
      id: {
        allowNull: false,
        autoIncrement: true,
        primaryKey: true,
        type: Sequelize.INTEGER
      },
      registroEntrada: {
        type: Sequelize.STRING
      },
      numeroPatrimonio: {
        type: Sequelize.STRING
      },
      numeroContrato: {
        type: Sequelize.STRING
      },
      cliente: {
        type: Sequelize.STRING
      },
      instrumento: {
        type: Sequelize.STRING
      },
      tag: {
        type: Sequelize.STRING
      },
      tagVaso: {
        type: Sequelize.STRING
      },
      fabricante: {
        type: Sequelize.STRING
      },
      modelo: {
        type: Sequelize.STRING
      },
      numeroSerie: {
        type: Sequelize.STRING
      },
      pressaoAjuste: {
        type: Sequelize.DECIMAL(10, 2)
      },
      diametro: {
        type: Sequelize.DECIMAL(10, 2)
      },
      diametroOrificio: {
        type: Sequelize.DECIMAL(10, 2)
      },
      tipo: {
        type: Sequelize.STRING
      },
      cor: {
        type: Sequelize.STRING
      },
      fluido: {
        type: Sequelize.STRING
      },
      vazao: {
        type: Sequelize.DECIMAL(10, 2)
      },
      contraPressao: {
        type: Sequelize.DECIMAL(10, 2)
      },
      temperaturaOperacao: {
        type: Sequelize.DECIMAL(10, 2)
      },
      certificado: {
        type: Sequelize.STRING
      },
      equipamento: {
        type: Sequelize.STRING
      },
      patrimonio: {
        type: Sequelize.STRING
      },
      validade: {
        type: Sequelize.DATE
      },
      procedimentosUtilizados: {
        type: Sequelize.TEXT
      },
      temperaturaAmbiente: {
        type: Sequelize.DECIMAL(10, 2)
      },
      humidadeRelativa: {
        type: Sequelize.DECIMAL(10, 2)
      },
      local: {
        type: Sequelize.STRING
      },
      dataEnsaio: {
        type: Sequelize.DATE
      },
      proximoEnsaio: {
        type: Sequelize.DATE
      },
      valorInicioAberturaKgf: {
        type: Sequelize.DECIMAL(10, 2)
      },
      valorAberturaKgf: {
        type: Sequelize.DECIMAL(10, 2)
      },
      valorAberturaRealKgf: {
        type: Sequelize.DECIMAL(10, 2)
      },
      valorFechamentoKgf: {
        type: Sequelize.DECIMAL(10, 2)
      },
      valorInicioAberturaMpa: {
        type: Sequelize.DECIMAL(10, 2)
      },
      valorAberturaMpa: {
        type: Sequelize.DECIMAL(10, 2)
      },
      valorAberturaRealMpa: {
        type: Sequelize.DECIMAL(10, 2)
      },
      valorFechamentoMpa: {
        type: Sequelize.DECIMAL(10, 2)
      },
      erro: {
        type: Sequelize.DECIMAL(10, 2)
      },
      u: {
        type: Sequelize.DECIMAL(10, 2)
      },
      k: {
        type: Sequelize.DECIMAL(10, 2)
      },
      numeroLacre: {
        type: Sequelize.STRING
      },
      observacoes: {
        type: Sequelize.TEXT
      },
      servicosExecutados: {
        type: Sequelize.TEXT
      },
      createdAt: {
        allowNull: false,
        type: Sequelize.DATE
      },
      updatedAt: {
        allowNull: false,
        type: Sequelize.DATE
      }
    });
  },
  down: async (queryInterface, Sequelize) => {
    await queryInterface.dropTable('certificadonr13');
  }
};
