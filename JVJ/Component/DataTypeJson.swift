//
//  Test.swift
//  JVJ
//
//  Created by Nico Ihle on 05.02.23.
//

import Foundation

struct FLQM: Codable {
    //INFO: if the JSON is chaning then i have to update this code!    
    let chapter, headline, contentpartone, contentpartonetwo: String
    let contentpartthree, arButton, popover, quizz: String
    var quizzResult: Bool
    let key: Int
    var isFavorite: Bool
    let logo: String
}
