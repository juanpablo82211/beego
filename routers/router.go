package routers

import (
	"nutri/controllers"

	"github.com/astaxie/beego"
)

func init() {
	beego.Router("/", &controllers.MainController{})
	beego.Router("/register", &controllers.UserController{}, "post:Register")
	beego.Router("/register", &controllers.UserController{}, "get:ShowRegisterForm")
	beego.Router("/login", &controllers.UserController{}, "post:Login")
	beego.Router("/login", &controllers.UserController{}, "get:ShowLoginForm")
	beego.Router("/logout", &controllers.UserController{}, "get:Logout")
	beego.Router("/videos", &controllers.VideosController{})
	beego.Router("/noticias", &controllers.NoticiasController{})
	beego.Router("/calcular", &controllers.FormulasController{}, "post:Calcular")
	beego.Router("/formulas", &controllers.FormulasController{})

}
