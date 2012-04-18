package smartgarden

import smartgarden.weather.WeatherInfo

class Garden {
	static expose = 'garden'
	static searchable = true
	static hasMany = [weatherInfos: WeatherInfo]
    static constraints = {
    }
	
	String name
	Location location
	
}
