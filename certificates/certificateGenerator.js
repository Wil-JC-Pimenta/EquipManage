class Certificate {
    constructor(equipamento, cliente, funcionario, otherDetails) {
      this.equipamento = equipamento;
      this.cliente = cliente;
      this.funcionario = funcionario;
      this.otherDetails = otherDetails;
    }
  
    generate() {
      // Adicione a lógica para gerar o certificado, possivelmente salvando em um arquivo PDF
      return `
        Certificado de Calibração
  
        Dados do Equipamento:
        Nome: ${this.equipamento.name}
        Tipo: ${this.equipamento.type}
        Número de Série: ${this.equipamento.serialNumber}
  
        Dados do Cliente:
        Nome: ${this.cliente.name}
        Email: ${this.cliente.email}
        Endereço: ${this.cliente.address}
  
        Dados do Funcionário:
        Nome: ${this.funcionario.name}
        Cargo: ${this.funcionario.role}
  
        Outros Detalhes:
        ${this.otherDetails}
  
        Certificado gerado com sucesso!
      `;
    }
  }
  
  module.exports = Certificate;
  