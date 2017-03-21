//
//  AuthService.swift
//  MySnapChat
//
//  Created by Zhiyuan Cui on 3/21/17.
//  Copyright © 2017 Zhiyuan Cui. All rights reserved.
//

import Foundation
import FirebaseAuth

typealias Completion = (_ errMsg: String?, _ data: AnyObject?) -> Void


class AuthService{
    
    private static let _instance = AuthService()
    
    static var instance: AuthService{
        return _instance
    }
    
    func login(email: String, password: String, onComplete: @escaping Completion){
        FIRAuth.auth()?.signIn(withEmail: email, password: password, completion: { (user, error) in
            
            if error != nil{
                if let errorCode = FIRAuthErrorCode(rawValue: (error?._code)!){
                    if errorCode == .errorCodeUserNotFound{
                        FIRAuth.auth()?.createUser(withEmail: email, password: password, completion: {(user,error) in
                            if error != nil{
                                self.handleFirebaseError(error: error as! NSError, onComplete: onComplete)
                            } else{
                                if user?.uid != nil{
                                    //Sign in
                                    
                                    DBService.instance.saveUser(uid: (user?.uid)!)
                                    
                                    FIRAuth.auth()?.signIn(withEmail: email, password: password, completion: {(user, error) in
                                        if error != nil{
                                           self.handleFirebaseError(error: error as! NSError, onComplete: onComplete)
                                        }else{
                                            onComplete(nil, user)
                                        }
                                        
                                    })
                                }
                            }
                        })
                    }
                } else {
                    //Handle all other errors
                    self.handleFirebaseError(error: error as! NSError, onComplete: onComplete)
                }
            }else{
                //Successfully login
                onComplete(nil,user)
            }
        
        })
    }
    
    func handleFirebaseError(error: NSError, onComplete: Completion?){
        print( error.debugDescription )
        
        if let errorCode = FIRAuthErrorCode( rawValue: error.code){
            switch (errorCode){
            case .errorCodeInvalidEmail:
                onComplete?( "Invalid email address", nil)
                break
            case . errorCodeWrongPassword:
                onComplete?( "Invalid password",nil)
                break
            case .errorCodeEmailAlreadyInUse, .errorCodeAccountExistsWithDifferentCredential:
                onComplete?( "Could not create account. Email already in use.",nil)
                break
            default:
                onComplete?( "There was a problem authenticating. Try again.", nil)
            }
        }
    }

}
