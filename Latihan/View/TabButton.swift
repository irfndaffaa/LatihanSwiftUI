//
//  TabButton.swift
//  Latihan
//
//  Created by Irfandio Daffa A on 13/10/20.
//  Copyright © 2020 Irfandio Daffa A. All rights reserved.
//

import SwiftUI

@available(iOS 14.0, *)

struct TabButton: View {
    var title: String
    @Binding var selectedTab: String
    var animation: Namespace.ID
    
    var body: some View {
        Button(action: {
            
            withAnimation(.spring()){selectedTab = title}
            
        }, label: {
            VStack(alignment: .leading, spacing: 6, content: {
                Text(title).fontWeight(.heavy).foregroundColor(selectedTab == title ? .black:.gray)
                
                if selectedTab == title{
                    Capsule()
                        .fill(Color.black)
                        .frame(width: 40, height: 4)
                    .matchedGeometryEffect(id: "Tab", in: animation)                }
            }).frame(width: 100)
        })
    }
}

//struct TabButton_Previews: PreviewProvider {
//    static var previews: some View {
//        TabButton()
//    }
//}

//struct TabButton_Previews: PreviewProvider {
//    static var previews: some View {
//        /*@START_MENU_TOKEN@*/Text("Hello, World!")/*@END_MENU_TOKEN@*/
//    }
//}
