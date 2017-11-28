//
//  Model.swift
//  arkanoidTest
//
//  Created by Владимир Бондарь on 11/25/17.
//  Copyright © 2017 vbbv. All rights reserved.
//

import Foundation

enum levelChoosing: Int{
    case first
    case seconf
    case third
    case fouth
}
class Model {
    static let sharedInstance = Model()
    //variables

    var starsFor0 = 0
    var starsFor1 = 0
    var starsFor2 = 0

    var curr = 0 

}
