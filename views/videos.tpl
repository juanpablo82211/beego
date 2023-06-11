{{ template "hola.tpl" . }}

{{ define "content" }}
<!DOCTYPE html>
<html>
<head>
    <title>Subir video</title>
    <style>
        .container1 {
            display: flex;
            justify-content: center;
            align-items: center;
            flex-wrap: wrap;
            max-width: 1200px;
            margin: 0 auto;
            padding: 20px;
        }

        .video-container {
            width: 100%;
            margin-bottom: 20px;
        }

        .video-container video {
            width: 100%;
            height: auto;
        }

        .button-container {
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
            align-items: center;
            max-height: 700px; /* Altura máxima del contenedor */
            overflow-y: auto; /* Mostrar scroll si se supera la altura máxima */
        }

        .button-container button {
            margin: 5px;
        }

        .title {
            text-align: center;
            margin-bottom: 40px;
            margin-top: 5%;
        }
    </style>
</head>
<body>
    <h1 class="title">Subir video</h1>
    <div class="container1">
        <form action="{{.Action}}" method="post" enctype="multipart/form-data">
            <input type="file" name="video" accept="video/*">
            <input type="submit" value="Subir">
        </form>

        {{ if .Error }}
        <div class="error">{{ .Error }}</div>
        {{ end }}

        <div class="button-container">
            {{ range .Videos }}
                <div class="video-container">
                    <video controls>
                        <source src="{{ .FilePath }}" type="video/mp4">
                        Tu navegador no admite la etiqueta de video.
                    </video>
                    <button onclick="playVideo('{{ .FilePath }}')">Reproducir</button>
                </div>
            {{ end }}
        </div>
    </div>

    <script>
        function showSuccessMessage(message) {
            var successMessage = document.createElement('div');
            successMessage.className = 'success-message';
            successMessage.textContent = message;
            document.body.appendChild(successMessage);

            setTimeout(function() {
                successMessage.remove();
            }, 5000); // Desaparecer después de 5 segundos
        }

        function playVideo(filePath) {
            var videoPlayer = document.querySelector('video');
            videoPlayer.src = filePath;
        }

        // Obtener el mensaje de éxito de los datos enviados por el controlador
        var successMessage = "{{ .Success }}";
        if (successMessage) {
            showSuccessMessage(successMessage);
        }
    </script>
</body>
</html>
{{ end }}
