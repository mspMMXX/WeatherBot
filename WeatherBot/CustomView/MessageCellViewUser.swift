//
//  MessageCellViewUser.swift
//  ChatBot
//
//  Created by Markus Platter on 26.09.23.
//

import Foundation
import SwiftUI

struct MessageCellViewUser: View {
    
    var nameTitle: String
    var text: String
    
    var body: some View {
        VStack {
            Text(nameTitle)
                .foregroundColor(.white)
                .frame(maxWidth: .infinity, alignment: .trailing)
                .padding(.trailing, 15)
                .padding(.top,10)
                .fontWeight(.bold)
            
            Divider()
                .frame(height: 0.8)
                .background(Color.white)
                .padding(.leading, 15)
                .padding(.trailing, 15)
            
            Text(text)
                .foregroundColor(.white)
                .frame(maxWidth: .infinity, alignment: .trailing)
                .multilineTextAlignment(.trailing)
                .padding(.leading, 15)
                .padding(.bottom, 15)
                .padding(.trailing, 15)
        }
        .background(
            RoundedRectangle(cornerRadius: 20)
                .foregroundColor(Color(red: 119 / 255, green: 152 / 255, blue: 191 / 255))
        )
        .padding(.trailing)
        .padding(.leading, 60)
    }
}

