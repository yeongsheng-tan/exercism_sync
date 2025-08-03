package cars

// CalculateWorkingCarsPerHour calculates how many working cars are
// produced by the assembly line every hour
func CalculateWorkingCarsPerHour(productionRate int, successRate float64) float64 {
	// panic("CalculateWorkingCarsPerHour not implemented")
	f_prodRate := float64(productionRate)
	return (f_prodRate * successRate) / 100
}

// CalculateWorkingCarsPerMinute calculates how many working cars are
// produced by the assembly line every minute
func CalculateWorkingCarsPerMinute(productionRate int, successRate float64) int {
	// panic("CalculateWorkingCarsPerMinute not implemented")
	f_prodRate := float64(productionRate)
	return int((f_prodRate * successRate) / (100 * 60))
}

// CalculateCost works out the cost of producing the given number of cars
func CalculateCost(carsCount int) uint {
	// panic("CalculateCost not implemented")
	remOf10 := carsCount % 10
	return uint(((carsCount / 10) * 95000) + (remOf10 * 10000))
}
