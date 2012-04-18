package smartgarden


class Location {
	static expose = 'location'
	static searchable = true
    static constraints = {
    }
	
	String name
	String address
	String city
	String state
	Integer zip
}
