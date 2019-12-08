import Foundation
import UIKit

struct Model {
    
    var humidity: Int
    var pressure: Double
    var temp: Double
    var state: String
    var speed: Double
    var deg: Double
       
       init(model: Model) {
           self = model
       }
       
       init(humidity: Int, pressure: Double, temp: Double, descriptionField: String, speed: Double, deg: Double) {
           self.humidity = humidity
           self.pressure = pressure
           self.temp = temp
           self.state = descriptionField
           self.speed = speed
           self.deg = deg
       }
}
