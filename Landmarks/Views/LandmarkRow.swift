//
//  LandmarkRow.swift
//  Landmarks
//
//  Created by 김민창 on 2022/04/02.
//

import SwiftUI

struct LandmarkRow: View {
    var landmark: Landmark
    
    var body: some View {
        HStack {
            landmark.image
                .resizable()
                .frame(width: 50, height: 50)
            Text(landmark.name)
            
            Spacer()
            
            if landmark.isFavorite {
                Image(systemName: "star.fill")
                    .foregroundColor(.yellow)
            }
        }/*.background(.green)*/
    }
}

struct LandmarkRow_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            LandmarkRow(landmark: landmarks[2])
            LandmarkRow(landmark: landmarks[3])
        }
        .previewLayout(.fixed(width: 300, height: 70))
    }
}
