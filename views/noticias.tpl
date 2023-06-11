{{ template "hola.tpl" . }}

{{ define "content" }}
<!DOCTYPE html>
<html>
<head>
    <title>Noticias de Fitness</title>
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

        .noticia {
            width: 100%;
            margin: 40px auto;
            padding: 20px;
            border: 1px solid #ccc;
            text-align: center;
            box-sizing: border-box;
        }

        .noticia img {
            max-width: 100%;
            height: auto;
            margin-bottom: 10px;
        }

        .noticia h2 {
            font-size: 20px;
            margin-bottom: 10px;
        }

        .noticia p {
            font-size: 14px;
            margin-bottom: 10px;
        }
        
        .title {
            text-align: center;
            margin-bottom: 40px;
            margin-top: 5%;
        }
    </style>
</head>
<body>
    <h1 class="title">Noticias de Fitness</h1>
    <div class="container1">
        {{ range $index, $noticia := .Noticias }}
        <div class="noticia">
            <img src="{{ $noticia.Imagen }}" alt="{{ $noticia.Titulo }}">
            <h2>{{ $noticia.Titulo }}</h2>
            <p>Fuente: {{ $noticia.Fuente }}</p>
            <p>{{ $noticia.Resumen }}</p>
            <p><a href="{{ $noticia.URL }}">Leer más</a></p>
        </div>
        {{ end }}
    </div>
    




</html>

{{ end }}
