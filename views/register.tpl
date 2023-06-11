<!DOCTYPE html>
<html>
<head>
    <title>Registro - Nutri</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f0f7ed;
            margin: 0;
            padding: 0;
        }

        .header {
            background-color: #4caf50;
            padding: 20px;
            text-align: center;
        }

        .logo {
            width: 200px;
            height: auto;
        }

        h1 {
            color: #fff;
            font-size: 36px;
            margin: 0;
        }

        .container {
            max-width: 400px;
            margin: 40px auto;
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            padding: 20px;
            text-align: center;
        }

        label {
            display: block;
            margin-bottom: 10px;
            color: #333;
            font-weight: bold;
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

        .login-link {
            margin-top: 10px;
            text-align: center;
        }

        .login-link a {
            color: #007bff;
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <div class="header">
        <img src="/static/img/logo.jpeg" alt="Logo Nutri" class="logo">
        <h1>Nutri</h1>
    </div>

    <div class="container">
        <h2>Registro de usuario</h2>
        <form action="/register" method="post">
            <label for="username">Nombre de usuario:</label>
            <input type="text" id="username" name="username" required>

            <label for="email">Correo:</label>
            <input type="text" id="email" name="email" required>

            <label for="password">Contraseña:</label>
            <input type="password" id="password" name="password" required>

            <label for="confirmPassword">Confirmar contraseña:</label>
            <input type="password" id="confirmPassword" name="confirmPassword" required>

            <input type="submit" value="Registrarse">

            <div class="login-link">
                ¿Ya tienes una cuenta? - <a href="/login"><span style="text-decoration: underline; color: #007bff;">Inicia sesión</span></a>
            </div>
        </form>
    </div>
</body>
</html>
