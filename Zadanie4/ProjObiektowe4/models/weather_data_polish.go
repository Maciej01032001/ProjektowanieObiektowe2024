package models

type WeatherDataPolish struct {
	ID            string `json:"id_stacji"`
	StationName   string `json:"stacja"`
	Date          string `json:"data_pomiaru"`
	Hour          string `json:"godzina_pomiaru"`
	Temperature   string `json:"temperatura"`
	WindSpeed     string `json:"predkosc_wiatru"`
	WindDirection string `json:"kierunek_wiatru"`
	Humidity      string `json:"wilgotnosc_wzgledna"`
	Rainfall      string `json:"suma_opadu"`
	Pressure      string `json:"cisnienie"`
}
