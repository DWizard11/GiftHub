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
            ScrollView{
                Spacer()
                Spacer()
                HStack {
                    NavigationLink(destination: GiftGuideOneView()) {
                        VStack {
                            Image("AllGiftIdeas")
                         //       .frame(width: 100, height: 100, alignment: .center)
                                .resizable()
                                .scaledToFit()
                            Text("All Gift Ideas")
                         //       .frame(width: 100, height: 100, alignment: .center)
                                .font(.title)
                                .bold()
                                .foregroundColor(.black)
                        }
                        .padding()
                        .frame(width: 170, height: 300, alignment: .center)
                        .overlay (
                            RoundedRectangle(cornerRadius: 8)
                                .stroke(Color(white: 0.6), lineWidth: 2)
                            )
                    }
                    NavigationLink(destination: GiftGuideFourView()) {
                        VStack {
                            Image("ForGamers")
                            //       .frame(width: 100, height: 100, alignment: .center)
                                .resizable()
                                .scaledToFit()
                            Text("Gifts for Gamers")
                            //       .frame(width: 100, height: 100, alignment: .center)
                                .font(.title)
                                .bold()
                                .foregroundColor(.black)
                        }
                        .padding()
                        .frame(width: 170, height: 300, alignment: .center)
                        .overlay (
                            RoundedRectangle(cornerRadius: 8)
                                .stroke(Color(white: 0.6), lineWidth: 2)
                        )
                    }
                }
                HStack {
                    NavigationLink(destination: GiftGuideThreeView()) {
                        VStack {
                            Image("ForBookLovers")
                            //       .frame(width: 100, height: 100, alignment: .center)
                                .resizable()
                                .scaledToFit()
                            Text("Gifts for Book Lovers")
                            //       .frame(width: 100, height: 100, alignment: .center)
                                .font(.title)
                                .bold()
                                .foregroundColor(.black)
                        }
                        .padding()
                        .frame(width: 170, height: 300, alignment: .center)
                        .overlay (
                            RoundedRectangle(cornerRadius: 8)
                                .stroke(Color(white: 0.6), lineWidth: 2)
                        )
                    }
                    NavigationLink(destination: GiftGuideTwoView()) {
                        VStack {
                            Image("ForPlantLovers")
                            //       .frame(width: 100, height: 100, alignment: .center)
                                .resizable()
                                .scaledToFit()
                            Text("Gifts for Plant Lovers")
                            //       .frame(width: 100, height: 100, alignment: .center)
                                .font(.title)
                                .bold()
                                .foregroundColor(.black)
                        }
                        .padding()
                        .frame(width: 170, height: 300, alignment: .center)
                        .overlay (
                            RoundedRectangle(cornerRadius: 8)
                                .stroke(Color(white: 0.6), lineWidth: 2)
                        )
                    }
                }
                HStack {
                    NavigationLink(destination: GiftGuideFiveView()) {
                        VStack {
                            Image("ForStatLovers")
                            //       .frame(width: 100, height: 100, alignment: .center)
                                .resizable()
                                .scaledToFit()
                            Text("Gifts for Stationery Lovers")
                            //       .frame(width: 100, height: 100, alignment: .center)
                                .font(.title)
                                .bold()
                                .foregroundColor(.black)
                        }
                        .padding()
                        .frame(width: 170, height: 300, alignment: .center)
                        .overlay (
                            RoundedRectangle(cornerRadius: 8)
                                .stroke(Color(white: 0.6), lineWidth: 2)
                        )
                    }
                    Text("More to \nCome!")
                        .font(.title)
                        .bold()
                        .padding()
                        .padding()
                        .frame(width: 170, height: 300, alignment: .center)
                        .overlay (
                            RoundedRectangle(cornerRadius: 8)
                                .stroke(Color(white: 0.6), lineWidth: 2)
                )}
            }
            .navigationTitle("Gift Guides")
        }
    }
}
//}

struct GiftGuideView_Previews: PreviewProvider {
    static var previews: some View {
        GiftGuideView()
    }
}
