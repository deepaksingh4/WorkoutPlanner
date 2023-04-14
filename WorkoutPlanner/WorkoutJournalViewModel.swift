//
//  WorkoutJournalViewModel.swift
//  WorkoutPlanner
//
//  Created by Deepak Singh07 on 11/04/2023.
//

import Foundation


class WorkoutJournalViewModel: ObservableObject{
    @Published var wokroutPlans: [WorkoutDayPlan] = []
    var apiManager: APIManager
    
    init(apiManager: APIManager = OrignalAPIManager<Response>()) {
        self.apiManager = apiManager
    }
    func fetchWorkoutPlans(completionHanlder: @escaping (Result<String, Error>) -> Void)
    {
        self.apiManager.callGetApi(urlString: "https://6439417b1b9a7dd5c962fa53.mockapi.io/api/v1/workoutList") { result in
            switch result{
            case .success(let data):
                guard let data = data as? Response else{
                    print("error with type")
                    return
                }
                        print("response \(data.name)")
                completionHanlder(.success(data.name))
            case .failure(let error):
                print("Error")
                completionHanlder(.failure(error))
            }
        }
    }
}

struct Response: Decodable {
    let name: String
}


protocol APIManager {
   
    func callGetApi(urlString: String, completionHandler: @escaping (Result<Any, Error>) -> Void)
}

class OrignalAPIManager<T: Decodable>: APIManager{
   
    
    func callGetApi(urlString: String, completionHandler: @escaping (Result<Any, Error>) -> Void){
        let urlSession = URLSession.shared
        let urlRequest =  URLRequest(url: URL(string: urlString)!)
        let dataTask = urlSession.dataTask(with: urlRequest) { data, response, error in
            if let httpResponse = response as? HTTPURLResponse, (200...299) ~= httpResponse.statusCode{
                if let data{
                    do{
                        let responseData = try JSONDecoder().decode([T].self, from: data)
                        completionHandler(.success(responseData))
                    }catch let DecodingError.dataCorrupted(context){
                        print(context)
                    }
                    catch let error{
                        print("Errow while calling API \(error)")
                    }
                }
            }
        }
        dataTask.resume()
    }
}
