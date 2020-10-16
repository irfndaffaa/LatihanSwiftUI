//
//  PhoneView.swift
//  Latihan
//
//  Created by Irfandio Daffa on 14/10/20.
//  Copyright © 2020 Irfandio Daffa A. All rights reserved.
//

import SwiftUI
@available(iOS 14.0, *)

struct PhoneView: View {
    
    var phoneData: IPhone
    var animation: Namespace.ID
    
    var body: some View {
        VStack(alignment: .leading, spacing: 6){
            ZStack{
                Color(phoneData.image)
                    .cornerRadius(15)
                    .shadow(color: Color.black.opacity(0.2), radius: 2, x: 3, y: 5)
                
                Image(phoneData.image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .padding(20)
                    .matchedGeometryEffect(id: phoneData.image, in: animation)
            }
            
            Text(phoneData.title)
                .fontWeight(.heavy)
                .foregroundColor(.gray)
            
            Text(phoneData.price)
                .fontWeight(.heavy)
                .foregroundColor(.black)
        }
    }
}
