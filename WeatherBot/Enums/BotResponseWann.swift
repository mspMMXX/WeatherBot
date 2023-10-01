//
//  BotResponseWann.swift
//  ChatBot
//
//  Created by Markus Platter on 28.09.23.
//

import Foundation

enum BotResponseWann: String, CaseIterable {
    
    //Werte-Einstellungen
    case blende = "Die Einstellung der Blende erfolgt normalerweise vor der Aufnahme, um die Belichtung zu steuern."
    case brennweite = "Die Wahl der Brennweite erfolgt bei der Aufnahme, um den gewünschten Bildausschnitt zu erzielen."
    case iso = "Die ISO-Einstellung wird je nach Lichtbedingungen und gewünschtem Effekt angepasst."
    case verschlusszeit = "Die Verschlusszeit wird je nach gewünschtem Effekt und den Aufnahmebedingungen variiert."
    case fokus = "Der Fokus wird während der Bildkomposition angepasst, um das Hauptobjekt scharf zu stellen."
    case weissabgleich = "Der Weißabgleich kann vor oder nach der Aufnahme durchgeführt werden, um die Farbtemperatur zu korrigieren."
    
    //Licht-Schärfe
    case schlagschatten = "Schlagschatten werden während der Bildkomposition erzeugt, um einem Objekt Tiefe zu verleihen."
    case tiefenschaerfe = "Die Tiefenschärfe wird je nach gewünschtem Effekt und Bildkomposition angepasst."
    case bokeh = "Die Qualität des Bokeh-Effekts wird während der Bildkomposition beeinflusst."
    case primaerfarben = "Primärfarben werden je nach gewünschter Farbmischung und Bildkomposition verwendet."
    
    //Equipment
    case objektiv = "Die Auswahl des Objektivs erfolgt vor der Aufnahme, um den gewünschten Bildausschnitt zu erzielen."
    case gegenlichtblende = "Gegenlichtblenden werden vor der Aufnahme angebracht, um Blendung und Lens Flare zu reduzieren."
    case integralbelichtungsmesser = "Der Integralbelichtungsmesser wird vor der Aufnahme verwendet, um die optimale Belichtung zu ermitteln."
    case stativ = "Ein Stativ wird während der Bildkomposition verwendet, um stabile Aufnahmen zu ermöglichen."
    case teleobjektiv = "Ein Teleobjektiv wird je nach gewünschter Aufnahmesituation ausgewählt."
    
    //Farbe
    case kontrast = "Der Kontrast wird während der Bildkomposition beeinflusst, um den gewünschten Effekt zu erzielen."
    
    //Komponenten
    case linse = "Die Linse wird je nach gewünschter Bildkomposition und Lichtstreuung ausgewählt."
    case verschluss = "Die Verschlusszeit wird vor der Aufnahme festgelegt, um den gewünschten Effekt zu erzielen."
    case bildsensor = "Der Bildsensor wird in der Kamera verwendet, um das einfallende Licht in elektronische Daten umzuwandeln."
    case liveView = "LiveView wird vor und während der Aufnahme verwendet, um das erfasste Bild in Echtzeit anzuzeigen."
    
    //Bildgestaltung
    case motiv = "Die Auswahl des Motivs erfolgt vor der Aufnahme, um das Hauptobjekt oder Thema darzustellen."
    case format = "Das Format wird vor der Aufnahme ausgewählt, um die Abmessungen und das Seitenverhältnis des Bildes oder Videos festzulegen."
    
    //Eigenschaften
    case serienaufnahme = "Serienaufnahmen werden während der Bildkomposition gemacht, um mehrere Fotos in schneller Folge aufzunehmen."
    case bildaufloesung = "Die Bildauflösung wird vor der Aufnahme festgelegt und bestimmt die Anzahl der Pixel im Bild."
    
    case defaultCase = "Für weitere Informationen, lesen Sie bitte das Buch 'Licht und Belichtung in der Fotografie' von Reinhard Merz und Karl Stechl."
}
