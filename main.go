package main

import (
	_ "nutri/routers"

	"github.com/astaxie/beego"
)

func main() {
	beego.Run()

}

func init() {
	beego.BConfig.WebConfig.Session.SessionOn = true
	beego.AddViewPath("views")

}
