//
//  ApplicationCoordinator.swift
//  KanjiApp
//
//  Created by Natalia Kazakova on 30/08/2019.
//  Copyright © 2019 Natalia Kazakova. All rights reserved.
//

import UIKit

class ApplicationCoordinator {

    let kanjiStorage: KanjiStorage
    let window: UIWindow
    let rootViewController: UINavigationController
    
    let allKanjiListCoordinator: AllKanjiListCoordinator
    
    init(window: UIWindow) {
        self.window = window
        kanjiStorage = KanjiStorage()
        rootViewController = UINavigationController()
        rootViewController.navigationBar.prefersLargeTitles = true
        
        allKanjiListCoordinator = AllKanjiListCoordinator(presenter: rootViewController,
                                                          kanjiStorage: kanjiStorage)
    }
}

//MARK: - ApplicationCoordinator
/***************************************************************/

extension ApplicationCoordinator: Coordinator {
    func start() {
        window.rootViewController = rootViewController
        allKanjiListCoordinator.start()
        window.makeKeyAndVisible()
    }
}
