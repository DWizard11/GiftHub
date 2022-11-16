//
//  GiftSearchView.swift
//  GiftHub
//
//  Created by DWizard11 on 31/10/22.
//

import SwiftUI

struct GiftSearchView: View {
    
    private var listOfGiftIdeas = giftideas
    @State var searchText = ""
   
   
    var body: some View {
        NavigationView {
            List {
                Button(role: .none){
                    ForEach(gifts, id: \.self){
                        gift in
                        Link(destination: URL(string: "https://www.amazon.sg/s/ref=nb_sb_noss_2?url=search-alias%3D(/gifts)&field-keywords=&crid=3BOYON3KJVMTJ)")!)
                    }
                } label: {
                    ForEach(gifts, id: \.self) {
                        gift in
                        HStack {
                            Text(gift.capitalized)
                            Spacer()
                            Image(systemName: "figure.walk")
                                .foregroundColor(Color.blue)
                        }
                        .padding()
                    }
                }
                
                
            }
            .searchable(text: $searchText)
            .navigationTitle("Gift Search")
        }
    }
    
    var gifts: [String] {
        let lcGifts = listOfGiftIdeas.map { $0.lowercased() }
        
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

//https://www.amazon.sg/s/ref=nb_sb_noss_2?url=search-alias%3D(/searchquery)&field-keywords=&crid=3BOYON3KJVMTJ
