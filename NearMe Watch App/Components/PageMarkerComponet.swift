//
//  PageMarkerComponet.swift
//  NearMe Watch App
//
//  Created by Andrew Oroh on 22/05/24.
//

import SwiftUI

struct PageMarkerComponent: View {
    var displayMode : String
    
    var body: some View {
        if displayMode == "Friends"{
            HStack (alignment : .center, spacing: 5){
                Circle()
                    .frame(width: 7)
                Circle()
                    .frame(width: 5)
                    .opacity(0.5)
                
            }
        }
        else {
            HStack (alignment : .center, spacing: 5){
                Circle()
                    .frame(width: 5)
                    .opacity(0.5)

                Circle()
                    .frame(width: 7)
            }
        }
    }
}

#Preview {
    PageMarkerComponent(displayMode: "Stranger")
}
