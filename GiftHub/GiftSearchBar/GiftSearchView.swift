//
//  GiftSearchView.swift
//  GiftHub
//
//  Created by DWizard11 on 31/10/22.
//

import SwiftUI

struct GiftSearchView: View {
    
    @State var searchText = ""
   
    var body: some View {
        NavigationView {
            List {
                ForEach(0..<gifts.count, id: \.self){
                    gift in
                        Link(destination: URL(string: giftwebsites[gift])!,label: {
                            HStack {
                                Text(gifts[gift].capitalized)
                                Spacer()
                                Image(systemName: "figure.walk")
                                    .foregroundColor(Color.blue)
                            }
                            //.padding()
                        })
                    }
                }
            .searchable(text: $searchText)
            .navigationTitle("Gift Search")
        }
    }
    
    var gifts: [String] {
        let lcGifts = giftideas.map { $0.lowercased() }
        
        return searchText == "" ? lcGifts : lcGifts.filter {
            $0.contains(searchText.lowercased())
        }
    }
}


struct GiftSearchView_Previews: PreviewProvider {
    static var previews: some View {
        GiftSearchView()
    }
}

// reference
//https://www.amazon.sg/s/ref=nb_sb_noss_2?url=search-alias%3D(/searchquery)&field-keywords=&crid=3BOYON3KJVMTJ
