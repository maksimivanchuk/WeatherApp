import Alamofire

class NetworkManager: NSObject {

    func getTweetRequest(completion: @escaping (NetworkModel?) -> Void) {
            let urlString = "https://samples.openweathermap.org/data/2.5/forecast?lat=35&lon=139&appid=b6907d289e10d714a6e88b30761fae22"
            AF.request(urlString).response { response in
            guard let data = response.data else { return }
            do {
                let decoder = JSONDecoder()
                let modelRequest = try decoder.decode(NetworkModel.self, from: data)
                completion(modelRequest)
            } catch let error {
                print(error)
                completion(nil)
            }
        }
    }
}
