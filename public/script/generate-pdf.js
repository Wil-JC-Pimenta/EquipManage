window.jsPDF = window.jspdf.jsPDF;

function generatePDF() {
    html2canvas(document.body).then(function(canvas) {
        const imgData = canvas.toDataURL('image/png');
        const pdf = new jsPDF();
        pdf.addImage(imgData, 'PNG', 0, 0);
        pdf.save('certificado-nr13.pdf');
    });
}

document.getElementById('generate-pdf').addEventListener('click', generatePDF);
