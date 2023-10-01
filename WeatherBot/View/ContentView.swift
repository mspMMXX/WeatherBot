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
    
    var body: some View {
        
        VStack {
            ScrollView {
                ForEach (conversation.messageList, id: \.id) { message in
                    if message.isFromUser == true {
                        MessageCellViewUser(nameTitle: message.userName, text: message.text)
                    } else {
                        MessageCellViewBot(text: message.text)
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
                    
                    let userMessage = Message(userName: "Markus", text: inputText, isFromUser: true)
                    conversation.addMessage(userMessage)
                    
                    let wordTagger = WordTagger()
                    //let botresponse = BotResponse()
                    let weatherManager = WeatherManager()

                    let locations = wordTagger.getLocation(from: inputText)
                    for eachLocation in locations {
                        //let botMessage = Message(userName: "bot", text: weatherManager.fetchWeather(from: eachLocation), isFromUser: false)
                        weatherManager.fetchWeather(from: eachLocation)
                        //conversation.addMessage(botMessage)
                    }
                    
                    inputText = ""
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
