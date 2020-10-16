//
//  ModelData.swift
//  Latihan
//
//  Created by Irfandio Daffa A on 13/10/20.
//  Copyright © 2020 Irfandio Daffa A. All rights reserved.
//

import SwiftUI


struct IPhone: Identifiable{
    var id = UUID().uuidString
    var image: String
    var title: String
    var price: String
}

var iphone = [
    IPhone(image: "red", title: "IPhone 11 Red", price: "$649"),
    IPhone(image: "black", title: "IPhone 11 Black", price: "$649"),
    IPhone(image: "yellow", title: "IPhone 11 Yellow", price: "$649"),
    IPhone(image: "white", title: "IPhone 11 White", price: "$649"),
    IPhone(image: "green", title: "IPhone 11 Green", price: "$649"),
    IPhone(image: "purple", title: "IPhone 11 Purple", price: "$649")
]

var scroll_tabs = ["Iphone 11", "Ipad", "Macbook", "IMac", "Mac Pro"]


//struct ModelData: View {
//    var body: some View {
//        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
//    }
//}
//
//struct ModelData_Previews: PreviewProvider {
//    static var previews: some View {
//        ModelData()
//    }
//}
