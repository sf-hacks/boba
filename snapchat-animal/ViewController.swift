//
//  ViewController.swift
//  snapchat-animal
//
//  Created by Christopher Rosana on 3/2/19.
//  Copyright © 2019 sfhacks. All rights reserved.
//

import UIKit
import SCSDKLoginKit

class ViewController: UIViewController {

    //@IBOutlet weak var loginButton: UIButton!
    let loginButton = SCSDKLoginButton()

    @IBAction func loginButtonTapped(_ sender: Any) {
        SCSDKLoginClient.login(from: self, completion: { success, error in
            
            if let error = error {
                print(error.localizedDescription)
                return
            }
            
            if success {
               //self.fetchSnapUserInfo() //example code
            }
        })
    }
    
//    private func fetchSnapUserInfo(){
//        let graphQLQuery = "{me{displayName, bitmoji{avatar}}}"
//        SCSDKLoginClient
//            .fetchUserData(
//                withQuery: graphQLQuery,
//                variables: nil,
//                success: { userInfo in
//                    if let userInfo = userInfo,
//                        let data = try? JSONSerialization.data(withJSONObject: userInfo, options: .prettyPrinted),
//                        let userEntity = try? JSONDecoder().decode(UserEntity.self, from: data) {
//                        DispatchQueue.main.async {
//                            self.goToLoginConfirm(userEntity)
//                        }
//                    }
//            }) { (error, isUserLoggedOut) in
//                print(error?.localizedDescription ?? "")
//        }
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //give rounded button effect
            //loginButton.layer.cornerRadius = loginButton.frame.size.height/3
        // Do any additional setup after loading the view, typically from a nib.
    }


}

