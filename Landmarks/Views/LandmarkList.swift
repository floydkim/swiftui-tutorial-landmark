//
//  LandmarkList.swift
//  Landmarks
//
//  Created by 김민창 on 2022/04/03.
//

import SwiftUI

struct LandmarkList: View {
    // The modelData property gets its value automatically, as long as the environmentObject(_:) modifier has been applied to a parent.
    @EnvironmentObject var modelData: ModelData
    @State private var showFavoritesOnly = false
    
    var filteredLandmarks: [Landmark] {
        if (showFavoritesOnly) {
            return modelData.landmarks.filter { landmark in landmark.isFavorite }
        } else {
            return modelData.landmarks
        }
    }
    
    var body: some View {
        NavigationView {
            // Lists work with identifiable data. You can make your data identifiable in one of two ways:
            // by passing along with your data a key path to a property that uniquely identifies each element,
            //   -> (이렇게) List(landmarks, id: \.id) { landmark in ....
            // or by making your data type conform to the Identifiable protocol.
            List {
                Toggle(isOn: $showFavoritesOnly) {
                    Text("Favorites only")
                }
                
                // To combine static and dynamic views in a list, or to combine two or more different groups of dynamic views,
                // use the ForEach type instead of passing your collection of data to List.
                ForEach(filteredLandmarks) { landmark in
                    NavigationLink {
                        // destination
                        LandmarkDetail(landmark: landmark)
                    } label: {
                        LandmarkRow(landmark: landmark)
                    }
                }
                // (참고) 아래와 같음. 문법 축약 차이
//                NavigationLink(destination: {() in
//                    LandmarkDetail()
//                }, label: {() in
//                    LandmarkRow(landmark: landmark)
//                })
            }
        }
        .navigationTitle("Landmarks")
    }
}

struct LandmarkList_Previews: PreviewProvider {
    static var previews: some View {
        // ForEach operates on collections the same way as the list, which means you can use it anywhere you can use a child view, such as in stacks, lists, groups, and more.
        // When the elements of your data are simple value types — like the strings you’re using here — you can use \.self as key path to the identifier.
        ForEach(["iPhone 13 Pro"/*, "iPhone 8"*/], id: \.self) { deviceName in
            LandmarkList()
                .previewDevice(PreviewDevice(rawValue: deviceName))
                .previewDisplayName(deviceName)
        }
    }
}
