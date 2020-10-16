//
//  ContentView.swift
//  Latihan
//
//  Created by Irfandio Daffa A on 12/10/20.
//  Copyright © 2020 Irfandio Daffa A. All rights reserved.
//

import SwiftUI
@available(iOS 14.0, *)

struct ContentView: View {
    @EnvironmentObject var userAuth: AuthUser
    
    var body: some View {
        if(!userAuth.isLoggedIn){
            return AnyView(Login())
        } else {
            return AnyView(Home().animation(.easeIn(duration: 1.0)))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        if #available(iOS 14.0, *) {
            ContentView()
        } else {
            // Fallback on earlier versions
        }
    }
}


struct Login: View{
    
    @EnvironmentObject var userAuth: AuthUser
    
    @State var username: String = ""
    @State var password: String = ""
    let LightGrayColor = Color(red: 239.0/255.0, green: 243.0/255.0, blue: 244.0/255.0, opacity: 1.0)
    
    func loginCheck(){
        if(username == "dafidof" && password == "123"){
            userAuth.isLoggedIn = true
        } else {
            userAuth.isLoggedIn = false
            userAuth.isCorrect = false
        }
    }
    
    var body: some View{
        ZStack(alignment: .bottom){
//                Color("mainColor")
//                .edgesIgnoringSafeArea(.all)
            
            VStack(alignment: .center){
                HStack{
                    HStack{
                        Image("ecommerce")
                        .resizable()
                        .clipped()
                            .frame(width: 120, height: 120)
                        
                        Text("INDOPEDIA").font(.title).foregroundColor(Color("mainColor")).bold()
                    }.padding(10)
                }.padding(.bottom, 30)
                
                VStack(alignment: .leading){
                    Text("Username")
                    TextField("Username", text: $username)
                        .padding()
                        .background(LightGrayColor)
                        .cornerRadius(5.0)
                        .autocapitalization(.none)
                    
                    Text("Password")
                    SecureField("Password", text: $password)
                        .padding()
                        .background(LightGrayColor)
                        .cornerRadius(5.0)
                        .autocapitalization(.none)
                    
                    //warning
                    if(!userAuth.isCorrect){
                        Text("Username or password is not correct").foregroundColor(.red)
                    }
                    
                    HStack{
                        Spacer()
                        Button(action: {print()}){
                            Text("Forgot password ?").font(.callout).foregroundColor(Color("mainColor"))
                        }
                    }.padding(.top, 10).padding(.bottom,20)
                    
                    HStack{
                    Spacer()
                        Button(action: {self.loginCheck()}){
                        Text("Login").bold().font(.callout).foregroundColor(.white)
                    }
                    Spacer()
                    }.padding().background(Color("mainColor")).cornerRadius(15)
                    
                    HStack{
                        Text("Don't have an account? ").font(.callout).bold()
                        Spacer()
                        Button(action: {print()}){
                            Text("Sign Up").bold().font(.callout).foregroundColor(Color("mainColor"))
                        }
                    }.padding()
                    
                }.padding([.leading, .trailing, .top], 20)
                }.background(Color.white).edgesIgnoringSafeArea(.all)
        }
    }
}
