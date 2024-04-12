package main

import (
	"ProjObiektowe4/models"
	"ProjObiektowe4/routes"
	"github.com/labstack/echo/v4"
	"gorm.io/driver/sqlite"
	"gorm.io/gorm"
)

const PORT = ":8080"

func main() {
	e := echo.New()

	gormDB, err := gorm.Open(sqlite.Open("weather.db"), &gorm.Config{})
	if err != nil {
		e.Logger.Fatal(err)
	}

	_ = gormDB.AutoMigrate(&models.WeatherData{})

	routes.SetupRoutes(e, gormDB)

	e.Logger.Fatal(e.Start(PORT))
}
