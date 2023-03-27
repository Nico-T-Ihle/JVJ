//
//  ListAllTak.swift
//  JVJ
//
//  Created by Nico Ihle on 28.01.23.
//

import Foundation
import SwiftUI

struct ListAllTak: View {

    private var people: [Person] = Person.allPeople
    private let colors: [Color] = [.pink, .purple]

    private let adaptiveColumns = [
        GridItem(.adaptive(minimum: 170))
    ]
    
    // alternative to girdlayout
    private let numberColumns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
    ]
    
    var body: some View{
        
        NavigationView {
            
            ScrollView {
                
                LazyVGrid(columns: adaptiveColumns, spacing: 20) {
                    
                    ForEach(people, id: \.chapter) { person in
                        
                        ZStack{
                            
                            Rectangle()
                                .frame(width: 170, height: 170)
                                .foregroundColor(colors[person.key%2])
                                .cornerRadius(30)
                            
                            VStack {
                                // ofcourse use parameter to set the value for each
                                SwitchRow(value: false)
                            }
                        }
                    }
                }
            }
            .padding()
            .navigationTitle("Grid Sample")
        }
    }
}

struct SwitchRow: View {
    @State var value: Bool

    var body: some View {
        Toggle(isOn: $value) {
            
        }
        .toggleStyle(CheckFavorite())
    }
}

struct CheckFavorite: ToggleStyle {
    func makeBody(configuration: Configuration) -> some View {
        
        Button {
            configuration.isOn.toggle()
        } label: {
            Label {
                configuration.label
            } icon: {
                Image(systemName: configuration.isOn ? "star.fill" : "star")
                    .foregroundColor(configuration.isOn ? .accentColor : .secondary)
                    .accessibility(label: Text(configuration.isOn ? "Checked" : "Unchecked"))
                    .imageScale(.large)
            }
        }
        .buttonStyle(PlainButtonStyle())
    }
}

struct ListAllTak_Previews: PreviewProvider {
    static var previews: some View{
        ListAllTak()
    }
}
