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
                }
                
                Section("For different festivities") {
                    NavigationLink("Christmas") {
                        
                    }
                    NavigationLink("Chinese New Year") {
                        
                    }
                }
                
                Section("Where to find gifts") {
                    NavigationLink("Places in Singapore") {
                        
                    }
                    NavigationLink("Online Websites") {
                        
                    }
                }
            
            
            //List {
            //    ForEach(giftguides, id: \.self){ giftguide in
                 //   Image(systemName: "figure.sit")
                    
             //       Text(giftguide)
               //     Link(destination: URL(string: "https://www.amazon.sg/s/ref=nb_sb_noss_2?url=search-alias%3D(/gift)&field-keywords=&crid=3BOYON3KJVMTJ)")!,label: {
             //           HStack {
             //               Text(giftguides.capitalized)
            //                Spacer()
            //                Image(systemName: "figure.walk")
            //                    .foregroundColor(Color.blue)
            //            }
                        //.padding()
            //        })
            //    }
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
