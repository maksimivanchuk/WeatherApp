import Foundation
final class ListViewModel {
    
    let cellID = "cellID"
    var items: [Model] = []
    var city: City = {
        let city = City(name: "", country: "")
        return city
    }()
    
    func loadData(lat:Double,lng:Double,completion: @escaping () -> Void) {
        let networkManager = NetworkManager()
        items = []
        networkManager.getData(lat: lat,lng: lng) { networkModel in
            guard let networkModel = networkModel else {return}
            self.city = networkModel.city
            for listItem in networkModel.list{
                let model = Model(humidity: listItem.main.humidity, pressure: listItem.main.pressure, temp: listItem.main.temp, state: self.substring(listItem.weather.description), speed: listItem.wind.speed, deg: listItem.wind.deg, date: listItem.data)
                self.items.append(model)
            }
            completion()
        }
    }
    func substring (_ string: String) -> String {
        var str: String = string
        str.removeSubrange(str.startIndex..<str.index(str.startIndex, offsetBy: 39))
        str.removeSubrange(str.index(str.endIndex, offsetBy: -3)..<str.endIndex)
        return str
    }
}
