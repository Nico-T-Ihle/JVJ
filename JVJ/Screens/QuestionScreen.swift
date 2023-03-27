//
//  QuestionScreen.swift
//  JVJ
//
//  Created by Nico Ihle on 08.03.23.
//

import Foundation
import SwiftUI

struct QuestionScreen : View {
    @Environment(\.dismiss) var dismiss
    
    @EnvironmentObject var modelData: ModelData
    var faq: FLQM
    
    var landmarkIndex: Int {
        modelData.faqData.firstIndex(where: { $0.key == faq.key })!
    }
    
    @State private var isSelected = false
    @State private var isSelectedSecond = false
    @State private var defaultText = "Check"
    @State private var disableButton = false
    
    @State var firstbutton = Color.black
    @State var secondbutton = Color.black
    @State var checkressult = false
    
    let backgroundGradient = LinearGradient(
        colors: [
            Color(red: 196 / 255, green: 172 / 255, blue: 244 / 255),
            Color(red: 152 / 255, green: 226 / 255, blue: 253 / 255),
        ], startPoint: .top, endPoint: .bottom)
    
    func getRessult() {

        if(isSelected != false && isSelectedSecond != false) {
            defaultText = "You can't select both"
            firstbutton = Color.black
            secondbutton = Color.black
            disableButton = true
        } else {
            firstbutton = Color.black
            secondbutton = Color.black
            defaultText = "Check"
            disableButton = false
        }
    }
    
    func checkbutonResult() {
        
        if(isSelected != false) {
            firstbutton = Color.green
        } else {
            firstbutton = Color.black
        }
        
        
        if(isSelectedSecond != false) {
            secondbutton = Color.red
        } else {
            secondbutton = Color.black
        }
    }
    
    var body: some View {
        ZStack{
            backgroundGradient.ignoresSafeArea() // 1
            
            VStack{
                
                ZStack{
                    
                    HStack{
                        Text("Quizz")
                            .fontWeight(.bold)
                            .foregroundColor(Color(red: 39 / 255, green: 39 / 255, blue: 39 / 255))
                            .font(.system(size: 20))
                        Spacer()
                    }
        
                    .padding(.trailing)
                    
                    HStack{
                        Spacer()
                        Button(action: {
                            dismiss()
                        }){
                            Image(systemName: "x.circle")
                                .foregroundColor(.black)
                                .font(.system(size: 20))
                        }
                        
                    }
                    .padding(.leading)
                    .padding(.trailing)
                }
                .padding()
                
                Divider()
                    .frame(height: 0.5)
                    .overlay(Color(red: 39 / 255, green: 39 / 255, blue: 39 / 255))
                    .padding(.leading)
                    .padding(.trailing)
                
                VStack {
                    // the question from json
                    HStack {
                        Text(faq.quizz)
                        Spacer()
                    }
                    
                    VStack {
                        
                        VStack {
                            HStack {
                                
                                Toggle(isOn: $isSelected, label: {
                                    Label("", systemImage: isSelected ? "circle.circle.fill" : "circle")
                                        .foregroundColor(firstbutton)
                                })
                                .onChange(of: isSelected, perform: { newValue in
                                    getRessult()
                                })
                                .toggleStyle(ButtonToggleStyle())
                                
                                Text("true")
                                    .foregroundColor(Color.black)
                                Spacer()
                            }
                            
                            Divider()
                                .frame(height: 0.5)
                                .overlay(Color.black)
                            
                        }.padding(.top, 10)
                        
                        VStack {
                            HStack {
                                
                                Toggle(isOn: $isSelectedSecond, label: {
                                    Label("", systemImage: isSelectedSecond ? "circle.circle.fill" : "circle")
                                        .foregroundColor(secondbutton)
                                })
                                .onChange(of: isSelectedSecond, perform: { newValue in
                                    getRessult()
                                })
                                .toggleStyle(ButtonToggleStyle())
                                
                                Text("false")
                                    .foregroundColor(Color.black)
                                Spacer()
                            }
                            
                            Divider()
                                .frame(height: 0.5)
                                .overlay(Color.black)
                            
                        }
                        
                        // ADD: New List element
                        
                    }
                    .background(Color(red: 152 / 255, green: 226 / 255, blue: 253 / 255))
                    .cornerRadius(5)
                    
                    /// New Objects
                    Spacer()
                    
                    Button(defaultText) {
                        checkbutonResult()
                    }
                    .disabled(disableButton)
                    .padding()
                    .background(Color(red: 196 / 255, green: 172 / 255, blue: 244 / 255))
                    .foregroundColor(Color.black)
                    .clipShape(Rectangle())
                    .cornerRadius(10)
                    
                }
                .padding()
                Spacer()
            }
        }
    }
}

struct QuestionScreen_Previews : PreviewProvider {
    static let modelData = ModelData()
    
    static var previews: some View {
        QuestionScreen(faq: modelData.faqData[0])
            .environmentObject(modelData)
    }
}
