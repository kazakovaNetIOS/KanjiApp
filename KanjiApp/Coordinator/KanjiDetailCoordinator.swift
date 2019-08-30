//
//  KanjiDetailCoordinator.swift
//  KanjiApp
//
//  Created by Natalia Kazakova on 30/08/2019.
//  Copyright © 2019 Natalia Kazakova. All rights reserved.
//

import UIKit

class KanjiDetailCoordinator {
    
    private let presenter: UINavigationController
    private var kanjiDetailViewController: KanjiDetailViewController?
    private var wordKanjiListViewController: KanjiListViewController?
    private let kanjiStorage: KanjiStorage
    private let kanji: Kanji
    
    init(presenter: UINavigationController,
         kanji: Kanji,
         kanjiStorage: KanjiStorage) {
        self.kanji = kanji
        self.presenter = presenter
        self.kanjiStorage = kanjiStorage
    }
}

//MARK: - Coordinator
/***************************************************************/

extension KanjiDetailCoordinator: Coordinator {
    func start() {
        let kanjiDetailViewController = KanjiDetailViewController(nibName: nil, bundle: nil)
        kanjiDetailViewController.delegate = self
        kanjiDetailViewController.title = "Kanji details"
        kanjiDetailViewController.selectedKanji = kanji
        
        presenter.pushViewController(kanjiDetailViewController, animated: true)
        self.kanjiDetailViewController = kanjiDetailViewController
    }
}

//MARK: - KanjiDetailViewControllerDelegate
/***************************************************************/

extension KanjiDetailCoordinator: KanjiDetailViewControllerDelegate {
    func kanjiDetailViewControllerDidSelectWord(_ word: String) {
        let wordKanjiListViewController = KanjiListViewController(nibName: nil, bundle: nil)
        wordKanjiListViewController.cellAccessoryType = .none
        let kanjiForWord = kanjiStorage.kanjiForWord(word)
        wordKanjiListViewController.kanjiList = kanjiForWord
        wordKanjiListViewController.title = word
        
        presenter.pushViewController(wordKanjiListViewController, animated: true)
    }
}
