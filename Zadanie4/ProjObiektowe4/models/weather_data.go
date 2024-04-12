package models

import "time"

type WeatherData struct {
	ID            uint      `gorm:"primaryKey" json:"id"`
	StationID     string    `json:"station_id"`
	StationName   string    `json:"station_name"`
	Date          string    `json:"date"`
	Hour          string    `json:"hour"`
	Temperature   string    `json:"temperature"`
	WindSpeed     string    `json:"wind_speed"`
	WindDirection string    `json:"wind_direction"`
	Humidity      string    `json:"humidity"`
	Rainfall      string    `json:"rainfall"`
	Pressure      string    `json:"pressure"`
	CreatedAt     time.Time `json:"created_at"`
	UpdatedAt     time.Time `json:"updated_at"`
}
