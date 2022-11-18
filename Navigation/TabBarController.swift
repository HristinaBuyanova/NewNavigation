//
//  TabBarController.swift
//  Navigation
//
//  Created by Христина Буянова on 03.11.2022.
//

import UIKit

final class TabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupTabBar()
        private func setupTabBar() {
                let dataSource: [TabBarItem] = [.feed, .profile]
                self.viewControllers = dataSource.map {
                    switch $0 {
                    case .feed:
                        let feedViewController = FeedViewController()
                        return self.wrappedInNavigationController(with: feedViewController, title: $0.title)
                    case .profile:
                        let profileViewController = ProfileViewController()
                        return self.wrappedInNavigationController(with: profileViewController, title: $0.title)
                    }
                }
                self.viewControllers?.enumerated().forEach {
                    $1.tabBarItem.title = dataSource[$0].title
                    $1.tabBarItem.image = UIImage(systemName: dataSource[$0].iconName)
                    $1.tabBarItem.imageInsets = UIEdgeInsets(top: 5, left: .zero, bottom: -5, right: .zero)
                }
            }
        private func wrappedInNavigationController(with: UIViewController, title: Any?) -> UINavigationController {
                return UINavigationController(rootViewController: with)
            }
        wrappedInNavigationController(with: profileViewController, title: $0.title)
        wrappedInNavigationController(with: feedViewController, title: $0.title)
       
    }
    
    private enum TabBarItem: Int {
            case feed
            case profile
        var title: String {
                    switch self {
                    case .feed:
                        return "Лента"
                    case .profile:
                        return "Профиль"
                    }
                }
        var iconName: String {
                    switch self {
                    case .feed:
                        return "house"
                    case .profile:
                        return "person.crop.circle"
                    }
                }
            }

    

}
