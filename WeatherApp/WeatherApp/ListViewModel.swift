//
//  ListViewModel.swift
//  WeatherApp
//
//  Created by Максим  on 12/8/19.
//  Copyright © 2019 Максим . All rights reserved.
//

import Foundation
final class ListViewModel {
    let listModel = ListModel()
   
    func updateData(nm: NetworkModel) {

        for i  in 0...((nm.list.count)-1)
        {
            listModel.items.append(Model(humidity: nm.list[i].main.humidity, pressure: nm.list[i].main.pressure, temp: nm.list[i].main.temp, descriptionField: nm.list[i].weather.description, speed: nm.list[i].wind.speed, deg: nm.list[i].wind.deg))
        }
        listModel.city = nm.city
        
        /*DispatchQueue.main.async {
            NotificationCenter.default.post(name: NSNotification.Name(rawValue: "Update"), object: nil)
        }*/
    }
    
    func loadData() {
        let networkManager = NetworkManager()
        networkManager.getTweetRequest() { (Request) in
            guard let request = Request else {return}
            self.updateData(nm:request)
        }
    }
}
