//
//  home.swift
//  JVJ
//
//  Created by Nico Ihle on 27.11.22.
//

/*

import Foundation
import SwiftUI

struct Response: Codable {
    var results: [Result]
}

struct Result: Codable {
    var trackId: Int
    var trackName: String
    var collectionName: String
}

struct Home: View {
    
    @State private var javadata: [JavaData] = []
    @State private var results = [Result]()
    
    private var people : [Person] = Person.allPeople
    
    private let emojiList: [EmojiItem] = [
        EmojiItem(
            emoji: "👾",
            headline: "Your First Leasson",
            descripton: "Welcome to Java!",
            boxcontent : "Java is one of the most popular programming languages."
        ),
    ]
    
    var body: some View {
        
        VStack{
            NavigationView{
                List(emojiList){ EmojiItem in
                    NavigationLink(destination: DetailViews(emojiItem: EmojiItem)) {
                        HStack {
                            ListCircleView(emojiItem: EmojiItem)
                            Text(EmojiItem.headline)
                                .font(.headline)
                        } .padding(7)
                    }
                }
                .navigationBarTitle("JVJ")
                //.navigationBarTitleDisplayMode(.inline)
            }
            List(results, id: \.trackId) { item in
                VStack(alignment: .leading) {
                    Text(item.trackName)
                        .font(.headline)
                    
                }
            }
            
            .task {
                await loadData()
            }
        }
    }
    
    func loadData() async {
        guard let url = URL(string: "https://itunes.apple.com/search?term=taylor+swift&entity=song") else {
            print("Invalid URL")
            return
        }
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            
            if let decodedResponse = try? JSONDecoder().decode(Response.self, from: data) {
                results = decodedResponse.results
            }
            // more code to come
        } catch {
            print("Invalid data")
        }
    }
    
    private func readFile() {
        if let url = Bundle.main.url(forResource: "data", withExtension: "json"),
           let data = try? Data(contentsOf: url) {
            let decoder = JSONDecoder()
            if let jsonData = try? decoder.decode(JSONData.self, from: data) {
                self.javadata = jsonData.javaData
            }
        }
    }
}


struct DetailViews: View{
    let emojiItem: EmojiItem
    
    var body: some View{
        VStack(alignment: .leading) {
            
            HStack {
                //Slider
            }
            
            GroupBox {
                VStack(alignment: .leading) {
                    HStack {
                        Text(emojiItem.descripton)
                            .font(.title)
                            .bold()
                        //.frame(maxWidth: .infinity, alignment: .leading)
                    }
                    
                    Divider()
                        .font(.largeTitle)
                    //Text("Please log in")
                    // with frame i can center... text or somthing with alignment
                        .frame(height: 4, alignment: .center )
                    //.frame(maxWidth: .infinity, alignment: .center )
                        .font(.largeTitle)
                        .foregroundColor(.white)
                        .background(.purple)
                    Text(emojiItem.boxcontent)
                }
            }
            GroupBox {
                VStack(alignment: .leading) {
                    HStack {
                        Text(emojiItem.descripton)
                            .font(.title)
                            .bold()
                        //.frame(maxWidth: .infinity, alignment: .leading)
                    }
                    
                    Divider()
                        .font(.largeTitle)
                        .frame(height: 4, alignment: .center )
                        .font(.largeTitle)
                        .foregroundColor(.white)
                        .background(.purple)
                    Text(emojiItem.boxcontent)
                }
            }
            Button(action: ARButton) {
                Text("Practice in AR")
            }
            Spacer()
        }
        .padding()
        .navigationBarTitle(emojiItem.headline)
        .navigationBarTitleDisplayMode(.inline)
    }
}

func ARButton() {
    
}

struct ListCircleView: View {
    let emojiItem: EmojiItem
    
    var body: some View{
        ZStack{
            Text(emojiItem.emoji)
                .shadow(radius: 3)
                .font(.largeTitle)
                .frame(width: 65, height: 65)
                .overlay(Circle().stroke(Color.purple, lineWidth: 3))
        }
    }
}

struct JSONData: Decodable {
    let javaData: [JavaData]
}

struct JavaData: Decodable, Identifiable {
    let id: String
    let name: String
    let latitude: Double
    let longitude: Double
}

struct EmojiItem : Identifiable {
    let id = UUID()
    let emoji: String
    let headline: String
    let descripton: String
    let boxcontent: String
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
*/
