//
//  DetailView.swift
//  Latihan
//
//  Created by Irfandio Daffa on 14/10/20.
//  Copyright © 2020 Irfandio Daffa A. All rights reserved.
//

import SwiftUI
@available(iOS 14.0, *)

struct DetailView: View {
    
    @Binding var phoneData: IPhone!
    @Binding var show: Bool
    var animation: Namespace.ID
    @State var selectedColor = Color.red
    @State var count = 0
    
    var body: some View {
        VStack{
            HStack{
                VStack(alignment: .leading, spacing: 5){
                    Button(action: {
                        withAnimation(.easeOut){show.toggle()}
                    }){
                        Image(systemName: "chevron.left")
                            .font(.title)
                            .foregroundColor(.white)
                    }
                }
                
                Spacer(minLength: 0)
                
                Button(action: {}){
                    Image(systemName: "cart")
                        .font(.title)
                        .foregroundColor(.white)
                }
            }
            .padding()
            .padding(.top, UIApplication.shared.windows.first?.safeAreaInsets.top)
            
            HStack{
                Text(phoneData.title)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
            }
            
            HStack(spacing: 10){
                VStack(alignment: .leading, spacing: 6){
                    Text("Price")
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                    
                    Text(phoneData.price)
                        .font(.largeTitle)
                        .fontWeight(.heavy)
                        .foregroundColor(.white)
                }
                Image(phoneData.image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .matchedGeometryEffect(id: phoneData.image, in: animation)
            }
            .padding()
            .padding(.top,10)
            .zIndex(1)
            
//            Spacer(minLength: 0)
            VStack{
                HStack{
                    VStack(alignment: .leading, spacing: 8){
                        Text("Color")
                            .foregroundColor(.gray)
                            .font(.callout)
                            .fontWeight(.bold)

                        HStack(spacing: 5){
                            
//                            Button(action: {}) {
//                                Text("64 GB")
//                                    .fontWeight(.light)
//                                    .foregroundColor(.black)
//                            }
//
//                            Button(action: {}) {
//                                Text("128 GB")
//                                    .fontWeight(.light)
//                                    .foregroundColor(.black)
//                            }
//
//                            Button(action: {}) {
//                                Text("256 GB")
//                                    .fontWeight(.light)
//                                    .foregroundColor(.black)
//                            }
//
//                            Button(action: {}) {
//                                Text("512 GB")
//                                    .fontWeight(.light)
//                                    .foregroundColor(.black)
//                            }
                            
                            ColorButton(color: Color(phoneData.image), selectedColor: $selectedColor)

                            ColorButton(color: Color.yellow, selectedColor: $selectedColor)

                            ColorButton(color: Color.purple, selectedColor: $selectedColor)
                        }
                    }
                    
                    Spacer(minLength: 0)
                    
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Rating")
                            .fontWeight(.semibold)
                            .foregroundColor(.black)
                        
                        Text("4.9")
                            .fontWeight(.heavy)
                            .foregroundColor(.black)
                    }
                }
                .padding(.horizontal)
                .padding(.top, -20)
                
                Text("The new dual camera system captures even more of what you see and love. The fastest chip ever in a smartphone and all-day battery life let you do more without the need for frequent charging. And the best video quality on a smartphone, so your memories look better than ever.")
                    .foregroundColor(.gray)
                    .multilineTextAlignment(.leading)
                    .padding()
                
                HStack(spacing: 20){
                    
                    Button(action: {
                        if(count > 0){count -= 1}
                    }) {
                        Image(systemName: "minus")
                            .font(.title2)
                            .foregroundColor(.gray)
                            .frame(width: 35, height: 35)
                            .background(RoundedRectangle(cornerRadius: 10).stroke(Color.gray, lineWidth: 1))
                    }
                    
                    Text("\(count)")
                        .font(.title2)
                    
                    Button(action: {count += 1}) {
                        Image(systemName: "plus")
                            .foregroundColor(.gray)
                            .frame(width: 35, height: 35)
                            .background(RoundedRectangle(cornerRadius: 10).stroke(Color.gray, lineWidth: 1))
                    }
                    
                    Spacer()
                    
                    Button(action: {}) {
                        Image(systemName: "suit.heart.fill")
                            .foregroundColor(.white)
                            .padding(10)
                            .background(Color.red)
                            .clipShape(Circle())
                    }
                    
                }
                .padding(.horizontal)
                
                Spacer(minLength: 0)
                
                Button(action: {}) {
                    Text("BUY")
                        .font(.title2)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding(.vertical)
                        .frame(width: UIScreen.main.bounds.width - 30)
                        .background(Color(phoneData.image))
                        .clipShape(Capsule())
                }
                .padding(.top)
                .padding(.bottom, UIApplication.shared.windows.first?.safeAreaInsets.bottom == 0 ? 15 : 0)
            }
            .background(
                Color.white
                    .clipShape(CustomCorner())
                    .padding(.top, -100)
            )
            .zIndex(0)
        }
        .background(Color(phoneData.image).ignoresSafeArea(.all, edges: .top))
        .background(Color.white.ignoresSafeArea(.all, edges: .bottom))
        .onAppear{
            selectedColor = Color(phoneData.image)
        }
    }
}
