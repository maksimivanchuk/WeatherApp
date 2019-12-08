import Foundation
import UIKit

struct Model {
    
    var humidity: Int
    var pressure: Double
    var temp: Double
    var descriptionField: String
    var speed: Double
    var deg: Double
       
       init(model: Model) {
           self = model
       }
       
       init(humidity: Int, pressure: Double, temp: Double, descriptionField: String, speed: Double, deg: Double) {
           self.humidity = humidity
           self.pressure = pressure
           self.temp = temp
           self.descriptionField = descriptionField
           self.speed = speed
           self.deg = deg
       }
}
