//
//  LandmarkList.swift
//  Landmarks
//
//  Created by 김민창 on 2022/04/03.
//

import SwiftUI

struct LandmarkList: View {
    var body: some View {
        NavigationView {
            // Lists work with identifiable data. You can make your data identifiable in one of two ways:
            // by passing along with your data a key path to a property that uniquely identifies each element,
            //   -> (이렇게) List(landmarks, id: \.id) { landmark in ....
            // or by making your data type conform to the Identifiable protocol.
            List(landmarks) { landmark in
                NavigationLink {
                    // destination
                    LandmarkDetail(landmark: landmark)
                } label: {
                    LandmarkRow(landmark: landmark)
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
        LandmarkList()
    }
}
