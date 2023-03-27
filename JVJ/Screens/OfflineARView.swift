//
//  OfflineARView.swift
//  JVJ
//
//  Created by Nico Ihle on 18.02.23.
//

import Foundation
import SwiftUI

struct OfflineARView: View{
    
    var body: some View{
        VStack{
            Image("QuestionPerson")
                .blur(radius: 0)
        }
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: 300, alignment: .center)
        .background(Color(red: 152 / 255, green: 226 / 255, blue: 253 / 255))
        .overlay(
            RoundedRectangle(cornerRadius: 5)
                .stroke(.black, lineWidth: 3.5)
        )
    }
}

struct OfflineARView_Preview: PreviewProvider {
    static var previews: some View {
        OfflineARView()
    }
}
