//
//  FullScreen.swift
//  JVJ
//
//  Created by Nico Ihle on 08.03.23.
//

import Foundation
import SwiftUI


struct FullScreenModalView: View {
    @Environment(\.dismiss) var dismiss

    @EnvironmentObject var modelData: ModelData
    
    var faq: FLQM
    
    var body: some View {
        ZStack {
            Color.primary.edgesIgnoringSafeArea(.all)
            //For the Bottom Top edges there is a white gab
            
            ARViewContainer(faq: faq)
            
            Button {
                dismiss()
            } label: {
                Image(systemName: "x.circle")
                    .font(.system(size: 30))
                    .foregroundColor(Color(red: 196 / 255, green: 172 / 255, blue: 244 / 255))
            }    .frame(
                maxWidth: .infinity,
                maxHeight: .infinity,
                alignment: Alignment.topTrailing
            )
        }
    }
}

struct FullScreenModalView_Preview : PreviewProvider {
    static let modelData = ModelData()
    
    static var previews: some View {
        FullScreenModalView(faq: modelData.faqData[0])
            .environmentObject(modelData)
    }
}
