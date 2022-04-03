//
//  LandmarkList.swift
//  Landmarks
//
//  Created by 김민창 on 2022/04/03.
//

import SwiftUI

struct LandmarkList: View {
    var body: some View {
        // Lists work with identifiable data. You can make your data identifiable in one of two ways:
        // by passing along with your data a key path to a property that uniquely identifies each element,
        //   -> (이렇게) List(landmarks, id: \.id) { landmark in ....
        // or by making your data type conform to the Identifiable protocol.
        List(landmarks) { landmark in
            LandmarkRow(landmark: landmark)
        }
    }
}

struct LandmarkList_Previews: PreviewProvider {
    static var previews: some View {
        LandmarkList()
    }
}
