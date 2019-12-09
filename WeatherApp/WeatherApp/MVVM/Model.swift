import Foundation
import UIKit

struct Model {
    var humidity: Int
    var pressure: Double
    var temp: Double
    var state: String
    var speed: Double
    var deg: Double
    var date: Int
    
    enum Description: String {
        case clearSky = "clear sky"
        case fewClouds = "few clouds"
        case rain = "light rain"
        
        func getWeatherImage()-> UIImage{
            switch self {
            case .clearSky:
                return UIImage(named: "clear_sky.png")!
            case .fewClouds:
                return UIImage(named: "few_clouds.png")!
            case .rain:
                return UIImage (named: "light_rain.png")!
            }
        }
    }
}
