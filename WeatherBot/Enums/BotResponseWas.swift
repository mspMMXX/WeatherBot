//
//  BotResponse.swift
//  ChatBot
//
//  Created by Markus Platter on 28.09.23.
//

import Foundation

enum BotResponseWas: String, CaseIterable {
    
    //Werte-Einstllungen
    case blende = "Die Blende ist eine Öffnung, meist im Objektiv verbaut, die die Menge des einfallenden Lichts steuert, das auf den Sensor fällt."
    case brennweite = "Brennweite ist der Abstand zwischen Objektiv und Fokuspunkt. Sie beeinflusst Zoom und Bildausschnitt."
    case iso = "ISO steuert die Lichtempfindlichkeit des Sensors. Höherer ISO = helleres Bild, aber mehr Rauschen."
    case verschlusszeit = "Verschlusszeit ist die Dauer, für die der Verschluss geöffnet ist. Kurze Zeit = weniger Licht, weniger Bewegung. Lange Zeit = mehr Licht, mehr Bewegung."
    case fokus = "Fokus ist die Einstellung der Schärfe auf ein bestimmtes Objekt im Bild."
    case weissabgleich = "Weißabgleich korrigiert die Farbtemperatur, um natürliche Farben zu erzielen."
    
    //Licht-Schärfe
    case schlagschatten = "Schlagschatten ist ein visueller Effekt, der einem Objekt einen Schatten hinzufügt, um Tiefe zu erzeugen."
    case tiefenschaerfe = "Tiefenschärfe bezeichnet den Bereich im Bild, der scharf abgebildet ist. Beeinflusst durch Blende und Brennweite."
    case bokeh = "Bokeh bezeichnet die Qualität des unscharfen Hintergrunds in einem Foto."
    case primaerfarben = "Primärfarben sind Grundfarben, die nicht durch Mischen anderer Farben erzeugt werden können. In der Fotografie oft Rot, Grün, Blau."
    
    //Equipment
    case objektiv = "Objektiv ist die optische Komponente einer Kamera, die Licht auf den Sensor lenkt und das Bild erzeugt."
    case gegenlichtblende = "Gegenlichtblende blockiert seitliches Licht, um Blendung und Lens Flare zu reduzieren."
    case integralbelichtungsmesser = "Integralbelichtungsmesser misst das gesamte Licht im Bildfeld zur Ermittlung der optimalen Belichtung."
    case stativ = "Stativ stabilisiert die Kamera für scharfe Aufnahmen und ermöglicht längere Belichtungszeiten."
    case teleobjektiv = "Teleobjektiv hat eine lange Brennweite und ermöglicht Aufnahmen von weit entfernten Objekten."
    
    //Farbe
    case kontrast = "Kontrast ist der Unterschied zwischen hellen und dunklen Bereichen im Bild."

    //Komponenten
    case linse = "Linse ist ein optisches Element, das Lichtstrahlen bündelt oder streut, um ein Bild zu erzeugen."
    case verschluss = "Verschluss steuert, wie lange der Sensor belichtet wird. Beeinflusst Helligkeit und Bewegungsunschärfe."
    case bildsensor = "Bildsensor ist die Komponente in der Kamera, die Licht in elektronische Daten umwandelt."
    case liveView = "LiveView zeigt in Echtzeit das Bild an, das der Sensor erfasst, meist auf dem Kameradisplay."
    
    //Bildgestaltung
    case motiv = "Motiv ist das Hauptobjekt oder Thema, das in einem Bild oder Kunstwerk dargestellt wird."
    case format = "Format bezieht sich auf die Abmessungen oder das Seitenverhältnis eines Bildes oder Videos."

    //Eigenschaften
    case serienaufnahme = "Serienaufnahmen sind mehrere Fotos, die in schneller Folge aufgenommen werden. Gut für bewegte Szenen."
    case bildaufloesung = "Bildauflösung ist die Anzahl der Pixel, aus denen ein Bild besteht. Höhere Auflösung = mehr Details."
    
    case defaultCase = "Für weitere Informationen, lesen Sie bitte das Buch 'Licht und Belichtung in der Fotografie' von Reinhard Merz und Karl Stechl."
}
