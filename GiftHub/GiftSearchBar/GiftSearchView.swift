//
//  GiftSearchView.swift
//  GiftHub
//
//  Created by DWizard11 on 31/10/22.
//

import SwiftUI

struct GiftSearchView: View {
    
    @State var searchText = ""
    @State var isAlertShown = false
    @AppStorage("shown") var alertShownOnce: Bool = false 
   
    var body: some View {
        NavigationView {
            List {
                ForEach(giftIdeasDict.sorted(by: <), id: \.key){ key, value in
                        Link(destination: URL(string: value)!,label: {
                            HStack {
                                Text(key.capitalized)
                                Spacer()
                                Image(systemName: "figure.walk")
                                    .foregroundColor(Color.blue)
                            }
                        })
                    }
                }
            .searchable(text: $searchText)
            .navigationTitle("Gift Search")
        }
        .onAppear{
            if !alertShownOnce {
                isAlertShown = true
            }
        }
        .alert(isPresented: $isAlertShown) {
                    Alert(
                        title: Text("Disclaimer: "),
                        message: Text("Pressing these links will take you out of the app and into the Amazon Webpage."),
                        dismissButton: .cancel(Text("I understand"), action: {
                            isAlertShown = false
                            alertShownOnce = true
                        })
                    )
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
