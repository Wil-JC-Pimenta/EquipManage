document.addEventListener('DOMContentLoaded', function () {
    const form = document.querySelector('.upload-form');
    const gallery = document.querySelector('.gallery');

    form.addEventListener('submit', function (e) {
        e.preventDefault();
        const formData = new FormData(form);
        fetch('/upload', {
            method: 'POST',
            body: formData
        })
        .then(response => response.json())
        .then(files => {
            gallery.innerHTML = '';
            files.forEach(file => {
                const img = document.createElement('img');
                img.src = '/' + file;
                gallery.appendChild(img);
            });
        })
        .catch(error => console.error('Error:', error));
    });

    document.getElementById('generate-pdf').addEventListener('click', function () {
        window.location.href = '/generate-pdf';
    });
});