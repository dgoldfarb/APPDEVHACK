//
//  Song obj.swift
//  DG646_P4
//
//  Created by David Goldfarb on 10/24/22.
//

import Foundation
import UIKit

class GYM{
    var gympic: String
    var gymName: String
  
    
    init(gympic: String, name: String) {
        self.gympic = gympic
        self.gymName = name
       
    }
    
    
}
class Reservation{
    var time: String
    var date: String
    var gym: String
    
    init(time: String, date: String, gym: String) {
        self.time = time
        self.date = date
        self.gym = gym
    }
    
}

class User{
    var email: String
    var password: String
    
    
    init(email: String, password: String) {
        self.email  = email
        self.password = password
        
    }
    
}
