import Foundation
import SwiftUI

struct splashscreen: View {
    @StateObject private var modelData = ModelData()
    @State private var isActive = false
    @State private var size = 0.8
    @State private var opacity = 0.5
    
    let backgroundGradient = LinearGradient(
        gradient: Gradient(colors: [
            Color(red: 241 / 255, green: 185 / 255, blue: 251 / 255),
            Color(red: 206 / 255, green: 253 / 255, blue: 254 / 255) 
        ]),
        startPoint: .top, endPoint: .bottom)
    
    let gradient = Gradient(colors: [
        Color.blue,
        Color.pink,
        Color.yellow
    ])

    
    var body: some View {
        
        if isActive {
            ContentView()
                .environmentObject(modelData)
        } else {
            ZStack {
                Image("backgroundpink")
                    .resizable()
                    .edgesIgnoringSafeArea(.all)
                VStack{
                    Image("splashscreenImage")
                    Text("loading...")
                        .foregroundColor(Color.black)
                        .font(.system(size: 30))
                }
                .scaleEffect(size)
                .opacity(opacity)
                .onAppear {
                    withAnimation(.easeIn(duration: 1.2)){
                        self.size = 0.9
                        self.opacity = 1.0
                    }
                }
                
                .onAppear{
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2.0){
                        withAnimation {
                            self.isActive = true
                        }
                    }
                }
            }
        }
    }
}

struct splashscreen_Previews: PreviewProvider {
    static var previews: some View {
        splashscreen()
    }
}
