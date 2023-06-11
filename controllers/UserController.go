package controllers

import (
	"context"
	"database/sql"
	"fmt"

	"github.com/astaxie/beego"
	_ "github.com/go-sql-driver/mysql"
)

type UserController struct {
	beego.Controller
}
type User struct {
	ID         int
	nombre     string
	email      string
	contrasena string
}

func conexion() (*sql.DB, error) {
	direccion := "root:Juanpa16.@tcp(localhost:3306)/usuarios?parseTime=true"
	db, err := sql.Open("mysql", direccion)
	if err != nil {
		return nil, err
	}
	err = db.Ping()
	if err != nil {
		return nil, err
	}
	print("se conecto")
	return db, nil
}
func consulta(ctx context.Context, db *sql.DB) error {
	query := `
	select
	u.ID,
	u.nombre,
	u.email,
	u.contrasena
	from usuario u;
	`
	rows, err := db.QueryContext(ctx, query)
	if err != nil {
		return err
	}
	usuarios := []User{}
	for rows.Next() {
		u := User{}
		rows.Scan(&u.ID, &u.nombre, &u.email, &u.contrasena)
		if err != nil {
			return err
		}
		usuarios = append(usuarios, u)
	}

	fmt.Println(usuarios)
	return nil
}

func consulta2(ctx context.Context, db *sql.DB, email string) string {
	var ID int64
	var nombre string
	var contrasena string
	query := `SELECT * FROM usuario WHERE email = ?`

	row := db.QueryRowContext(ctx, query, email)
	err := row.Scan(&ID, &nombre, &email, &contrasena)
	if err != nil {
		if err == sql.ErrNoRows {
			email = "" // No se encontraron filas, establecer email en cadena vacía
		} else {
			panic(err)
		}
	}

	fmt.Println("AQUI ESTOY GONORREA", email, "////")

	return email
}

// Acción de registro de usuario
func (c *UserController) Register() error {
	// Obtener los datos del formulario de registro
	ctx := context.Background()
	db, err := conexion()
	if err != nil {
		panic(err)
	}
	nombre := c.GetString("username")
	email := c.GetString("email")
	contrasena := c.GetString("password")
	confirmPassword := c.GetString("confirmPassword")
	valido := consulta2(ctx, db, email)
	if valido != "" {

		print("no se registro papasito")
		c.Redirect("register", 302)

	} else {
		// Validar que las contraseñas coincidan
		if contrasena != confirmPassword {
			c.Data["json"] = map[string]interface{}{
				"status":  "error",
				"message": "Las contraseñas no coinciden",
			}
			c.ServeJSON()

		}

		err = consulta(ctx, db)
		if err != nil {
			panic(err)
		}

		insertar := `insert into usuario() values(?,?,?,?);`
		result, err := db.ExecContext(ctx, insertar, 0, nombre, email, contrasena)
		if err != nil {
			panic(err)
		}
		ID, err := result.LastInsertId()
		if err != nil {
			panic(err)
		}
		fmt.Println("ID insertado:", ID)
	}
	c.Redirect("/", 302)
	return nil

}

func (c *UserController) ShowRegisterForm() {
	c.TplName = "register.tpl"
}

////////////////////////////////////////////////////////////////////////////////////////////////

func consultalog(ctx context.Context, db *sql.DB, email string, contrasena string) bool {
	var ID int64
	var nombre string
	var condicion bool = true
	query := `SELECT * FROM usuario WHERE email = ? && contrasena=?`

	row := db.QueryRowContext(ctx, query, email, contrasena)
	err := row.Scan(&ID, &nombre, &email, &contrasena)
	print("HA APARECIDO ---->" + email + contrasena + "<------------")
	if err != nil {
		if err == sql.ErrNoRows {

			condicion = false
		} else {
			panic(err)
		}

	}

	return condicion
}

func (c *UserController) Login() {
	ctx := context.Background()
	db, err := conexion()
	if err != nil {
		panic(err)
	}
	// Obtener los datos del formulario de inicio de sesión
	email := c.GetString("email")
	contrasena := c.GetString("password")
	condicion := consultalog(ctx, db, email, contrasena)
	print(condicion)
	if !condicion {
		print("paila denegado")
		c.Redirect("/login", 302)
	} else {
		//loggedUser = nombre
		c.Redirect("/", 302)

	}
}
func (c *UserController) ShowLoginForm() {
	c.TplName = "login.tpl"
}

func (c *UserController) Logout() {
	c.DelSession("usuario")
	c.Redirect("/login", 302)
}
