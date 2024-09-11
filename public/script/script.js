document.addEventListener('DOMContentLoaded', function () {
    // Conversão de kgf/cm² para MPa
    const conversionFactor = 0.0980665;

    function calculateResults() {
        // Supondo que você tenha valores de entrada para a medição
        const inicioAbertura = parseFloat(document.querySelector('input[data-kgf="inicio-abertura"]').value) || 0;
        const aberturaReal = parseFloat(document.querySelector('input[data-kgf="abertura-real"]').value) || 0;
        const aberturaTeorica = 98; // Valor teórico ou esperado

        // Incertezas padrão (valores de exemplo)
        const uInstrument = 0.01;
        const uEnvironment = 0.02;
        const uProcedure = 0.015;

        // Calculando a incerteza combinada
        const uCombined = Math.sqrt(Math.pow(uInstrument, 2) + Math.pow(uEnvironment, 2) + Math.pow(uProcedure, 2));

        // Fator de abrangência (k) para um nível de confiança de 95%
        const kFactor = 2;

        // Calculando a incerteza expandida
        const uExpanded = uCombined * kFactor;

        // Calculando o erro
        const erro = (inicioAbertura - aberturaReal - (aberturaTeorica - aberturaReal)).toFixed(3);

        // Atualizando os valores nos campos
        document.getElementById('erro').value = erro;
        document.getElementById('u').value = uCombined.toFixed(3);
        document.getElementById('k').value = uExpanded.toFixed(3);

        // Convertendo valores para MPa e atualizando os campos correspondentes
        document.querySelector('input[data-mpa="inicio-abertura"]').value = (inicioAbertura * conversionFactor).toFixed(3);
        document.querySelector('input[data-mpa="abertura"]').value = (parseFloat(document.querySelector('input[data-kgf="abertura"]').value) * conversionFactor).toFixed(3);
        document.querySelector('input[data-mpa="abertura-real"]').value = (aberturaReal * conversionFactor).toFixed(3);
        document.querySelector('input[data-mpa="fechamento"]').value = (parseFloat(document.querySelector('input[data-kgf="fechamento"]').value) * conversionFactor).toFixed(3);
    }

    document.querySelectorAll('input[data-kgf]').forEach(input => {
        input.addEventListener('input', calculateResults);
    });

    // Upload e visualização de imagens
    const form = document.querySelector('.upload-form');
    const gallery = document.querySelector('.gallery');

    function updateGallery(files) {
        gallery.innerHTML = '';
        files.forEach((file, index) => {
            const reader = new FileReader();
            reader.onload = function (e) {
                const div = document.createElement('div');
                const img = document.createElement('img');
                img.src = e.target.result;
                const button = document.createElement('button');
                button.innerText = 'Remover';
                button.classList.add('remove-button');
                button.addEventListener('click', function () {
                    files.splice(index, 1);
                    updateGallery(files);
                });
                div.appendChild(img);
                div.appendChild(button);
                gallery.appendChild(div);
            };
            reader.readAsDataURL(file);
        });
    }

    form.addEventListener('submit', function (e) {
        e.preventDefault();
        const formData = new FormData(form);
        const files = [];
        for (let [name, value] of formData.entries()) {
            files.push(value);
        }
        updateGallery(files);
    });

    // Geração de PDF
    document.getElementById('generate-pdf').addEventListener('click', function () {
        html2canvas(document.body).then(canvas => {
            const imgData = canvas.toDataURL('image/png');
            const pdf = new jspdf.jsPDF();
            pdf.addImage(imgData, 'PNG', 0, 0);
            pdf.save('documento.pdf');
        });
    });

    // Chamando a função para calcular e atualizar os resultados
    calculateResults();
});
