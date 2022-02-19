//
//  SceneDelegate.swift
//  FontChanger
//
//  Created by Кирилл  Геллерт on 19.02.2022.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else {
            return
        }
        self.window = UIWindow(windowScene: windowScene)
        self.window?.rootViewController = TextFormatterViewController()
        self.window?.makeKeyAndVisible()
    }

}

