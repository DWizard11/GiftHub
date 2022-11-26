//
//  GiftGuideTwoView.swift
//  GiftHub
//
//  Created by TinkerTanker on 25/11/22.
//

import SwiftUI

struct GiftGuideTwoView: View {
    var body: some View {
        ScrollView {
            
            HStack {
                Text("Gift Ideas for Plant Lovers")
                    .font(.largeTitle)
                    .multilineTextAlignment(.leading)
                    .bold()
          //      .padding(.top)
            }
            GiftGuideTwoScrollViewd()
        }
    }
}

struct GiftGuideTwoView_Previews: PreviewProvider {
    static var previews: some View {
        GiftGuideTwoView()
    }
}
