//
//  WordExampleTableViewCell.swift
//  KanjiApp
//
//  Created by Natalia Kazakova on 30/08/2019.
//  Copyright © 2019 Natalia Kazakova. All rights reserved.
//

import UIKit

class WordExampleTableViewCell: UITableViewCell {
  
  func setupCell(data: WordExample?) {
    textLabel?.text = data?.word
    detailTextLabel?.text = data?.meaning
  }
  
}
