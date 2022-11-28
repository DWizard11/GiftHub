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

var GGgiftsone = [GGGift(id: 0, title: "Air Force 1s", imageName: "1"),
               GGGift(id: 1, title: "LED lights", imageName: "2"),
               GGGift(id: 2, title: "Power Bank", imageName: "3"),
               GGGift(id: 3, title: "Phone Case", imageName: "4"),
               GGGift(id: 4, title: "Soft Toy", imageName: "5"),
               GGGift(id: 5, title: "Film Camera", imageName: "6"),
               GGGift(id: 6, title: "GiftCards", imageName: "7"),
               GGGift(id: 7, title: "KeyBoard", imageName: "8"),
               GGGift(id: 8, title: "Headphones", imageName: "9"),
               GGGift(id: 9, title: "Earpiece", imageName: "10"),
               GGGift(id: 10, title: "Portable Charger", imageName: "11"),
               GGGift(id: 11, title: "3D Printing Pen", imageName: "12"),
                GGGift(id: 12, title: "Reversible Plush Toys", imageName: "13"),
                GGGift(id: 13, title: "Bluetooth Speakers", imageName: "14"),
                GGGift(id: 14, title: "Scrunchies", imageName: "15"),
                GGGift(id: 15, title: "Mini Air Hockey Table", imageName: "16"),
                GGGift(id: 16, title: "Succulents", imageName: "17"),
                GGGift(id: 17, title: "Color Changing Cinema Lightbox", imageName: "18"),
                GGGift(id: 18, title: "Netflix Subscriptions", imageName: "19"),
                  GGGift(id: 19, title: "Puzzles(^^Katamino Game)", imageName: "20"),
                GGGift(id: 20, title: "Stationery", imageName: "21"),
                GGGift(id: 21, title: "Water Bottle", imageName: "22"),
]

var GGgiftstwo = [GGGift(id: 0, title: "Spider Plant", imageName: "23"),
                  GGGift(id: 1, title: "Pilea Plant", imageName: "24"),
                  GGGift(id: 2, title: "Jade Plant", imageName: "25"),
                  GGGift(id: 3, title: "Snake Plant", imageName: "26"),
                  GGGift(id: 4, title: "ZZ Plant", imageName: "27"),
                  GGGift(id: 5, title: "Philodendron Plant", imageName: "28"),
                  GGGift(id: 6, title: "Red Prayer Plant", imageName: "29"),
                  GGGift(id: 7, title: "Variegated Monstera Plant", imageName: "30"),
                  GGGift(id: 8, title: "Monstera Plant", imageName: "31"),
                  GGGift(id: 9, title: "Succulents", imageName: "32"),
                  GGGift(id: 10, title: "Fake Plants", imageName: "33"),
                  GGGift(id: 11, title: "Rope Plant", imageName: "34"),
]

var GGgiftsthree = [GGGift(id: 0, title: "hooga book light", imageName: "35"),
                    GGGift(id: 1, title: "hay matin table lamp", imageName: "36"),
                    GGGift(id: 2, title: "lumio book lamp", imageName: "37"),
                    GGGift(id: 3, title: "kindle", imageName: "38"),
                    GGGift(id: 4, title: "ideal bookshelt custom prints", imageName: "39"),
                    GGGift(id: 5, title: "himimi store bamboo laptop desk", imageName: "40"),
                    GGGift(id: 6, title: "frostbeard studio old books candle", imageName: "41"),
                    GGGift(id: 7, title: "wall shelves", imageName: "42"),
                    GGGift(id: 8, title: "colwood craft nightstand book hold", imageName: "43"),
                    GGGift(id: 9, title: "line markers", imageName: "44"),
                    GGGift(id: 10, title: "the hunger games", imageName: "45"),
                    GGGift(id: 11, title: "one of us is lying series", imageName: "46"),
                    GGGift(id: 12, title: "colleen hoover books", imageName: "47"),
                    GGGift(id: 13, title: "harry potter series", imageName: "48"),
                    GGGift(id: 14, title: "the chronicles of narnia", imageName: "49"),
                    GGGift(id: 15, title: "divergent trilogy", imageName: "50"),
                    GGGift(id: 16, title: "percy jackson and the olympians", imageName: "51"),
                    GGGift(id: 17, title: "twilight series", imageName: "52"),
                    GGGift(id: 18, title: "to all the boys ive loved before by jenny han", imageName: "53"),
                    GGGift(id: 19, title: "crazy rich asians series", imageName: "54"),
]

var GGgiftsfour = [GGGift(id: 0, title: "Retro Console", imageName: "55"),
                   GGGift(id: 1, title: "Handheld Gaming Console", imageName: "56"),
                   GGGift(id: 2, title: "Gift Cards", imageName: "57"),
                   GGGift(id: 3, title: "Gaming Mouse and Keyboard", imageName: "58"),
                   GGGift(id: 4, title: "Gaming Controller", imageName: "59"),
                   GGGift(id: 5, title: "headset", imageName: "60"),
                   GGGift(id: 6, title: "blue yet usb microphone", imageName: "61"),
                   GGGift(id: 7, title: "headphone holders", imageName: "62"),
]

var GGgiftsfive = [GGGift(id: 0, title: "magnetic gel pen set", imageName: "63"),
                   GGGift(id: 1, title: "paper cutter (those fancy ones)", imageName: "64"),
                   GGGift(id: 2, title: "punch holder", imageName: "65"),
                   GGGift(id: 3, title: "mildliners", imageName: "66"),
                   GGGift(id: 4, title: "gel pens", imageName: "67"),
                   GGGift(id: 5, title: "washi tape", imageName: "68"),
                   GGGift(id: 6, title: "bullet journal", imageName: "69"),
                   GGGift(id: 7, title: "scissors", imageName: "70"),
                   GGGift(id: 8, title: "stabilo 0.38 markers", imageName: "71"),
                   GGGift(id: 9, title: "post it notes", imageName: "72"),
                   GGGift(id: 10, title: "brush pens (tombow dual)", imageName: "73"),
                   GGGift(id: 11, title: "memo pads", imageName: "74"),
                   GGGift(id: 12, title: "glue tape", imageName: "75"),
                   GGGift(id: 13, title: "mini photo printer", imageName: "76"),
                   GGGift(id: 14, title: "clips", imageName: "77"),
                   GGGift(id: 15, title: "fabric markers", imageName: "78"),
                   GGGift(id: 16, title: "stickers", imageName: "79"),
                   GGGift(id: 17, title: "texture papers", imageName: "80"),
]
