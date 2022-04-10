//
//  PageViewController.swift
//  Landmarks
//
//  Created by 김민창 on 2022/04/09.
//

import SwiftUI
import UIKit

struct PageViewController<Page: View>: UIViewControllerRepresentable {
    var pages: [Page]
    
    // SwiftUI calls this makeCoordinator() method before makeUIViewController(context:), so that you have access to the coordinator object when configuring your view controller.
    func makeCoordinator() -> Coordinator {
        // You can use this coordinator to implement common Cocoa patterns, such as delegates, data sources, and responding to user events via target-action.
        Coordinator(self)
    }
    
    // SwiftUI calls this method a single time when it’s ready to display the view, and then manages the view controller’s life cycle.
    func makeUIViewController(context: Context) -> UIPageViewController {
        let pageViewController = UIPageViewController(
            transitionStyle: .scroll,
            navigationOrientation: .horizontal)
        pageViewController.dataSource = context.coordinator
        
        return pageViewController
    }
    
    // For now, you create the UIHostingController that hosts the page SwiftUI view on every update. Later, you’ll make this more efficient by initializing the controller only once for the life of the page view controller.
    func updateUIViewController(_ pageViewController: UIPageViewController, context: Context) {
        pageViewController.setViewControllers(
            [context.coordinator.controllers[0]], direction: .forward, animated: true)
    }
    
    // A SwiftUI view that represents a UIKit view controller can define a Coordinator type that SwiftUI manages and provides as part of the representable view’s context.
    // SwiftUI manages your UIViewControllerRepresentable type’s coordinator, and provides it as part of the context when calling the methods you created above.
    class Coordinator: NSObject, UIPageViewControllerDataSource {
        // 이전 페이지
        func pageViewController(
            _ pageViewController: UIPageViewController,
            viewControllerBefore viewController: UIViewController) -> UIViewController?
        {
            guard let index = controllers.firstIndex(of: viewController) else {
                return nil
            }
            if index == 0 {
                return controllers.last
            }
            return controllers[index - 1]
        }
        
        // 다음 페이지
        func pageViewController(
            _ pageViewController: UIPageViewController,
            viewControllerAfter viewController: UIViewController) -> UIViewController?
        {
            guard let index = controllers.firstIndex(of: viewController) else {
                return nil
            }
            if index + 1 == controllers.count {
                return controllers.first
            }
            return controllers[index + 1]
        }
        
        var parent: PageViewController
        // The coordinator is a good place to store these controllers, because the system initializes them only once, and before you need them to update the view controller.
        var controllers = [UIViewController]()
        
        init(_ pageViewController: PageViewController) {
            parent = pageViewController
            controllers = parent.pages.map { UIHostingController(rootView: $0) }
        }
    }
}

