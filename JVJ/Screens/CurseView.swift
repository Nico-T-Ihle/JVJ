import SwiftUI

struct CurseView: View {
    
    @EnvironmentObject var modelData: ModelData
    var faq: FLQM
    
    var landmarkIndex: Int {
        modelData.faqData.firstIndex(where: { $0.key == faq.key })!
    }
    
    @State private var showingPopover = false
    
    @State var isSelected: Bool = false
    @State var isSelectedx: Bool = false
    @State var defaultButtonColor = Color.purple
    @State var defaultButtonText = "Check"
    @State var isSet = false
    @State private var showSheet: Bool = false
    @State private var isPresented = false
    @State private var isQuestion = false
    
    func popoverButton() {
        
        if(isSelected != false && isSelectedx != false){
            print("Erro, you only can select one box")
            defaultButtonText = "Wrong"
            defaultButtonColor = Color.red
        } else {
            if(isSelected != false){
                print("Sorry, it's wrong")
                defaultButtonColor = Color.red
                defaultButtonText = "Wrong"
            } else if(isSelectedx != false){
                print("Perfect!")
                defaultButtonColor = Color.green
                defaultButtonText = "Perfect"
            }
        }
    }
    
    let backgroundGradient = LinearGradient(
        colors: [
            Color(red: 196 / 255, green: 172 / 255, blue: 244 / 255),
            Color(red: 152 / 255, green: 226 / 255, blue: 253 / 255),
        ], startPoint: .top, endPoint: .bottom)
    
    var body: some View {
        
        ZStack{
            backgroundGradient.ignoresSafeArea() // 1
            
            VStack{
                
                NavigationView{
                    
                    ZStack{
                        backgroundGradient.ignoresSafeArea() // 1
                        VStack(){
                            // vstack to add the divider and under it the scrollview
                            Divider()
                                .frame(height: 0.5)
                                .overlay(.black)
                            
                            Spacer().frame(height: 30)
                            
                            ScrollView(){
                                
                                GroupBox {
                                    VStack(alignment: .leading) {
                                        HStack {
                                            Text(faq.chapter)
                                                .font(.title)
                                                .bold()
                                        }
                                        
                                        Divider()
                                            .frame(height: 0.5)
                                            .overlay(.black)
                                        
                                        Text(faq.contentpartone)
                                    }.padding()
                                }   .groupBoxStyle(groupBoxDefaultStyle())
                                
                                Spacer().frame(height: 20)
                                
                                GroupBox {
                                    VStack(alignment: .leading) {
                                        Text(faq.contentpartthree)
                                            .padding()
                                    }
                                    
                                }.groupBoxStyle(groupBoxDefaultStyle())
                                
                                Spacer().frame(height: 20)
                                
                                
                                VStack {
                                    Text("Questions")
                                        .padding()
                                    Text("so if your finished with reading you can know try your knowlage with a tow quizz games.")
                                        .padding(.trailing, 9)
                                        .padding(.leading, 9)
                                    
                                    Divider().background(Color.black)
                                    HStack{
                                        VStack {
                                            
                                            Button(action: {
                                                isQuestion.toggle()
                                            }) {
                                                HStack {
                                                    Image(systemName: "ellipsis.bubble")
                                                    Text("Questions")
                                                    
                                                }.foregroundColor(.black)
                                            }
                                            .fullScreenCover(isPresented: $isQuestion) {
                                                QuestionScreen(faq: faq)
                                            }
                                            
                                        }
                                        .frame(maxWidth: .infinity, alignment: .center)
                                        .padding()
                                        
                                        Divider().background(Color.black)
                                        
                                        VStack(alignment: .center) {
                                            
                                            Button(action: {
                                                isPresented.toggle()
                                            }) {
                                                HStack {
                                                    Image(systemName: "arkit")
                                                    Text("AR")
                                                    
                                                }.foregroundColor(.black)
                                            }
                                            .fullScreenCover(isPresented: $isPresented) {
                                                FullScreenModalView(faq: faq)
                                            }
                                            //method fullScreenCover
                                            
                                        }
                                        .frame(maxWidth: .infinity, alignment: .center)
                                        .padding()
                                    }
                                }
                                .background(Color(red: 196 / 255, green: 172 / 255, blue: 244 / 255))
                                .overlay(
                                    RoundedRectangle(cornerRadius: 5)
                                        .stroke(.black, lineWidth: 1)
                                )
                                
                            }
                        }
                        
                    }
                    
                }
                .navigationBarTitleDisplayMode(.inline)
                .navigationTitle(faq.headline)
                .navigationBarItems(trailing: HStack{
                    
                    FavoriteButton(isSet: $modelData.faqData[landmarkIndex].isFavorite)
                    /*
                    Button(action: {}){
                        Image(systemName: "square.and.arrow.up")
                    }
                    */
                } )
                
                .padding()
            }
        }
    }
    
}
struct ArCircelView: View {
    var faq: FLQM
    
    var body: some View{
        ARTest(faq: faq)
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: 300, alignment: .center)
            .background(Color.white)
            .clipShape(RoundedRectangle(cornerRadius: 5.0, style: .continuous))
    }
}


struct groupBoxDefaultStyle: GroupBoxStyle {
    var background: some View {
        RoundedRectangle(cornerRadius: 5)
            .fill(Color.purple)
        
    }
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.content
            .frame(minHeight: 0, maxHeight: .infinity)
            .frame(minWidth: 0, maxWidth: .infinity)
            .background(Color(red: 152 / 255, green: 226 / 255, blue: 253 / 255))
            .foregroundColor(Color.black)
            .overlay(
                RoundedRectangle(cornerRadius: 5)
                    .stroke(.black, lineWidth: 1)
            )
    }
}


struct InfoBoxStyle: GroupBoxStyle {
    var background: some View {
        RoundedRectangle(cornerRadius: 5)
            .fill(Color.purple)
    }
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.content
            .padding()
            .frame(maxWidth: .infinity)
            .background(Color(red: 216 / 255, green: 238 / 255, blue: 244 / 255))
            .foregroundColor(Color.black)
    }
}


struct CurseView_Previews: PreviewProvider {
    static let modelData = ModelData()
    
    static var previews: some View {
        CurseView(faq: modelData.faqData[0])
            .environmentObject(modelData)
    }
}
