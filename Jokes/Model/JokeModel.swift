//
//  JokeModel.swift
//  Jokes
//
//  Created by Mark Wike on 06/04/2022.
//

import Foundation
import UIKit

struct JokeInfo: Hashable, Decodable {
    var id: Int
    var category: String
    var type: String
    var setup: String?
    var delivery: String?
    var joke: String?
}

