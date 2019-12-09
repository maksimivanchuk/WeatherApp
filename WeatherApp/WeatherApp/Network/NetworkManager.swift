import Alamofire

class NetworkManager: NSObject {
    
    func getData(lat:Double,lng:Double,completion: @escaping (NetworkModel?) -> Void) {
        let urlString = "https://api.openweathermap.org/data/2.5/forecast?lat=\(lat)&lon=\(lng)&appid=9fc4ee370ca59feea6e76eec3742234b"
        AF.request(urlString).response { response in
            guard let data = response.data else { return }
            do {
                let decoder = JSONDecoder()
                let networkModel = try decoder.decode(NetworkModel.self, from: data)
                completion(networkModel)
            } catch let error {
                print(error)
                completion(nil)
            }
        }
    }
}
