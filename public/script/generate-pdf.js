function generatePDF() {
    // Seleciona o elemento HTML que queremos converter para PDF
    const element = document.body;

    // Usa html2canvas para tirar uma "foto" do elemento
    html2canvas(element).then((canvas) => {
        const imgData = canvas.toDataURL('image/png');

        // Cria um novo documento PDF usando jsPDF
        const pdf = new jspdf.jsPDF('p', 'mm', 'a4');
        
        // Calcula a largura e a altura da imagem em mm
        const imgProps = pdf.getImageProperties(imgData);
        const pdfWidth = pdf.internal.pageSize.getWidth();
        const pdfHeight = (imgProps.height * pdfWidth) / imgProps.width;
        
        // Adiciona a imagem ao PDF
        pdf.addImage(imgData, 'PNG', 0, 0, pdfWidth, pdfHeight);
        
        // Salva o PDF com um nome
        pdf.save('certificado-nr13.pdf');
    });
}

