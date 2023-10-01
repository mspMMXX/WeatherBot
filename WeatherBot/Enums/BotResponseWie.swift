//
//  BotResponseWie.swift
//  ChatBot
//
//  Created by Markus Platter on 28.09.23.
//

import Foundation

enum BotResponseWie: String, CaseIterable {
    
    
    //Werte-Einstllungen
    case blende = "Die Blende funktioniert durch eine verstellbare Öffnung im Objektiv, die sich vergrößert oder verkleinert, um die Menge des einfallenden Lichts zu steuern."
    case brennweite = "Die Brennweite wird durch den Abstand der Linsen im Objektiv eingestellt, was den Zoom und den Bildausschnitt beeinflusst."
    case iso = "Die ISO-Einstellung ändert die elektronische Verstärkung des Sensors, was die Lichtempfindlichkeit erhöht oder verringert."
    case verschlusszeit = "Die Verschlusszeit wird durch die Dauer gesteuert, für die der Kamera-Verschluss offen bleibt, um Licht auf den Sensor fallen zu lassen."
    case fokus = "Durch Verstellen der Linsen oder durch elektronische Methoden wird ein Objekt im Bild scharf gestellt."
    case weissabgleich = "Durch Anpassung der Farbtemperatur des Sensors werden natürlichere Farben erzielt."
    
    //Licht-Schärfe
    case schlagschatten = "Durch Hinzufügen eines künstlichen Schattens in der Bildbearbeitung wird Tiefe erzeugt."
    case tiefenschaerfe = "Durch Anpassung der Blende und der Brennweite wird der Bereich festgelegt, der im Bild scharf erscheint."
    case bokeh = "Durch eine große Blendenöffnung wird der Hintergrund unscharf, während das Hauptmotiv scharf bleibt."
    case primaerfarben = "Sind nicht direkt Funktionsweisen, sondern Grundfarben, die in der Farbmischung verwendet werden."
    
    //Equipment
    case objektiv = "Besteht aus mehreren Linsen, die das Licht in einer bestimmten Weise brechen, um ein Bild auf dem Sensor zu erzeugen."
    case gegenlichtblende = "Ein zylindrisches oder kegelförmiges Stück, das am Objektiv befestigt wird, um seitliches Licht abzuschirmen."
    case integralbelichtungsmesser = "Verwendet einen Sensor, um das Licht im gesamten Bildfeld zu messen und dann die optimale Belichtung zu berechnen."
    case stativ = "Ein dreibeiniges Gestell, das die Kamera stabilisiert, um Verwacklungen zu vermeiden."
    case teleobjektiv = "Teleobjektiv hat eine lange Brennweite und ermöglicht Aufnahmen von weit entfernten Objekten."

    //Komponenten
    case linse = "Die Linse funktioniert durch Brechung der Lichtstrahlen, um sie auf den Sensor zu fokussieren."
    case verschluss = "Der Verschluss funktioniert durch mechanisches oder elektronisches Öffnen und Schließen, um die Belichtungszeit des Sensors zu steuern."
    case bildsensor = "Der Bildsensor funktioniert durch lichtempfindliche Pixel, die Licht in elektronische Signale umwandeln."

    //Eigenschaften
    case serienaufnahme = "Die Serienaufnahme funktioniert durch schnelles, wiederholtes Öffnen und Schließen des Verschlusses, um mehrere Bilder in kurzer Zeit aufzunehmen."
    
    case defaultCase = "Für weitere Informationen, lesen Sie bitte das Buch 'Licht und Belichtung in der Fotografie' von Reinhard Merz und Karl Stechl."
}
