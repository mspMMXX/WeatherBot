//
//  MessageCellViewBot.swift
//  ChatBot
//
//  Created by Markus Platter on 26.09.23.
//

import Foundation
import SwiftUI

struct MessageCellViewBot: View {
    
    private let botName: String = "Bot"
    var text: String
    
    var body: some View {
        VStack {
            Text(botName)
                .foregroundColor(.white)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading, 15)
                .padding(.top,10)
                .fontWeight(.bold)
            
            Divider()
                .frame(height: 0.8)
                .background(Color.white)
                .padding(.leading, 15)
                .padding(.trailing, 15)
            
            Text(text)
                .foregroundColor(.white)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading, 15)
                .padding(.bottom, 15)
                .padding(.trailing, 15)
        }
        .background(
            RoundedRectangle(cornerRadius: 20)
                .foregroundColor(Color(red: 160 / 255, green: 120 / 255, blue: 130 / 255))
        )
        .padding(.trailing, 60)
        .padding(.leading)
    }
}
