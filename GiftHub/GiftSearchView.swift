//
//  GiftSearchView.swift
//  GiftHub
//
//  Created by DWizard11 on 31/10/22.
//

import SwiftUI

struct GiftSearchView: View {
    
    @State private var giftText = ""
    
    var body: some View {
        NavigationView {
            Text("")
        }
        .searchable(text: $giftText)
        .navigationTitle("Gift Search")
    }
}

struct GiftSearchView_Previews: PreviewProvider {
    static var previews: some View {
        GiftSearchView()
    }
}
