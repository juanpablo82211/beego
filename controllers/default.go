package controllers

import (
	"github.com/astaxie/beego"
)

type MainController struct {
	beego.Controller
}

func (c *MainController) Get() {
	// Obtener el usuario actualmente autenticado (si lo hay)
	username := c.GetSession("username")

	// Pasar los datos del usuario a la plantilla
	c.Data["Username"] = username
	c.TplName = "index.tpl"
}
