//
//  NagivateUsingMapValidationComponent.swift
//  NearMe Watch App
//
//  Created by Andrew Oroh on 25/05/24.
//

import SwiftUI

struct NagivateUsingMapValidationComponent: View {
    @Binding var navigateUsingMap : Bool
    @Binding var showValidationSheet : Bool
    var userItem : MKMapItem
    
    var body: some View {
        VStack{
            Text("Navigate with maps ")
                .font(.subheadline)
            Spacer()
            Button{
                navigateUsingMap = true
                showValidationSheet = false
                userItem.openInMaps()
            }label: {
                Text("Yes")
            }
            .frame(width: 100)
            
            Button{
                navigateUsingMap = false
                showValidationSheet = false
                print("batal access")
            }label: {
                Text("No")
            }
            .frame(width: 100)
        }
    }
}
