//
//  KanjiDataTableViewCell.swift
//  KanjiApp
//
//  Created by Natalia Kazakova on 30/08/2019.
//  Copyright © 2019 Natalia Kazakova. All rights reserved.
//

import UIKit

class KanjiDataTableViewCell: UITableViewCell {
  
  @IBOutlet weak var characterLabel: UILabel!
  @IBOutlet weak var meaningValueLabel: UILabel!
  
  func setupCell(data: Kanji?) {
    meaningValueLabel?.text = data?.meaning
    characterLabel?.text = data?.character
  }
}
