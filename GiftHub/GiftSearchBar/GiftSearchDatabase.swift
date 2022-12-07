//
//  GiftSearchDatabase.swift
//  GiftHub
//
//  Created by T Krobot on 16/11/22.
//

import Foundation

public var giftideas = [
"Automative",
"Baby",
"Beauty & Personal Care",
"Books",
"CDs & Vinyl",
"Fashion",
"Computer & Accessories",
"Electronics",
"Garden & Outdoor",
"Gift Cards",
"Grocery",
"Health, Household & Personal Care",
"Home",
"Industrial & Scientific",
"Kitchen & Dining",
"Luggage & Travel Gear",
"Luxury Beauty",
"Movies & TV",
"Musical Instruments",
"Office Products",
"Pet Supplies",
"Software",
"Sports & Outdoors",
"Home Improvement",
"Toys & Games",
"Video Games"

]

public var giftwebsites = [
"https://www.amazon.sg/s/ref=nb_sb_noss?url=search-alias%3Dautomotive&field-keywords=&crid=100L8YDZ6Z0Z8&sprefix=%2Cautomotive%2C263",
"https://www.amazon.sg/s/ref=nb_sb_noss_2?url=search-alias%3Dbaby&field-keywords=&crid=1P4D08IVKFCE9&sprefix=%2Cbaby%2C244",
"https://www.amazon.sg/s/ref=nb_sb_noss?url=search-alias%3Dbeauty&field-keywords=&crid=2DZMQZ4O8Z82X&sprefix=%2Cbeauty%2C235",
"https://www.amazon.sg/s/ref=nb_sb_noss?url=search-alias%3Dstripbooks&field-keywords=&crid=3KZEHVMK88TJA&sprefix=%2Cstripbooks%2C238",
"https://www.amazon.sg/s/ref=nb_sb_noss?url=search-alias%3Dpopular&field-keywords=&crid=1Q0ZDG4SZ3W4W&sprefix=%2Cpopular%2C236",
"https://www.amazon.sg/s/ref=nb_sb_noss?url=search-alias%3Dfashion&field-keywords=&crid=39RJ2D3A6BO41&sprefix=%2Cfashion%2C457",
"https://www.amazon.sg/s/ref=nb_sb_noss?url=search-alias%3Dcomputers&field-keywords=&crid=3IH63Q2J5OZRH&sprefix=%2Ccomputers%2C792",
"https://www.amazon.sg/s/ref=nb_sb_noss?url=search-alias%3Delectronics&field-keywords=&crid=QBZH0RXZTDK9&sprefix=%2Celectronics%2C236",
"https://www.amazon.sg/s/ref=nb_sb_noss?url=search-alias%3Dlawngarden&field-keywords=&crid=3IP0C8ZNW5H1Y&sprefix=%2Clawngarden%2C245",
"https://www.amazon.sg/s/ref=nb_sb_noss?url=search-alias%3Dgift-cards&field-keywords=&crid=2OJLQ1HCFEPBH&sprefix=%2Cgift-cards%2C252",
"https://www.amazon.sg/s/ref=nb_sb_noss?url=search-alias%3Dgrocery&field-keywords=&crid=1X93948FGX010&sprefix=%2Cgrocery%2C235",
"https://www.amazon.sg/s/ref=nb_sb_noss?url=search-alias%3Dhpc&field-keywords=&crid=2WAPUV9ZUIW9M&sprefix=%2Chpc%2C257",
"https://www.amazon.sg/s/ref=nb_sb_noss?url=search-alias%3Dhome&field-keywords=&crid=1QP3E9HC1T467&sprefix=%2Chome%2C240",
"https://www.amazon.sg/s/ref=nb_sb_noss?url=search-alias%3Dindustrial&field-keywords=&crid=2S65IA2Z85HRJ&sprefix=%2Cindustrial%2C243",
"https://www.amazon.sg/s/ref=nb_sb_noss?url=search-alias%3Dkitchen&field-keywords=&crid=2QDAJ76KL8VSU&sprefix=%2Ckitchen%2C252",
"https://www.amazon.sg/s/ref=nb_sb_noss?url=search-alias%3Dfashion-luggage&field-keywords=&crid=20NN735ISAAHF&sprefix=%2Cfashion-luggage%2C238",
"https://www.amazon.sg/s/ref=nb_sb_noss?url=search-alias%3Dluxury-beauty&field-keywords=&crid=2KGJ9RT6U43JU&sprefix=%2Cluxury-beauty%2C242",
"https://www.amazon.sg/s/ref=nb_sb_noss?url=search-alias%3Dmovies-tv&field-keywords=&crid=DNE1M1OA681E&sprefix=%2Cmovies-tv%2C241",
"https://www.amazon.sg/s/ref=nb_sb_noss?url=search-alias%3Dmi&field-keywords=&crid=1KJ76N0D0SY7G&sprefix=%2Cmi%2C235",
"https://www.amazon.sg/s/ref=nb_sb_noss?url=search-alias%3Doffice-products&field-keywords=&crid=2JXZO2REY1C9T&sprefix=%2Coffice-products%2C237",
"https://www.amazon.sg/s/ref=nb_sb_noss?url=search-alias%3Dpets&field-keywords=&crid=2TKMEO2RQ3MMN&sprefix=%2Cpets%2C257",
"https://www.amazon.sg/s?crid=D16IG6J7A3AB&i=software&k=&ref=nb_sb_noss&sprefix=%2Csoftware%2C240&url=search-alias%3Dsoftware",
"https://www.amazon.sg/s/ref=nb_sb_noss?url=search-alias%3Dsporting&field-keywords=&crid=22QB5PK5IVHSV&sprefix=%2Csporting%2C265",
"https://www.amazon.sg/s/ref=nb_sb_noss?url=search-alias%3Dhome-improvement&field-keywords=&crid=2TJTKZHW9TAYP&sprefix=%2Chome-improvement%2C247",
"https://www.amazon.sg/s/ref=nb_sb_noss?url=search-alias%3Dtoys&field-keywords=&crid=34MOLWI57183R&sprefix=%2Ctoys%2C242",
"https://www.amazon.sg/s/ref=nb_sb_noss?url=search-alias%3Dvideogames&field-keywords=&crid=30ETT6XCZIHHZ&sprefix=%2Cvideogames%2C273"

]

