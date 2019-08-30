//
//  AllKanjiListCoordinator.swift
//  KanjiApp
//
//  Created by Natalia Kazakova on 30/08/2019.
//  Copyright © 2019 Natalia Kazakova. All rights reserved.
//

import UIKit

class AllKanjiListCoordinator {
    
    private let presenter: UINavigationController
    private let allKanjiList: [Kanji]
    private var kanjiListViewController: KanjiListViewController?
    private let kanjiStorage: KanjiStorage
    private var kanjiDetailCoordinator: KanjiDetailCoordinator?
    
    init(presenter: UINavigationController,
         kanjiStorage: KanjiStorage) {
        self.presenter = presenter
        self.kanjiStorage = kanjiStorage
        allKanjiList = kanjiStorage.allKanji()
    }
}

//MARK: - Coordinator
/***************************************************************/

extension AllKanjiListCoordinator: Coordinator {
    func start() {
        let kanjiListViewController = KanjiListViewController.instantiateViewController()
        kanjiListViewController.delegate = self
        kanjiListViewController.title = "Kanji list"
        kanjiListViewController.kanjiList = allKanjiList
        presenter.pushViewController(kanjiListViewController, animated: true)
        
        self.kanjiListViewController = kanjiListViewController
    }
}

//MARK: - KanjiListViewControllerDelegate
/***************************************************************/

extension AllKanjiListCoordinator: KanjiListViewControllerDelegate {
    func kanjiListViewControllerDidSelectKanji(_ selectedKanji: Kanji) {
        let kanjiDetailCoordinator = KanjiDetailCoordinator(presenter: presenter,
                                                            kanji: selectedKanji,
                                                            kanjiStorage: kanjiStorage)
        kanjiDetailCoordinator.start()
        
        self.kanjiDetailCoordinator = kanjiDetailCoordinator
    }
}
