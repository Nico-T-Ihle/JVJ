//
//  ContentView.swift
//  JVJ
//
//  Created by Nico Ihle on 27.11.22.
//

import SwiftUI
import RealityKit

struct ContentView : View {
    
    var body: some View {
        ListView()
    }
}

#if DEBUG
struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(ModelData())
    }
}
#endif
