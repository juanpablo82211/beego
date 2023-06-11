package controllers

import (
	"fmt"
	"io/ioutil"
	"os"
	"path/filepath"

	"github.com/astaxie/beego"
	"github.com/go-sql-driver/mysql"
)

type VideosController struct {
	beego.Controller
}

func (c *VideosController) Get() {
	db, err := conexion()
	if err != nil {
		c.Data["Error"] = err.Error()
		c.TplName = "videos.tpl"
		return
	}
	defer db.Close()

	// Obtener la lista de videos desde la base de datos
	rows, err := db.Query("SELECT file_path FROM videos")
	if err != nil {
		c.Data["Error"] = err.Error()
		c.TplName = "videos.tpl"
		return
	}
	defer rows.Close()

	var videos []Video
	for rows.Next() {
		var filePath string
		err := rows.Scan(&filePath)
		if err != nil {
			c.Data["Error"] = err.Error()
			c.TplName = "videos.tpl"
			return
		}
		video := Video{
			FilePath: filePath,
		}
		videos = append(videos, video)
	}

	c.Data["Videos"] = videos
	c.TplName = "videos.tpl"
}

func (c *VideosController) Post() {
	file, header, err := c.GetFile("video")
	if err != nil {
		c.Data["Error"] = err.Error()
		c.Get()
		return
	}
	defer file.Close()

	// Leer el contenido del archivo en memoria
	fileBytes, err := ioutil.ReadAll(file)
	if err != nil {
		c.Data["Error"] = err.Error()
		c.Get()
		return
	}

	// Crear el directorio "uploads" si no existe
	uploadsDir := "uploads"
	err = os.MkdirAll(uploadsDir, 0755)
	if err != nil {
		c.Data["Error"] = err.Error()
		c.Get()
		return
	}

	// Guardar el archivo en el sistema de archivos
	filePath := filepath.Join(uploadsDir, header.Filename)
	err = ioutil.WriteFile(filePath, fileBytes, 0644)
	if err != nil {
		c.Data["Error"] = err.Error()
		c.Get()
		return
	}

	// Guardar la ruta del archivo en la base de datos
	db, err := conexion()
	if err != nil {
		c.Data["Error"] = err.Error()
		c.Get()
		return
	}
	defer db.Close()

	video := Video{
		FilePath: filePath,
	}
	_, err = db.Exec("INSERT INTO videos (file_path) VALUES (?)", video.FilePath)
	if err != nil {
		if mysqlErr, ok := err.(*mysql.MySQLError); ok {
			c.Data["Error"] = fmt.Sprintf("MySQL Error %d: %s", mysqlErr.Number, mysqlErr.Message)
		} else {
			c.Data["Error"] = err.Error()
		}
		c.Get()
		return
	}

	c.Data["Success"] = "Archivo subido exitosamente"
	c.Get()
}

type Video struct {
	ID       int64
	FilePath string
}
