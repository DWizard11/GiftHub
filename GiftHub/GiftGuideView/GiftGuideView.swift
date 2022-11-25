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
                    NavigationLink("Gifts for Teens") {
                        GiftGuideOneView()
                    }
                    NavigationLink("Gifts for Plant Lovers") {
                        GiftGuideTwoView()
                    }
                }
                Section("Where to find gifts") {
                    NavigationLink("Places in Singapore") {
                        
                    }
                    NavigationLink("Online Websites") {
                        
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
