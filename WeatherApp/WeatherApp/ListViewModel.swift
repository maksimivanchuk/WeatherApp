//
//  ListViewModel.swift
//  WeatherApp
//
//  Created by Максим  on 12/8/19.
//  Copyright © 2019 Максим . All rights reserved.
//

import Foundation
final class ListViewModel {
    var items: [Model] = {
        let item = Model(humidity: 0, pressure: 0.0, temp: 0.0, descriptionField: "", speed: 0.0, deg: 0.0)
        return [item]
        
    }()
    var city: City = {
        let city = City(name: "", country: "")
        return city
        
    }()
    
    func loadData(lat:Double,lng:Double,completion: @escaping () -> Void) {
        let networkManager = NetworkManager()
        networkManager.getData(lat: lat,lng: lng) { networkModel in
            guard let networkModel = networkModel else {return}
            self.city = networkModel.city
            for listItem in networkModel.list{
                let model = Model(humidity: listItem.main.humidity, pressure: listItem.main.pressure, temp: listItem.main.temp, descriptionField: listItem.weather.description, speed: listItem.wind.speed, deg: listItem.wind.deg)
                self.items.append(model)
            }
            completion()
        }
    }
}
