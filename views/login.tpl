<!DOCTYPE html>
<html>
<head>
    <title>Iniciar sesión - Nutri</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f0f7ed;
        }

        .header {
            text-align: center;
            padding: 40px 20px;
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            margin-top: 40px;
        }

        .logo {
            width: 150px;
            height: 150px;
            display: inline-block;
            vertical-align: middle;
        }

        h1 {
            color: #4caf50;
            font-size: 48px;
            display: inline-block;
            vertical-align: middle;
            margin-left: 20px;
        }

        .container {
            max-width: 400px;
            margin: 0 auto;
            padding: 40px 20px;
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            text-align: center;
            margin-top: 60px;
        }

        label {
            display: block;
            margin-bottom: 5px;
            color: #333;
            text-align: left;
        }

        input[type="text"],
        input[type="password"] {
            width: 100%;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 4px;
            margin-bottom: 15px;
            box-sizing: border-box;
        }

        input[type="submit"] {
            background-color: #4caf50;
            color: #fff;
            padding: 10px 20px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 16px;
        }

        input[type="submit"]:hover {
            background-color: #45a049;
        }

        .register-link {
            margin-top: 10px;
        }

        .register-link a {
            color: #007bff;
            text-decoration: none;
        }

        @media screen and (max-width: 480px) {
            .container {
                max-width: 300px;
            }
        }
    </style>
</head>
<body>
    <div class="header">
        <img src="/static/img/logo.jpeg" alt="Logo Nutri" class="logo">
        <h1>Nutri</h1>
    </div>

    <div class="container">
        <h2>Iniciar sesión</h2>
        <form action="/login" method="post">
            <label for="email">Email:</label>
            <input type="text" id="email" name="email" required>

            <label for="password">Contraseña:</label>
            <input type="password" id="password" name="password" required>

            <input type="submit" value="Iniciar sesión">

            <div class="register-link">
                ¿No tienes una cuenta? - <a href="register">¡<span style="color: #007bff;">Regístrate</span>!</a>
            </div>
        </form>
    </div>
</body>
</html>
