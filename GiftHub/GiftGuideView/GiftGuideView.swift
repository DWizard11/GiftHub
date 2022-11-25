//
//  GiftGuideView.swift
//  GiftHub
//
//  Created by TinkerTanker on 22/11/22.
//

import SwiftUI

struct GiftGuideView: View {

 //   @State var giftguides = ["Gift Idea for Teens"]
    
    var body: some View {
        NavigationView {
            Form {
                Section("For Teens") {
                    NavigationLink("All Gift Ideas") {
                        GiftGuideOneView()
                    }
                    NavigationLink("For Plant Lovers") {
                        GiftGuideTwoView()
                    }
                    NavigationLink("For Book Lovers") {
                        GiftGuideThreeView()
                    }
                    NavigationLink("For Gamers") {
                        GiftGuideFourView()
                    }
                    NavigationLink("For Stationery Lovers") {
                        GiftGuideFiveView()
                    }
                }
            }
            .navigationTitle("Gift Guides")
        }
    }
}

struct GiftGuideView_Previews: PreviewProvider {
    static var previews: some View {
        GiftGuideView()
    }
}