public var giftIdeasDict = [
    "Automative": "https://www.amazon.sg/s/ref=nb_sb_noss?url=search-alias%3Dautomotive&field-keywords=&crid=100L8YDZ6Z0Z8&sprefix=%2Cautomotive%2C263",
    "Baby": "https://www.amazon.sg/s/ref=nb_sb_noss_2?url=search-alias%3Dbaby&field-keywords=&crid=1P4D08IVKFCE9&sprefix=%2Cbaby%2C244",
    "Beauty & Personal Care": "https://www.amazon.sg/s/ref=nb_sb_noss?url=search-alias%3Dbeauty&field-keywords=&crid=2DZMQZ4O8Z82X&sprefix=%2Cbeauty%2C235",
    "Books": "https://www.amazon.sg/s/ref=nb_sb_noss?url=search-alias%3Dstripbooks&field-keywords=&crid=3KZEHVMK88TJA&sprefix=%2Cstripbooks%2C238",
    "CDs & Vinyl": "https://www.amazon.sg/s/ref=nb_sb_noss?url=search-alias%3Dpopular&field-keywords=&crid=1Q0ZDG4SZ3W4W&sprefix=%2Cpopular%2C236",
    "Computer & Accessories": "https://www.amazon.sg/s/ref=nb_sb_noss?url=search-alias%3Dcomputers&field-keywords=&crid=3IH63Q2J5OZRH&sprefix=%2Ccomputers%2C792",
    "Electronics": "https://www.amazon.sg/s/ref=nb_sb_noss?url=search-alias%3Delectronics&field-keywords=&crid=QBZH0RXZTDK9&sprefix=%2Celectronics%2C236",
    "Fashion": "https://www.amazon.sg/s/ref=nb_sb_noss?url=search-alias%3Dfashion&field-keywords=&crid=39RJ2D3A6BO41&sprefix=%2Cfashion%2C457",
    "Garden & Outdoor": "https://www.amazon.sg/s/ref=nb_sb_noss?url=search-alias%3Dlawngarden&field-keywords=&crid=3IP0C8ZNW5H1Y&sprefix=%2Clawngarden%2C245",
    "Gift Cards": "https://www.amazon.sg/s/ref=nb_sb_noss?url=search-alias%3Dgift-cards&field-keywords=&crid=2OJLQ1HCFEPBH&sprefix=%2Cgift-cards%2C252",
    "Grocery": "https://www.amazon.sg/s/ref=nb_sb_noss?url=search-alias%3Dgrocery&field-keywords=&crid=1X93948FGX010&sprefix=%2Cgrocery%2C235",
    "Health, Household & Personal Care": "https://www.amazon.sg/s/ref=nb_sb_noss?url=search-alias%3Dhpc&field-keywords=&crid=2WAPUV9ZUIW9M&sprefix=%2Chpc%2C257",
    "Home": "https://www.amazon.sg/s/ref=nb_sb_noss?url=search-alias%3Dhome&field-keywords=&crid=1QP3E9HC1T467&sprefix=%2Chome%2C240",
    "Home Improvement": "https://www.amazon.sg/s/ref=nb_sb_noss?url=search-alias%3Dhome-improvement&field-keywords=&crid=2TJTKZHW9TAYP&sprefix=%2Chome-improvement%2C247",
    "Industrial & Scientific": "https://www.amazon.sg/s/ref=nb_sb_noss?url=search-alias%3Dindustrial&field-keywords=&crid=2S65IA2Z85HRJ&sprefix=%2Cindustrial%2C243",
    "Kitchen & Dining": "https://www.amazon.sg/s/ref=nb_sb_noss?url=search-alias%3Dkitchen&field-keywords=&crid=2QDAJ76KL8VSU&sprefix=%2Ckitchen%2C252",
    "Luggage & Travel Gear": "https://www.amazon.sg/s/ref=nb_sb_noss?url=search-alias%3Dfashion-luggage&field-keywords=&crid=20NN735ISAAHF&sprefix=%2Cfashion-luggage%2C238",
    "Luxury Beauty": "https://www.amazon.sg/s/ref=nb_sb_noss?url=search-alias%3Dluxury-beauty&field-keywords=&crid=2KGJ9RT6U43JU&sprefix=%2Cluxury-beauty%2C242",
    "Movies & TV": "https://www.amazon.sg/s/ref=nb_sb_noss?url=search-alias%3Dmovies-tv&field-keywords=&crid=DNE1M1OA681E&sprefix=%2Cmovies-tv%2C241",
    "Musical Instruments": "https://www.amazon.sg/s/ref=nb_sb_noss?url=search-alias%3Dmi&field-keywords=&crid=1KJ76N0D0SY7G&sprefix=%2Cmi%2C235",
    "Office Products": "https://www.amazon.sg/s/ref=nb_sb_noss?url=search-alias%3Doffice-products&field-keywords=&crid=2JXZO2REY1C9T&sprefix=%2Coffice-products%2C237",
    "Pet Supplies": "https://www.amazon.sg/s/ref=nb_sb_noss?url=search-alias%3Dpets&field-keywords=&crid=2TKMEO2RQ3MMN&sprefix=%2Cpets%2C257",
    "Software": "https://www.amazon.sg/s?crid=D16IG6J7A3AB&i=software&k=&ref=nb_sb_noss&sprefix=%2Csoftware%2C240&url=search-alias%3Dsoftware",
    "Sports & Outdoors": "https://www.amazon.sg/s/ref=nb_sb_noss?url=search-alias%3Dsporting&field-keywords=&crid=22QB5PK5IVHSV&sprefix=%2Csporting%2C265",
    "Toys & Games": "https://www.amazon.sg/s/ref=nb_sb_noss?url=search-alias%3Dtoys&field-keywords=&crid=34MOLWI57183R&sprefix=%2Ctoys%2C242",
    "Video Games": "https://www.amazon.sg/s/ref=nb_sb_noss?url=search-alias%3Dvideogames&field-keywords=&crid=30ETT6XCZIHHZ&sprefix=%2Cvideogames%2C273"
]
