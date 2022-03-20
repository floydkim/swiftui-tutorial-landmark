//
//  LandmarksApp.swift
//  Landmarks
//
//  Created by 김민창 on 2022/03/20.
//

import SwiftUI

@main // The @main attribute identifies the app’s entry point.
struct LandmarksApp: App { // An app that uses the SwiftUI app life cycle has a structure that conforms to the App protocol.
    // The structure’s body property returns one or more scenes.
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
