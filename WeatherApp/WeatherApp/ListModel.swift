import Foundation
import UIKit

final class ListModel {
    
    var items: [Model] = {
        let item = Model(humidity: 0, pressure: 0.0, temp: 0.0, descriptionField: "", speed: 0.0, deg: 0.0)
        return [item]
        
    }()
    var city: City = {
        let city = City(name: "", country: "")
        return city
        
    }()
}
