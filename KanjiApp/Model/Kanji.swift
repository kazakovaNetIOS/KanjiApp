//
//  Kanji.swift
//  KanjiApp
//
//  Created by Natalia Kazakova on 30/08/2019.
//  Copyright © 2019 Natalia Kazakova. All rights reserved.
//

import Foundation

struct WordExample: Codable {
    let word: String
    let meaning: String
}

struct Kanji: Codable {
    let character: String
    let meaning: String
    let examples: [WordExample]
}
