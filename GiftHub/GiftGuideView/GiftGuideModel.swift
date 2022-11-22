//
//  GiftGuideModel.swift
//  GiftHub
//
//  Created by TinkerTanker on 22/11/22.

import Foundation

//struct Gift
struct GGGift: Identifiable {
    var id : Int
    var title: String
    var imageName: String
}

var GGgifts = [GGGift(id: 0, title: "Air Force 1s", imageName: "1"),
               GGGift(id: 1, title: "LED lights", imageName: "2"),
               GGGift(id: 2, title: "Power Bank", imageName: "3"),
               GGGift(id: 3, title: "Phone Case", imageName: "4"),
               GGGift(id: 4, title: "Soft Toy", imageName: "5"),
               GGGift(id: 5, title: "Film Camera", imageName: "6"),
               GGGift(id: 6, title: "GiftCards", imageName: "7"),
               GGGift(id: 7, title: "KeyBoard", imageName: "8"),
               GGGift(id: 8, title: "Headphones", imageName: "9"),
]
