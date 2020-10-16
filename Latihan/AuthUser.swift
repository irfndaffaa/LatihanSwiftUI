//
//  AuthUser.swift
//  Latihan
//
//  Created by Irfandio Daffa A on 12/10/20.
//  Copyright © 2020 Irfandio Daffa A. All rights reserved.
//

import Foundation

class AuthUser: ObservableObject{
    @Published var isLoggedIn: Bool = false
    @Published var isCorrect: Bool = true
    //@Published var isEmpty: Bool = false
}
