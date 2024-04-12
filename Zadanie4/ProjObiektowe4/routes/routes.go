package routes

import (
	"ProjObiektowe4/controllers"
	"github.com/labstack/echo/v4"
	"gorm.io/gorm"
)

func SetupRoutes(e *echo.Echo, gormDB *gorm.DB) {
	e.GET("/fetch-data", func(ctx echo.Context) error {
		return controllers.FetchAndSaveDataToDatabase(ctx, gormDB)
	})

	e.GET("/", func(ctx echo.Context) error {
		return controllers.GetAllData(ctx, gormDB)
	})

	e.GET("/station", func(ctx echo.Context) error {
		stationName := ctx.QueryParam("stacja")
		return controllers.GetOneData(ctx, gormDB, stationName)
	})
}
