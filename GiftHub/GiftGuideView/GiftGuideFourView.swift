//
//  GiftGuideFourView.swift
//  GiftHub
//
//  Created by TinkerTanker on 25/11/22.
//

import SwiftUI

struct GiftGuideFourView: View {
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
            GiftGuideFourScrollView()
        }
    }
}

struct GiftGuideFourView_Previews: PreviewProvider {
    static var previews: some View {
        GiftGuideFourView()
    }
}
