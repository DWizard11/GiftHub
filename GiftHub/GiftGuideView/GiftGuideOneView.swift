//
//  GiftGuideOneView.swift
//  GiftHub
//
//  Created by TinkerTanker on 22/11/22.
//

import SwiftUI

struct GiftGuideOneView: View {
    var body: some View {
            ScrollView {
               
                HStack {
                    Text("All Gift Ideas")
                        .font(.largeTitle)
                        .multilineTextAlignment(.leading)
                        .bold()
                    .padding(.top)
                }
                GiftGuideOneScrollView()
            }
    }
}

struct GiftGuideOneView_Previews: PreviewProvider {
    static var previews: some View {
        GiftGuideOneView()
    }
}
