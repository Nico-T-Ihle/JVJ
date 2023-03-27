import SwiftUI

struct ListView: View {
    
    init() {
        //Use this if NavigationBarTitle is with Large Font
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor.black]
        
        //Use this if NavigationBarTitle is with displayMode = .inline
        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor.black]
    }
    
    @EnvironmentObject var modelData: ModelData
    @State private var showFavoritesOnly = false
    
    var filteredLandmarks: [FLQM] {
        modelData.faqData.filter { faq in
            (!showFavoritesOnly || faq.isFavorite)
        }
    }
    
    let backgroundGradient = LinearGradient(
        colors: [
            Color(red: 249 / 255, green: 78 / 255, blue: 178 / 255),
            Color(red: 134 / 255, green: 253 / 255, blue: 245 / 255),
        ], startPoint: .top, endPoint: .bottom)
    
    private let colors: [Color] = [
        Color(red: 152 / 255, green: 226 / 255, blue: 253 / 255),
        Color(red: 238 / 255, green: 225 / 255, blue: 255 / 255),
        Color(red: 196 / 255, green: 172 / 255, blue: 244 / 255) ]
    
    private let adaptiveColumns = [
        GridItem(.adaptive(minimum: 130))
    ]
    // change grid layout
    
    @State private var filter = false
    
    let columuns: [GridItem] = [GridItem(), GridItem()]
    
    var body: some View{
        
        VStack{
            VStack{
                NavigationView{
                    
                    ZStack{
                        Image("backgroundpink")
                            .resizable()
                            .edgesIgnoringSafeArea(.all)
                        VStack{
                            
                            ScrollView {
                                
                                ZStack {
                                    HStack {
                                        Text("Favorites")
                                            .foregroundColor(.black)
                                            .font(.system(size: 30))
                                        Spacer()
                                    }
                                    
                                    HStack {
                                        
                                        Spacer()
                                        Toggle(isOn: $showFavoritesOnly, label: {
                                            Label("", systemImage: "slider.horizontal.3")
                                               
                                        })
                                        .toggleStyle(ButtonToggleStyle())
                                        .foregroundColor(.black)
                                        .font(.system(size: 25))
                                    }
                                }
                                
                                Spacer().frame(height: 50)
                                
                                LazyVGrid(columns: columuns) {
                                    
                                    ForEach(filteredLandmarks, id: \.key) { faq in
                                        NavigationLink(destination: CurseView(faq: faq)) {
                                            Rectangle()
                                                .foregroundColor(colors[faq.key%3])
                                                .frame(height: 180)
                                                .border(.black)
                                                .overlay(
                                                    Text("\(faq.chapter)")
                                                        .foregroundColor(Color.black)
                                                        .padding()
                                                )
                                        }
                                    }
                                }
                                
                            }
                            .padding()
                        }
                    }
                    .navigationBarTitle("JVJ")
                    .navigationBarTitleDisplayMode(.inline)
                }.accentColor(.black)
            }
        }
    }
}

struct ListView_Previews : PreviewProvider {
    static var previews: some View {
        ListView()
            .environmentObject(ModelData())
    }
}
