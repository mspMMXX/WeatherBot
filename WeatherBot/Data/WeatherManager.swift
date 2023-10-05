//
//  WeatherManager.swift
//  WeatherBot
//
//  Created by Markus Platter on 01.10.23.
//

import Foundation

/// Verwaltet die Kommunikation mit der Wetter-API und holt Wetterdate für bestimmte Orte
class WeatherManager {
    
    ///Daten für die Verbindung zur API
    let baseUrl = "https://api.weatherapi.com/v1"
    let currentweather = "/current.json?"
    let apiKey = "b2658801c7004c23b88134520230110"
    let language = "de"
    
    /// Ruf Wetterdaten für einen bestimmten Ort ab.
    ///
    /// - Parameter location: Der Standort  für den das Wetter abgerufen werden soll.
    /// - Parameter completion: Ein Completion-Handler, der bei erfolgreicher oder fehlgeschlagener Abfrage aufgerufen wird.
    func fetchWeather(from location: String, completion: @escaping (WeatherData?) -> Void) {
        
        let urlAsString = baseUrl + currentweather + "key=" + apiKey + "&q=" + location + "&lang=" + language
        performRequest(from: urlAsString, completion: completion)
    }
    
    /// Führt die Netzwerkanfrage durch
    ///
    /// - Parameter urlString: Die vollständige URL als String
    /// - Parameter completion: Ein Completion-Handler, der bei erfolgreicher oder fehlgeschlagener Abfrage aufgerufen wird.
    private func performRequest(from urlString: String, completion: @escaping (WeatherData?) -> Void) {
        
        guard let url = URL(string: urlString) else { return }
        let session = URLSession(configuration: .default)
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
    
    /// Parst die JSON-Daten in ein WeatherData-Objekt
    ///
    /// - Parameter data: Die JSON-Daten
    /// - Parameter completion: Ein Completion-Handler, der bei erfolgreicher oder fehlgeschlagener Abfrage aufgerufen wird.
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
