//
//  WeatherManager.swift
//  WeatherBot
//
//  Created by Markus Platter on 01.10.23.
//

import Foundation

class WeatherManager {
    
    let baseUrl = "https://api.weatherapi.com/v1"
    let currentweather = "/current.json?"
    let apiKey = "b2658801c7004c23b88134520230110"
    let language = "de"
    
    func fetchWeather(from location: String, completion: @escaping (WeatherData?) -> Void) {
        let urlAsString = baseUrl + currentweather + "key=" + apiKey + "&q=" + location + "&lang=" + language
        print(urlAsString)
        performRequest(from: urlAsString, completion: completion)
    }
    
    private func performRequest(from urlString: String, completion: @escaping (WeatherData?) -> Void) {
        //create URL-String
        guard let url = URL(string: urlString) else { return }
        //create urlSession
        let session = URLSession(configuration: .default)
        //create Task
        let task = session.dataTask(with: url) { data, URLResponse, error in
            if let error = error {
                print(error)
                return
            }
            if let _data = data {
                self.parseJson(from: _data, completion: completion)
            }
        }
        task.resume()
    }
    
    private func parseJson(from data: Data, completion: @escaping (WeatherData?) -> Void) {
        let decoder = JSONDecoder()
        do {
            let decoderData = try decoder.decode(WeatherData.self, from: data)
            completion(decoderData)
        } catch {
            print(error)
            completion(nil)
        }
    }
    
    
    
    
}