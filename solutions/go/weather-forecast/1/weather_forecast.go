// Package weather provides a solution to predict weather.
package weather


    // CurrentCondition describes the current condition .
	var CurrentCondition string
    // CurrentLocation describes the current location.
	var CurrentLocation  string

// Forecast of the currrent location and city.
func Forecast(city, condition string) string {
	CurrentLocation, CurrentCondition = city, condition
	return CurrentLocation + " - current weather condition: " + CurrentCondition
}
