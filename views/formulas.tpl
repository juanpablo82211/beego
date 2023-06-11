{{ template "hola.tpl" . }}

{{ define "content" }}
<!DOCTYPE html>
<html>
<head>
    <title>Calculadora de Fórmulas</title>
    <style>
        body {
        background-color: #f2f2f2;
        font-family: Arial, sans-serif;
        justify-content: center;
        align-items: center;
        height: 100vh;
        background-color: #f0f7ed;
    }
    .container1 {
        max-width: 500px;
        margin-top: 50px; /* Ajusta el valor del margen superior según tus necesidades */
        padding: 20px;
        background-color: #ffffff;
        border-radius: 5px;
        box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
        text-align: left; /* Alinea el contenido a la izquierda */
    }
        .form-box {
            margin-bottom: 20px;
        }
        label {
            display: block;
            margin-bottom: 5px;
            color: #555555;
        }
        input[type="number"],
        select {
            width: 100%;
            padding: 10px;
            border: 1px solid #cccccc;
            border-radius: 4px;
            font-size: 14px;
        }
        input[type="submit"] {
            background-color: #22aaff;
            color: #ffffff;
            border: none;
            border-radius: 4px;
            padding: 10px 20px;
            cursor: pointer;
        }
        .result-box {
            background-color: #ffffff;
            border: 1px solid #cccccc;
            border-radius: 4px;
            padding: 20px;
        }
        .result-box p {
            margin-bottom: 10px;
        }
        .result-box p strong {
            color: #22aaff;
        }
        @media only screen and (max-width: 600px) {
            .container1 {
                max-width: 90%;
                padding: 10px;
            }
        }
          .carousel-container {
            width: 50%;
            height: 70%;
            overflow: hidden;
            position: absolute;
            top: 50%;
            right: 15%;
            transform: translateY(-50%);
        }

        .carousel-image {
            width: 100%;
            height: auto;
            position: fixed;
            transition: opacity 0.5s ease-in-out;
        }

        .carousel-image.hidden {
            opacity: 0;
        }

        .carousel-controls {
            position: absolute;
            bottom: 10px;
            left: 50%;
            transform: translateX(-50%);
            display: flex;
        }

        .carousel-controls button {
            background: none;
            border: none;
            outline: none;
            cursor: pointer;
            margin: 0 5px;
            font-size: 20px;
        }
    </style>
</head>
<body>
    <div class="container1">
        <h1 class="title">Calculadora de Fórmulas</h1>
        <div class="form-box">
            <form action="/calcular" method="post">
                <label for="edad">Edad (menor a 90 años):</label>
                <input type="number" name="edad" id="edad" required max="89">
                <br>
                <label for="sexo">Sexo:</label>
                <select name="sexo" id="sexo" required>
                    <option value="masculino">Masculino</option>
                    <option value="femenino">Femenino</option>
                </select>
                <br>
                <label for="peso">Peso en KG:</label>
                <input type="number" name="peso" id="peso" required>
                <br>
                <label for="estatura">Estatura (en centímetros):</label>
                <input type="number" name="estatura" id="estatura" required>
                <br>
                <label for="intensidad">Intensidad deportiva:</label>
                <select name="intensidad" id="intensidad" required>
                    <option value="0-1">0-1 vez por semana</option>
                    <option value="1-3">1-3 veces por semana</option>
                    <option value="3-5">3-5 veces por semana</option>
                    <option value="5-7">5-7 veces por semana</option>
                    <option value="7+">Más de 7 veces por semana</option>
                </select>
                <br>
                <input type="submit" value="Calcular">
            </form>
        </div>
        <div class="result-box">
            <h2>Resultados</h2>
            <p><strong>IMC:</strong> {{ printf "%.2f" .IMC }}</p>
            <p><strong>Fórmula de Mifflin-St Jeor (TMB):</strong> {{.TMB}}</p>
        </div>
    <div class="carousel-container">
    <img class="carousel-image" src="/static/img/imagen1.PNG" alt="Imagen 1" onclick="redirectTo('https://www.instagram.com/p/CsC4ylntWnj/')">
    <img class="carousel-image" src="/static/img/imagen2.PNG" alt="Imagen 2" onclick="redirectTo('https://www.instagram.com/p/CrJO4GIrjc9/')">
    <img class="carousel-image" src="/static/img/imagen3.PNG" alt="Imagen 3" onclick="redirectTo('https://www.instagram.com/p/CrHCHyTv4GK/')">
    <div class="carousel-controls">
        <button onclick="showImage(0)">1</button>
        <button onclick="showImage(1)">2</button>
        <button onclick="showImage(2)">3</button>
    </div>
</div>
   <script>
    function redirectTo(url) {
        window.open(url, '_blank');
    }
           var currentImage = 0;
        var images = document.getElementsByClassName('carousel-image');

        function showImage(index) {
            if (index !== currentImage) {
                images[currentImage].classList.add('hidden');
                images[index].classList.remove('hidden');
                currentImage = index;
            }
        }
    </script>
    </div>
</body>
</html>

{{ end }}
