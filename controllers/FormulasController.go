package controllers

import (
	"github.com/astaxie/beego"
)

type FormulasController struct {
	beego.Controller
}

func (c *FormulasController) Get() {
	c.TplName = "formulas.tpl"
}

func (c *FormulasController) Calcular() {
	edad, _ := c.GetInt("edad")
	sexo := c.GetString("sexo")
	peso, _ := c.GetInt("peso")
	estatura, _ := c.GetInt("estatura")
	intensidad := c.GetString("intensidad")

	// Validación de datos
	if edad >= 90 {
		c.Ctx.WriteString("La edad debe ser menor a 90 años.")
		return
	}

	// Cálculo del IMC
	// (Puedes ajustar las fórmulas según tus necesidades)
	imc := float64(peso) / ((float64(estatura) / 100) * (float64(estatura) / 100))

	// Cálculo de la fórmula de Mifflin-St Jeor
	// (Puedes ajustar las fórmulas según tus necesidades)
	var factorActividad float64
	switch intensidad {
	case "0-1":
		factorActividad = 1.2
	case "1-3":
		factorActividad = 1.375
	case "3-5":
		factorActividad = 1.55
	case "5-7":
		factorActividad = 1.725
	case "7+":
		factorActividad = 1.9
	}

	// Cálculo de la fórmula de Mifflin-St Jeor
	var tmb float64
	if sexo == "masculino" {
		tmb = (10.0 * float64(peso)) + (6.25 * float64(estatura)) - (5.0 * float64(edad)) + 5.0
	} else {
		tmb = (10.0 * float64(peso)) + (6.25 * float64(estatura)) - (5.0 * float64(edad)) - 161.0
	}
	tmb *= factorActividad
	// Renderización de la vista con los resultados
	c.Data["IMC"] = imc
	c.Data["TMB"] = tmb
	// Redondeo del IMC

	c.TplName = "formulas.tpl"
}
