//
//  Home.swift
//  Latihan
//
//  Created by Irfandio Daffa A on 13/10/20.
//  Copyright © 2020 Irfandio Daffa A. All rights reserved.
//

import SwiftUI
@available(iOS 14.0, *)

struct Home: View {
    
    @State var selectedTab = scroll_tabs[0]
    @Namespace var animation
    @State var show = false
    @State var selectedPhone: IPhone!
    
    var body: some View {
        ZStack{
            VStack(spacing: 0){
                ZStack{
                    HStack(spacing: 15){
                        Button(action: {}, label: {
                            Image(systemName: "line.horizontal.3.decrease")
                                .font(.title)
                                .foregroundColor(.black)
                        })
                        
                        Spacer(minLength: 0)
                        
                        Button(action: {}, label: {
                            Image(systemName: "magnifyingglass")
                                .font(.title)
                                .foregroundColor(.black)
                        })
                        
                        ZStack(alignment: Alignment(horizontal: .trailing, vertical: .top), content: {
                            Button(action: {}, label: {
                                Image(systemName: "cart")
                                    .font(.title)
                                    .foregroundColor(.black)
                            })
                            
                            Circle().fill(Color.red).frame(width: 15, height: 15).offset(x: 5, y: -10)
                        })
                    }
                    
                    Text("Shop").font(.title).fontWeight(.heavy).foregroundColor(Color("mainColor"))
                }
                .padding()
                .padding(.top,UIApplication.shared.windows.first?.safeAreaInsets.top)
                .background(Color.white)
                .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 5)
                
                ScrollView(.vertical, showsIndicators: false, content:{
                    
                    VStack{
                        HStack{
                            Text("Product").font(.title).fontWeight(.heavy).foregroundColor(.black)
                            
                            Spacer()
                        }
                        .padding(.horizontal)
                        .padding(.top)
                        .padding(.bottom,10)
                        
                        ScrollView(.horizontal, showsIndicators: false, content: {
                            HStack(spacing: 15){
                                ForEach(scroll_tabs, id: \.self){tab in
                                    TabButton(title: tab, selectedTab: $selectedTab, animation: animation)
                                    //tap button
                                }
                            }.padding(.horizontal).padding(.top, 5)
                        })
                        
                        LazyVGrid(columns: Array(repeating: GridItem(.flexible(), spacing: 15), count: 2), spacing: 15){
                            
                            ForEach(iphone){phone in
                                PhoneView(phoneData: phone, animation: animation)
                                    .onTapGesture {
                                        withAnimation(.easeIn){
                                            selectedPhone = phone
                                            show.toggle()
                                        }
                                    }
                            }
                        }.padding()
                    }
                    
                })
                
            }
            .background(Color.black.opacity(0.05).ignoresSafeArea(.all,edges: .all))
            
            if selectedPhone != nil && show{
                DetailView(phoneData: $selectedPhone, show: $show, animation: animation)
            }
        }
        .ignoresSafeArea(.all,edges: .top)
    }
}

//struct Home_Previews: PreviewProvider {
//    static var previews: some View {
//        Home()
//    }
//}


