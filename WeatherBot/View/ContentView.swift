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
    let titleName: String = "WeatherBot"
    
    var body: some View {
        
        VStack {
            ///Titel
            Label(titleName, systemImage: "")
                .ignoresSafeArea()
                .frame(height: 30)
                .fontWeight(.bold)
                .foregroundColor(.white)
            
            ///Chatfenster
            ScrollView {
                ScrollViewReader { proxy in
                    
                    /// Durchlauf aller Nachrichten in conversation
                    ForEach(conversation.messageList, id: \.id) { message in
                        if message.isFromUser {
                            MessageCellViewUser(nameTitle: message.author, text: message.text)
                                .id(message.id)
                        } else {
                            MessageCellViewBot(text: message.text)
                                .id(message.id)
                        }
                    }
                    .onChange(of: conversation.messageList.count) {
                        ///Scrollt zur letzten Nachricht
                        if let lastMessage = conversation.messageList.last {
                            withAnimation {
                                proxy.scrollTo(lastMessage.id, anchor: .bottom)
                            }
                        }
                    }
                }
            }
            HStack {
                
                /// Eingabe TextFeld für User
                TextField("Nachricht", text: $inputText)
                    .foregroundColor(.black)
                    .padding(8)
                    .background(Color(red: 230 / 255, green: 230 / 255, blue: 230 / 255))
                    .cornerRadius(30)
                    .padding(.leading, 20)
                    .padding(.bottom)
                    .padding(.top)
                    .padding(.trailing, 5)
                
                /// Sende Button
                Button {
                    handleMessages()
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
    
    /// Verarbeitet das Senden einer Nachricht
    func handleMessages() {
        let wordTagger = LocationTagger()
        let weatherManager = WeatherManager()
        let userInput = inputText
        
        let userMessage = Message(author: "User", text: userInput, isFromUser: true)
        conversation.addMessage(message: userMessage)
        inputText = ""
        
        let locations = wordTagger.getLocation(from: userInput)
        
        if !locations.isEmpty {
            for eachLocation in locations {
                weatherManager.fetchWeather(from: eachLocation) { weatherData in
                    if let weatherData = weatherData {
                        let botRespnse = BotResponse(weatherData: weatherData)
                        let botMessage = Message(author: "WeatherBot", text: botRespnse.createBotResponse(from: userInput), isFromUser: false)
                        
                        DispatchQueue.main.async {
                            conversation.addMessage(message: botMessage)
                        }
                    }
                }
            }
        } else if locations.isEmpty {
            
            let botMessage = Message(author: "WeatherBot", text: "Würden Sie so freundlich sein, Ihre Anfrage in einem Satz zu artikulieren und den genauen Standort zu nennen? Leider kann ich Ihnen nicht zu jeden Standort Wetterinformationen bieten, da nicht jeder Ort seine Wetterdaten zu Verfügung stellt.", isFromUser: false)
            conversation.addMessage(message: botMessage)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
