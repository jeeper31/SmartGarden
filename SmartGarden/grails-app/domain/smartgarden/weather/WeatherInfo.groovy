package smartgarden.weather

import smartgarden.Garden

class WeatherInfo {

	/*
	 * Default (injected) attributes of GORM
	 */
	//	Long	id
	//	Date	dateCreated
	//	Date	lastUpdated
	
//	static belongsTo	= []	// tells GORM to delete this object if the "parent" is deleted.
//	static hasOne		= []
//	static hasMany		= []	
//	static mappedBy		= []
	static expose = 'weatherInfo'
	static searchable = true
    static mapping = {
    }
    
	static constraints = {
    }
	
	Garden  garden
	Integer humidity
	Integer airTemp
	Integer soilTemp
	Integer soilMoisture
	Integer lightIntensity
	Integer barometricPressure
	
	Date	dateCreated
	Date	lastUpdated
	
	/*
	 * Methods of the Domain Class
	 */
}
