import Foundation

struct NetworkModel: Codable {
    let list: [List]
    let city: City
    private enum CodingKeys: String, CodingKey {
        case list = "list"
        case city = "city"
    }
    
    init(model: NetworkModel) {
        self = model
    }
    
    init(list: [List], city: City) {
        self.list = list
        self.city = city
    }
}

struct List: Codable {
    let main : Main
    let weather : [Weather]
    let wind : Wind
    let data : Int
    
    private enum CodingKeys: String, CodingKey {
        case main = "main"
        case weather = "weather"
        case wind = "wind"
        case data = "dt"
    }
    
    init(list: List) {
        self = list
    }
    
    init(main: Main, weather: [Weather],wind:Wind,data:Int) {
        self.main = main
        self.weather = weather
        self.wind = wind
        self.data = data
    }
}

struct City: Codable {
    let name: String
    let country: String
    
    private enum CodingKeys: String, CodingKey {
        case name = "name"
        case country = "country"
    }
    init(city: City) {
        self = city
    }
    
    init(name: String, country: String) {
        self.name = name
        self.country = country
    }
}

struct Main : Codable {
    let humidity : Int
    let pressure : Double
    let temp : Double
    
    private enum CodingKeys: String, CodingKey {
        case humidity = "humidity"
        case pressure = "pressure"
        case temp = "temp"
    }
    
    init(main: Main) {
        self = main
    }
    
    init(humidity: Int, pressure: Double,temp:Double ) {
        self.humidity = humidity
        self.pressure = pressure
        self.temp = temp
    }
}
struct Weather : Codable {
    let descriptionField : String
    
    private enum CodingKeys: String, CodingKey {
        case descriptionField = "description"
    }
    init(weather: Weather) {
        self = weather
    }
    
    init(descriptionField: String ) {
        self.descriptionField = descriptionField
    }
}
struct Wind : Codable {
    let deg : Double 
    let speed : Double
    
    private enum CodingKeys: String, CodingKey {
        case speed = "speed"
        case deg = "deg"
    }
    init(wind: Wind) {
        self = wind
    }
    
    init(deg: Double, speed: Double ) {
        self.deg = deg
        self.speed = speed
    }
}
