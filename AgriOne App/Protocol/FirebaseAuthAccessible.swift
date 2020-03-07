//
//  FirebaseAuthAccessible.swift
//  AgriOne App
//
//  Created by iOS_Dev_01 on 3/4/20.
//  Copyright © 2020 Yasith Thathsara Senarathne. All rights reserved.
//

import Foundation
import FirebaseAuth

protocol FireAuthAccessible{
    var auth:Auth{get}
    var currentUser:User?{get}
}

extension FireAuthAccessible{
    var auth:Auth{
        return Auth.auth()
    }
    var currentUser:User?{
        return auth.currentUser
    }
    var isUserSignIn:Bool{
        guard currentUser == nil else{return true}
        return false
    }
    
    /*............................
     Mark:- Sign out from firebase
     ..................................*/
    func signOut()throws{
        try auth.signOut()
    }
}
