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
    let titleName: String = "WeatherBot"
    
    var body: some View {
        
        VStack {

            Label(titleName, systemImage: "")
                .ignoresSafeArea()
                .frame(height: 30)
                .fontWeight(.bold)
                .foregroundColor(.white)
            
            Divider()
                .colorInvert()
            
            ScrollView {
                
                ScrollViewReader { proxy in
                    
                    ForEach(conversation.messageList, id: \.id) { message in
                        
                        if message.isFromUser {
                            MessageCellViewUser(nameTitle: message.name, text: message.text)
                                .id(message.id)
                        } else {
                            MessageCellViewBot(text: message.text)
                                .id(message.id)
                        }
                    }
                    .onChange(of: conversation.messageList.count) {
                        if let lastMessage = conversation.messageList.last {
                            withAnimation {
                                proxy.scrollTo(lastMessage.id, anchor: .bottom)
                            }
                        }
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
                    conversation.addMessage(message: userMessage)
                        
                        let locations = wordTagger.getLocation(from: inputText)
                        
                        if !locations.isEmpty {
                            for eachLocation in locations {
                                conversationLocation = eachLocation
                                weatherManager.fetchWeather(from: eachLocation) { weatherData in
                                    if let weatherData = weatherData {
                                        let botRespnse = BotResponse(weatherData: weatherData)
                                        let botMessage = Message(name: "WeatherBot", text: botRespnse.createBotResponse(from: inputText), isFromUser: false)
                                        DispatchQueue.main.async {
                                            conversation.addMessage(message: botMessage)
                                            inputText = ""
                                        }
                                    }
                                }
                            }
                        } else if locations.isEmpty && (conversationLocation != nil) {

                            if let safeLocation = conversationLocation {
                                weatherManager.fetchWeather(from: safeLocation) { weatherData in
                                    if let weatherData = weatherData {
                                        let botRespnse = BotResponse(weatherData: weatherData)
                                        let botMessage = Message(name: "WeatherBot", text: "\(botRespnse.createBotResponse(from: inputText)) Sollten Sie mit dem Ergebnis nicht zufrieden sein, bitte ich Sie, einen genauen Standort für präzisere Wetterinformationen anzugeben.", isFromUser: false)
                                        DispatchQueue.main.async {
                                            conversation.addMessage(message: botMessage)
                                            inputText = ""
                                        }
                                    }
                                }
                            }
                            
                        } else if locations.isEmpty && (conversationLocation == nil) {
                            
                            let botMessage = Message(name: "WeatherBot", text: "Leider konnte ich keine Wetterdaten für Ihre Anfrage finden. Für eine genauere Wetterinformation bitte ich um die Bekanntgabe des spezifischen Standortes und der Wetterinformation, die Sie interessiert. Vielen Dank.", isFromUser: false)
                            conversation.addMessage(message: botMessage)
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
