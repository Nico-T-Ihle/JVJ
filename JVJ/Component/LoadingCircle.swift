import ARKit
import RealityKit
import SwiftUI

struct ARViewContainerx: UIViewRepresentable {
    
    func makeUIView(context: Context) -> ARView {
        
        let arView = ARView(frame: .zero)
        arView.addCoaching()
        
        let config = ARWorldTrackingConfiguration()
        config.planeDetection = .horizontal
        arView.session.run(config, options: [])
        
        return arView
    }
    func updateUIView(_ uiView: ARView, context: Context) {}
}

/*
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

*/
struct ContentViewx: View {
    var body: some View {
        ARViewContainerx()
    }
}

struct ContentViewx_Previews: PreviewProvider {
    static var previews: some View {
        ContentViewx()
    }
}

