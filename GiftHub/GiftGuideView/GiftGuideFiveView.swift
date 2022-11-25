//
//  GiftGuideFiveView.swift
//  GiftHub
//
//  Created by TinkerTanker on 25/11/22.
//

import SwiftUI

struct GiftGuideFiveView: View {
    var body: some View {
        ScrollView {
            Spacer()
            Spacer()
            HStack {
                Text("Gift Ideas for Gamers")
                    .font(.largeTitle)
                    .multilineTextAlignment(.leading)
                    .bold()
          //      .padding(.top)
            }
            GiftGuideFiveScrollView()
        }
    }
}

struct GiftGuideFiveView_Previews: PreviewProvider {
    static var previews: some View {
        GiftGuideFiveView()
    }
}
