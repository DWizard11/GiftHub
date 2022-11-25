//
//  GiftGuideThreeView.swift
//  GiftHub
//
//  Created by TinkerTanker on 25/11/22.
//

import SwiftUI

struct GiftGuideThreeView: View {
    var body: some View {
        ScrollView {
            Spacer()
            Spacer()
            HStack {
                Text("Gift Ideas for Book Lovers")
                    .font(.largeTitle)
                    .multilineTextAlignment(.leading)
                    .bold()
          //      .padding(.top)
            }
            GiftGuideThreeScrollView()
        }
    }
}

struct GiftGuideThreeView_Previews: PreviewProvider {
    static var previews: some View {
        GiftGuideThreeView()
    }
}
