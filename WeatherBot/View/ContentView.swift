//
//  ContentView.swift
//  ChatBot
//
//  Created by Markus Platter on 26.09.23.
//

import SwiftUI
import NaturalLanguage

struct ContentView: View {
    
    @ObservedObject var conversation = Conversation()
    @State var inputText: String = ""
    @State var conversationLocation: String?
    
    var body: some View {
        
        VStack {
            ScrollView {
                ForEach (conversation.messageList, id: \.id) { message in
                    if message.isFromUser == true {
                        MessageCellViewUser(nameTitle: message.name, text: message.text)
                            .id(message.id)
                    } else {
                        MessageCellViewBot(text: message.text)
                            .id(message.id)
                    }
                }
            }
            
            HStack {
                
                TextField("Nachricht", text: $inputText)
                    .foregroundColor(.black)
                    .padding(8)
                    .background(Color(red: 230 / 255, green: 230 / 255, blue: 230 / 255))
                    .cornerRadius(30)
                    .padding(.leading, 20)
                    .padding(.bottom)
                    .padding(.top)
                    .padding(.trailing, 5)
                
                Button {
                    let wordTagger = WordTagger()
                    let weatherManager = WeatherManager()
                    
                        let userMessage = Message(name: "User", text: inputText, isFromUser: true)
                        conversation.addMessage(userMessage)
                        
                        let locations = wordTagger.getLocation(from: inputText)
                        
                        if !locations.isEmpty {
                            for eachLocation in locations {
                                conversationLocation = eachLocation
                                weatherManager.fetchWeather(from: eachLocation) { weatherData in
                                    if let weatherData = weatherData {
                                        let botRespnse = BotResponse(weatherData: weatherData)
                                        let botMessage = Message(name: "WeatherBot", text: botRespnse.createBotResponse(from: inputText), isFromUser: false)
                                        DispatchQueue.main.async {
                                            conversation.addMessage(botMessage)
                                            inputText = ""
                                        }
                                    }
                                }
                            }
                        } else if locations.isEmpty && (conversationLocation != nil) {
                            print("Zweiter Block")
                            print("locations.isEmpty: \(locations.isEmpty)")
                            print("conversationLocation: \(String(describing: conversationLocation))")
                            print("conversationLocation?.isEmpty: \(String(describing: conversationLocation?.isEmpty))")

                            if let safeLocation = conversationLocation {
                                weatherManager.fetchWeather(from: safeLocation) { weatherData in
                                    if let weatherData = weatherData {
                                        let botRespnse = BotResponse(weatherData: weatherData)
                                        let botMessage = Message(name: "WeatherBot", text: "\(botRespnse.createBotResponse(from: inputText)) Für ein präziseres Antwortverhalten bitte ich darum, Fragen in vollständigen Sätzen zu formulieren. Vielen Dank für Ihr Verständnis.", isFromUser: false)
                                        DispatchQueue.main.async {
                                            print("Jetzt")
                                            conversation.addMessage(botMessage)
                                            inputText = ""
                                        }
                                    }
                                }
                            }
                            
                        } else if locations.isEmpty && (conversationLocation == nil) {
                            print("Dritter Block")
                            print("locations.isEmpty: \(locations.isEmpty)")
                            print("conversationLocation: \(String(describing: conversationLocation))")
                            print("conversationLocation?.isEmpty: \(String(describing: conversationLocation?.isEmpty))")

                            let botMessage = Message(name: "WeatherBot", text: "Um Ihnen präzise und hilfreiche Antworten bieten zu können, bitte ich um die Formulierung Ihrer Fragen in vollständigen Sätzen und um eine sorgfältige Rechtschreibprüfung. Herzlichen Dank für Ihr Verständnis.", isFromUser: false)
                            conversation.addMessage(botMessage)
                            inputText = ""
                        }
                } label: {
                    Image(systemName: "paperplane.circle.fill")
                        .resizable()
                        .frame(width: 35, height: 35)
                        .foregroundColor(.white)
                }
                .padding(.trailing, 20)
                
            }
            .padding(.top, 10)
            .background(Color(red: 33 / 255, green: 45 / 255, blue: 49 / 255))
        }
        .background(Color(red: 76 / 255, green: 119 / 255, blue: 145 / 255))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
