package controllers

import (
	"encoding/json"
	"net/http"
	"strconv"

	"github.com/astaxie/beego"
)

type Noticia struct {
	Titulo  string `json:"title"`
	Fuente  string `json:"source.name"`
	URL     string `json:"url"`
	Imagen  string `json:"urlToImage"`
	Resumen string `json:"description"`
}

type NoticiasController struct {
	beego.Controller
}

func (c *NoticiasController) Get() {
	noticias, err := obtenerNoticiasFitness()
	if err != nil {
		beego.Error("Error al obtener noticias de fitness:", err)
		// Manejar el error apropiadamente, por ejemplo, mostrar un mensaje de error en la vista
		return
	}

	c.Data["Noticias"] = noticias
	c.TplName = "noticias.tpl"
}

func obtenerNoticiasFitness() ([]Noticia, error) {
	url := "https://newsapi.org/v2/everything"
	apiKey := "b0067af2848342d3929cefcefd3c502a"
	pageSize := 10

	client := http.Client{}
	req, err := http.NewRequest("GET", url, nil)
	if err != nil {
		return nil, err
	}

	// Agregar parámetros de consulta
	q := req.URL.Query()
	q.Add("q", "fitness")
	q.Add("apiKey", apiKey)
	q.Add("pageSize", strconv.Itoa(pageSize))
	req.URL.RawQuery = q.Encode()

	resp, err := client.Do(req)
	if err != nil {
		return nil, err
	}
	defer resp.Body.Close()

	var noticiasRespuesta struct {
		Articulos []Noticia `json:"articles"`
	}

	err = json.NewDecoder(resp.Body).Decode(&noticiasRespuesta)
	if err != nil {
		return nil, err
	}

	return noticiasRespuesta.Articulos, nil
}
