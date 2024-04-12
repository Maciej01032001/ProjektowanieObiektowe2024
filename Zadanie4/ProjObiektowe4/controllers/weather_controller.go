package controllers

import (
	"ProjObiektowe4/models"
	"encoding/json"
	"github.com/labstack/echo/v4"
	"gorm.io/gorm"
	"io"
	"log"
	"net/http"
)

func MapPolishToEnglish(polishData models.WeatherDataPolish) models.WeatherData {
	return models.WeatherData{
		StationID:     polishData.ID,
		StationName:   polishData.StationName,
		Date:          polishData.Date,
		Hour:          polishData.Hour,
		Temperature:   polishData.Temperature,
		WindSpeed:     polishData.WindSpeed,
		WindDirection: polishData.WindDirection,
		Humidity:      polishData.Humidity,
		Rainfall:      polishData.Rainfall,
		Pressure:      polishData.Pressure,
	}
}

func FetchAndSaveDataToDatabase(ctx echo.Context, gormDB *gorm.DB) error {
	var data []models.WeatherDataPolish
	response, err := http.Get("https://danepubliczne.imgw.pl/api/data/synop/")

	if err != nil {
		return err
	}
	defer func(Body io.ReadCloser) {
		err := Body.Close()
		if err != nil {
			log.Println("Error while closing response body (io.ReadCloser):", err)
		}
	}(response.Body)

	if response.StatusCode != http.StatusOK {
		return echo.NewHTTPError(response.StatusCode, "Unexpected status code received from the API")
	}

	if err := json.NewDecoder(response.Body).Decode(&data); err != nil {
		return err
	}

	if len(data) == 0 {
		return echo.NewHTTPError(http.StatusNotFound, "Empty data slice received from API")
	}

	for _, item := range data {
		weatherData := MapPolishToEnglish(item)
		if err := gormDB.Create(&weatherData).Error; err != nil {
			return err
		}
	}

	return ctx.String(http.StatusOK, "Data saved to database")
}

func GetAllData(ctx echo.Context, gormDB *gorm.DB) error {
	var data []models.WeatherData

	if err := gormDB.Find(&data).Error; err != nil {
		return err
	}

	return ctx.JSON(http.StatusOK, data)
}

func GetOneData(ctx echo.Context, gormDB *gorm.DB, station string) error {
	var data []models.WeatherData

	if station == "" {
		return echo.NewHTTPError(http.StatusBadRequest, "No station name provided")
	}

	if err := gormDB.Where("station_name = ?", station).Find(&data).Error; err != nil {
		return err
	}

	if len(data) == 0 {
		return echo.NewHTTPError(http.StatusNotFound, "No station of given name found")
	}

	return ctx.JSON(http.StatusOK, data)
}
