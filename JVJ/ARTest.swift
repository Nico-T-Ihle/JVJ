import ARKit
import RealityKit
import SwiftUI

extension UIColor {
    static func random() -> UIColor {
        return UIColor(displayP3Red: Double.random(in: 0...1), green: Double.random(in: 0...1), blue: Double.random(in: 0...1), alpha: 1.0)
    }
}

public var myGlobal = 1

struct ARTest : View {
    // public var person: Person
    
    @EnvironmentObject var modelData: ModelData
    @State var camera: Bool = false;
    public var faq: FLQM
    
    var body: some View {
        ZStack {
            
            if(camera != false){
                ARViewContainer(faq: faq).edgesIgnoringSafeArea(.all)
            } else {
                OfflineARView()
                    .overlay(
                        RoundedRectangle(cornerRadius: 5)
                            .stroke(.black, lineWidth: 2)
                    )
            }
            VStack{
                Button("Activate AR", action: {
                    self.camera.toggle()
                })
                .padding()
                .foregroundColor(Color.black)
                .background(Color(red: 196 / 255, green: 172 / 255, blue: 244 / 255))
                .opacity(camera ? 0 : 1)
                .overlay(
                    RoundedRectangle(cornerRadius: 5)
                        .stroke(.black, lineWidth: camera ? 0 : 2)
                )
                
                    
            }
            
            ZStack{
                if(camera != false){
                    Button {
                        self.camera.toggle()
                    } label: {
                        Image(systemName: "x.circle")
                            .font(.system(size: 30))
                            .foregroundColor(Color(red: 196 / 255, green: 172 / 255, blue: 244 / 255))
                    }    .frame(
                        maxWidth: .infinity,
                        maxHeight: .infinity,
                        alignment: Alignment.topTrailing
                    )
                } else {
                    
                }
                
            }.padding()
        }
    }
}

class Coordinator: NSObject {
    weak var view: ARView?
    
    @objc func handleTap(_ recognizer: UITapGestureRecognizer){
        guard let view = self.view else { return }
        
        let tapLocation = recognizer.location(in: view)
        
        if let entity = view.entity(at: tapLocation) as? ModelEntity{
            entity.model?.materials = [SimpleMaterial(color: UIColor.random(), isMetallic: true)]
        }
    }
}

struct ARViewContainer: UIViewRepresentable {
    @EnvironmentObject var modelData: ModelData
    /*
     func makeUIView(context: Context) -> ARView {
     
     let arView = ARView(frame: .zero)
     arView.addCoaching()
     
     let config = ARWorldTrackingConfiguration()
     config.planeDetection = .horizontal
     arView.session.run(config, options: [])
     
     return arView
     }
     */
    
    //public var person: Person
    public var faq: FLQM
    
    let randomNumber = 2
    
    func makeUIView(context: Context) -> ARView {
        
        let arView = ARView(frame: .zero)
        arView.addCoaching()
        // let anchor = AnchorEntity(plane: .horizontal)
        
        context.coordinator.view = arView
        //ARview interact
        arView.addGestureRecognizer(UITapGestureRecognizer(target: context.coordinator, action: #selector(Coordinator.handleTap)))
        
        let changeTheAR = faq.key
        
        switch changeTheAR {
        case 0:
            print("You are in chapter 0")
            
        case 1:
            print("You are in chapter 1")
            
            arView.scene.anchors.append(try! Experience.loadBox())
            
        case 2:
            print("You are in chapter 2")
            arView.scene.anchors.append(try! ChapterTow.loadBox())
            
        case 3:
            print("You are in chapter 2")
            arView.scene.anchors.append(try! ChapterThree.loadBox())
            
        default:
            print("Have you no chapter selected")
        }
        
        return arView
    }
    
    func updateUIView(_ uiView: ARView, context: Context) {}
    
    func makeCoordinator() -> Coordinator {
        Coordinator()
    }
}

extension ARView: ARCoachingOverlayViewDelegate {
    func addCoaching() {
        
        let coachingOverlay = ARCoachingOverlayView()
        coachingOverlay.delegate = self
        coachingOverlay.session = self.session
        coachingOverlay.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        coachingOverlay.goal = .anyPlane
        self.addSubview(coachingOverlay)
    }
    
    public func coachingOverlayViewDidDeactivate(_ coachingOverlayView: ARCoachingOverlayView) {
        //Ready to add entities next?
    }
}


#if DEBUG
struct ARTest_Previews : PreviewProvider {
    static let modelData = ModelData()
    
    static var previews: some View {
        //ARTest(person: Person.samplePerson)
        ARTest(faq: modelData.faqData[0])
            .environmentObject(modelData)
    }
}
#endif
