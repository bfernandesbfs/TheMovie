//
//  AppCoordinator.swift
//  TMDB
//
//  Created by Bruno Fernandes on 26/02/20.
//  Copyright © 2020 BFS. All rights reserved.
//

import CoordinatorKit
import UIKit

internal final class AppCoordinator: Coordinator {

    internal let rootViewController: UINavigationController

    internal init() {
        rootViewController = UINavigationController()
    }

    // MARK: Public Methods

    internal func initialize() {

        router(NavigationTransition.set([ViewController()], animated: false))
    }

}
