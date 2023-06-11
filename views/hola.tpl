<!DOCTYPE html>
<html>
<head>
    <title>Página de inicio</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">

    <style>
        /* Estilos para el navbar */
        nav {
            background-color: #9ccc65;
            padding: 20px;
            display: flex;
            flex-wrap: wrap;
            justify-content: space-between;
            align-items: center;
            font-size: 20px;
        }

        .logo-container {
            display: flex;
            align-items: center;
        }

        .logo {
            width: 40px;
            height: 40px;
            margin-right: 10px;
        }

        nav a {
            margin-right: 10px;
            text-decoration: none;
            color: #fff;
            font-weight: bold;
            transition: color 0.3s;
        }

        nav a:hover {
            color: #fff;
            text-decoration: underline;
        }

        /* Estilos para el contenido principal */
        body {
            font-family: Arial, sans-serif;
            background-color: #f0f7ed;
            margin: 0;
            padding-bottom: 60px;
        }

        .header {
            text-align: center;
            padding: 20px;
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            margin-top: 20px;
        }

        .logo img {
            width: 150px;
            height: auto;
            max-width: 100%;
        }

        h1 {
            color: #4caf50;
            font-size: 48px;
            margin: 0;
            font-weight: bold;
        }

        p {
            color: #333;
            font-size: 20px;
            margin-top: 10px;
        }

        .container {
            max-width: 400px;
            margin: 20px;
            padding: 40px;
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            text-align: center;
            transition: transform 0.3s;
        }

        .container:hover {
            transform: translateY(-5px);
        }

        .container h3 {
            color: #4caf50;
            margin-top: 0;
            font-size: 24px;
            font-weight: bold;
        }

        .container p {
            font-size: 18px;
            margin: 10px 0;
        }

        .container ul {
            list-style-type: none;
            padding: 0;
        }

        .container li {
            margin-bottom: 10px;
        }

        .container li::before {
            content: "";
            display: inline-block;
            width: 8px;
            height: 8px;
            background-color: #9ccc65;
            margin-right: 5px;
            border-radius: 50%;
        }

        .pricing {
            display: flex;
            justify-content: center;
            margin-top: 60px;
        }

        /* Estilos para el footer */
        footer {
            position: fixed;
            bottom: 0;
            right: 0;
            width: 100%;
            background-color: #f2f2f2;
            padding: 10px;
            display: flex;
            align-items: center;
            justify-content: flex-end;
        }

        .footer-icon {
            margin-right: 5px;
        }

        .footer-message {
            margin-right: 10px;
            color: #333;
            font-weight: bold;
        }

        /* Estilos para navbar responsive */
        @media (max-width: 768px) {
            nav {
                flex-direction: column;
                align-items: flex-start;
            }

            nav a {
                margin-bottom: 10px;
            }

            .logo-container {
                margin-bottom: 10px;
            }
        }
    </style>
</head>
<body>
    <nav>
        <div class="logo-container">
            <a href="/" class="logo"><img src="/static/img/logo.jpeg" alt="Logo Nutri"></a>
            <a href="/">Nutri</a>
        </div>
        <div>
            <a href="/videos">Videos</a>
            <a href="/noticias">Noticias</a>
            <a href="/formulas">Fórmulas</a>
        </div>
        <div>
            <a href="/logout">Cerrar sesión</a>
            <a href="/login">Iniciar Sesión</a>
        </div>
    </nav>
    {{ template "content" . }}
    <footer>
        <span class="footer-icon"><i class="fab fa-instagram"></i></span>
        <span><a href="https://www.instagram.com/macca_nutrition/" target="_blank">@macca_nutrition</a></span>
        <span>&nbsp;</span>
        <span>&nbsp;</span>
        <span>&nbsp;</span>
        <span class="footer-icon"><i class="fas fa-phone"></i></span>
        <span><a href="https://wa.me/573225901624" target="_blank">WhatsApp</a></span>
    </footer>
</body>
</html>
