// Package weather provides the functionalities to
// Forecast the weather for a given city.
package weather

// CurrentCondition represents that predicted current condition for a given city (CurrentLocation) for a weather forecast.
var CurrentCondition string

// CurrentLocation represents the city for which the weather forecast is meant to predict.
var CurrentLocation string

// Forecast returns the weather condition for a city.
func Forecast(city, condition string) string {
	CurrentLocation, CurrentCondition = city, condition
	return CurrentLocation + " - current weather condition: " + CurrentCondition
}
