//
//  DBService.swift
//  MySnapChat
//
//  Created by Zhiyuan Cui on 3/21/17.
//  Copyright © 2017 Zhiyuan Cui. All rights reserved.
//

import Foundation
import FirebaseDatabase

class DBService{

    private static let _instance = DBService()
    
    static var instance: DBService{
        return _instance
    }

    var mainRef: FIRDatabaseReference{
        return FIRDatabase.database().reference()
    }
    
    func saveUser(uid: String){
        let profile: Dictionary<String, String> = ["firstName":" ", "lastName":" "]
        
        mainRef.child("users").child(uid).child("profile").setValue(profile)
    }
    
}
