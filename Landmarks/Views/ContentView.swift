//
//  ContentView.swift
//  Landmarks
//
//  Created by 김민창 on 2022/03/20.
//

import SwiftUI

// The first structure conforms to the View protocol and describes the view’s content and layout.
struct ContentView: View {
    var body: some View {
        LandmarkList()
    }
}

// The second structure declares a preview for that view.
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
