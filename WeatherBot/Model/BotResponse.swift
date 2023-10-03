//
//  BotResponse.swift
//  ChatBot
//
//  Created by Markus Platter on 28.09.23.
//

import Foundation
import NaturalLanguage

class BotResponse {
    
    /// Ermöglicht den Zugriff auf die decodierte Struktur der WeatherApi-Datem
    var weatherData: WeatherData
    
    init(weatherData: WeatherData) {
        self.weatherData = weatherData
    }
    
    /// Erstellt eine passende Nachricht zur Anfrage des Users auf Basis der Übereinstimmung eines eingegebenen Textes
    ///
    ///  - Parameter text: Nimmt den Eingabetext des Users entgegen
    ///  - Returns: Die Antwort vom Typ "String
    func createBotResponse (from text: String) -> String {
        
        let textLowerCase = text.lowercased()
        
        switch textLowerCase {
        case _ where textLowerCase.contains("temperatur"): return "Die aktuelle Temperatur in \(weatherData.location.name) beträgt \(weatherData.current.temp_c) Grad Celsius."
        case _ where textLowerCase.contains("grad"): return "Die Temperatur in \(weatherData.location.name) misst derzeit \(weatherData.current.temp_c) Grad Celsius."
        case _ where textLowerCase.contains("warm"): return "Die Temperatur in \(weatherData.location.name) misst derzeit \(weatherData.current.temp_c) Grad Celsius."
        case _ where textLowerCase.contains("kalt"): return "Die Temperatur in \(weatherData.location.name) misst derzeit \(weatherData.current.temp_c) Grad Celsius."
        case _ where textLowerCase.contains("hitze"): return "Die Temperatur in \(weatherData.location.name) misst derzeit \(weatherData.current.temp_c) Grad Celsius."
        case _ where textLowerCase.contains("kälte"): return "Die Temperatur in \(weatherData.location.name) misst derzeit \(weatherData.current.temp_c) Grad Celsius."
        case _ where textLowerCase.contains("wind"): return "Die Windgeschwindigkeit in \(weatherData.location.name) wird aktuell mit \(weatherData.current.wind_kph) km/h aus der Richtung \(weatherData.current.wind_dir) verzeichnet."
        case _ where textLowerCase.contains("böig"): return "Die Windgeschwindigkeit in \(weatherData.location.name) wird aktuell mit \(weatherData.current.wind_kph) km/h aus der Richtung \(weatherData.current.wind_dir) verzeichnet."
        case _ where textLowerCase.contains("sturm"): return "Die Windgeschwindigkeit in \(weatherData.location.name) wird aktuell mit \(weatherData.current.wind_kph) km/h aus der Richtung \(weatherData.current.wind_dir) verzeichnet."
        case _ where textLowerCase.contains("windig"): return "Die Windgeschwindigkeit in \(weatherData.location.name) wird aktuell mit \(weatherData.current.wind_kph) km/h aus der Richtung \(weatherData.current.wind_dir) verzeichnet."
        case _ where textLowerCase.contains("regen"): return "Der aktuelle Niederschlagswert in \(weatherData.location.name) beläuft sich auf \(weatherData.current.precip_mm) mm pro Quadratmeter."
        case _ where textLowerCase.contains("nass"): return "Der aktuelle Niederschlagswert in \(weatherData.location.name) beläuft sich auf \(weatherData.current.precip_mm) mm pro Quadratmeter."
        case _ where textLowerCase.contains("schauer"): return "Der aktuelle Niederschlagswert in \(weatherData.location.name) beläuft sich auf \(weatherData.current.precip_mm) mm pro Quadratmeter."
        case _ where textLowerCase.contains("niederschlag"): return "Der aktuelle Niederschlagswert in \(weatherData.location.name) beläuft sich auf \(weatherData.current.precip_mm) mm pro Quadratmeter."
        case _ where textLowerCase.contains("regnet"): return "Derzeit verzeichnet \(weatherData.location.name) einen Niederschlag von \(weatherData.current.precip_mm) mm pro Quadratmeter."
        case _ where textLowerCase.contains("feuchtigkeit"): return "Die momentane Luftfeuchtigkeit in \(weatherData.location.name) beträgt \(weatherData.current.humidity) Prozent."
        case _ where textLowerCase.contains("feucht"): return "Die momentane Luftfeuchtigkeit in \(weatherData.location.name) beträgt \(weatherData.current.humidity) Prozent."
        case _ where textLowerCase.contains("trocken"): return "Die momentane Luftfeuchtigkeit in \(weatherData.location.name) beträgt \(weatherData.current.humidity) Prozent."
        case _ where textLowerCase.contains("schwül"): return "Die momentane Luftfeuchtigkeit in \(weatherData.location.name) beträgt \(weatherData.current.humidity) Prozent."
        case _ where textLowerCase.contains("wolke"): return "Der Himmel über \(weatherData.location.name) ist derzeit zu \(weatherData.current.cloud) Prozent bewölkt."
        case _ where textLowerCase.contains("bewölkt"): return "Aktuell ist der Himmel in \(weatherData.location.name) zu \(weatherData.current.cloud) Prozent bewölkt."
        case _ where textLowerCase.contains("himmel"): return "Aktuell ist der Himmel in \(weatherData.location.name) zu \(weatherData.current.cloud) Prozent bewölkt."
        case _ where textLowerCase.contains("gefühlt"): return "Die gefühlte Temperatur in \(weatherData.location.name) beläuft sich auf \(weatherData.current.feelslike_c) Grad Celsius."
        case _ where textLowerCase.contains("fühlt sich an wie"): return "Die gefühlte Temperatur in \(weatherData.location.name) beläuft sich auf \(weatherData.current.feelslike_c) Grad Celsius."
        case _ where textLowerCase.contains("fühl"): return "Die gefühlte Temperatur in \(weatherData.location.name) beläuft sich auf \(weatherData.current.feelslike_c) Grad Celsius."
        case _ where textLowerCase.contains("uv"): return "Der UV-Index in \(weatherData.location.name) weist aktuell einen Wert von \(weatherData.current.uv) auf."
        case _ where textLowerCase.contains("lage"): return "Die momentanen Wetterbedingungen in \(weatherData.location.name) lassen sich als \(weatherData.current.condition.text) beschreiben."
        case _ where textLowerCase.contains("bedingung"): return "Derzeit sind die Wetterbedingungen in \(weatherData.location.name) wie folgt: \(weatherData.current.condition.text)."
        case _ where textLowerCase.contains("wetter"): return "In \(weatherData.location.name) beträgt die Temperatur \(weatherData.current.temp_c) Grad Celsius, die gefühlte Temperatur ist \(weatherData.current.feelslike_c) Grad, der Wind weht mit \(weatherData.current.wind_kph) km/h aus der Richtung \(weatherData.current.wind_dir), die Niederschlagsrate ist \(weatherData.current.precip_mm) mm pro Quadratmeter, die Bewölkung beträgt \(weatherData.current.cloud) Prozent und der UV-Index misst \(weatherData.current.uv)."
        case _ where textLowerCase.contains("alle"): return "Aktuell weist \(weatherData.location.name) folgende Wetterdaten auf: Temperatur \(weatherData.current.temp_c) Grad, gefühlte Temperatur \(weatherData.current.feelslike_c) Grad, Windgeschwindigkeit \(weatherData.current.wind_kph) km/h aus Richtung \(weatherData.current.wind_dir), Niederschlag \(weatherData.current.precip_mm) mm pro Quadratmeter, Bewölkungsgrad \(weatherData.current.cloud) Prozent, UV-Index \(weatherData.current.uv)."
        case _ where textLowerCase.contains("komplett"): return "Aktuell weist \(weatherData.location.name) folgende Wetterdaten auf: Temperatur \(weatherData.current.temp_c) Grad, gefühlte Temperatur \(weatherData.current.feelslike_c) Grad, Windgeschwindigkeit \(weatherData.current.wind_kph) km/h aus Richtung \(weatherData.current.wind_dir), Niederschlag \(weatherData.current.precip_mm) mm pro Quadratmeter, Bewölkungsgrad \(weatherData.current.cloud) Prozent, UV-Index \(weatherData.current.uv)."
        case _ where textLowerCase.contains("gesamt"): return "Aktuell weist \(weatherData.location.name) folgende Wetterdaten auf: Temperatur \(weatherData.current.temp_c) Grad, gefühlte Temperatur \(weatherData.current.feelslike_c) Grad, Windgeschwindigkeit \(weatherData.current.wind_kph) km/h aus Richtung \(weatherData.current.wind_dir), Niederschlag \(weatherData.current.precip_mm) mm pro Quadratmeter, Bewölkungsgrad \(weatherData.current.cloud) Prozent, UV-Index \(weatherData.current.uv)."
        case _ where textLowerCase.contains("übersicht"): return "Aktuell weist \(weatherData.location.name) folgende Wetterdaten auf: Temperatur \(weatherData.current.temp_c) Grad, gefühlte Temperatur \(weatherData.current.feelslike_c) Grad, Windgeschwindigkeit \(weatherData.current.wind_kph) km/h aus Richtung \(weatherData.current.wind_dir), Niederschlag \(weatherData.current.precip_mm) mm pro Quadratmeter, Bewölkungsgrad \(weatherData.current.cloud) Prozent, UV-Index \(weatherData.current.uv)."
        case _ where textLowerCase.contains("detail"): return "Aktuell weist \(weatherData.location.name) folgende Wetterdaten auf: Temperatur \(weatherData.current.temp_c) Grad, gefühlte Temperatur \(weatherData.current.feelslike_c) Grad, Windgeschwindigkeit \(weatherData.current.wind_kph) km/h aus Richtung \(weatherData.current.wind_dir), Niederschlag \(weatherData.current.precip_mm) mm pro Quadratmeter, Bewölkungsgrad \(weatherData.current.cloud) Prozent, UV-Index \(weatherData.current.uv)."
        default: return "Leider konnte ich keine Wetterdaten für Ihre Anfrage finden. Für eine genauere Wetterinformation bitte ich um die Bekanntgabe des spezifischen Standortes und der Wetterinformation, die Sie interessiert. Vielen Dank."
            
        }
    }
}
