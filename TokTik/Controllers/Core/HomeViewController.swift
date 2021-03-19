//
//  ViewController.swift
//  TokTik
//
//  Created by James Estrada on 3/13/21.
//

import UIKit

class HomeViewController: UIViewController {
    
    private let horizontalScrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.bounces = false
        scrollView.backgroundColor = .red
        scrollView.isPagingEnabled = true
        scrollView.showsHorizontalScrollIndicator = false
        return scrollView
    }() // Anonymous closure pattern
    
    // MARK: Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        view.addSubview(horizontalScrollView)
        // Paging controller
        setUpFeed()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        horizontalScrollView.frame = view.bounds
    }

    private func setUpFeed() {
        horizontalScrollView.contentSize = CGSize(width: view.width * 2, height: view.height)
        // Following Feed and For You Feed paging controllers
        setUpFollowingFeed()
        setUpForYouFeed()
    }
    
    func setUpFollowingFeed() {
        let pagingController = UIPageViewController(transitionStyle: .scroll, navigationOrientation: .vertical, options: [:])
        
        let vc = UIViewController()
        vc.view.backgroundColor = .blue
        
        pagingController.setViewControllers([vc], direction: .forward, animated: false, completion: nil)
        pagingController.dataSource = self
        
        horizontalScrollView.addSubview(pagingController.view)
        pagingController.view.frame = CGRect(x: 0, y: 0, width: horizontalScrollView.width, height: horizontalScrollView.height)
        addChild(pagingController)
        pagingController.didMove(toParent: self)
    }
    
    func setUpForYouFeed() {
        let pagingController = UIPageViewController(transitionStyle: .scroll, navigationOrientation: .vertical, options: [:])
        
        let vc = UIViewController()
        vc.view.backgroundColor = .blue
        
        pagingController.setViewControllers([vc], direction: .forward, animated: false, completion: nil)
        pagingController.dataSource = self
        
        horizontalScrollView.addSubview(pagingController.view)
        pagingController.view.frame = CGRect(x: view.width, y: 0, width: horizontalScrollView.width, height: horizontalScrollView.height)
        addChild(pagingController)
        pagingController.didMove(toParent: self)
    }
}

extension HomeViewController: UIPageViewControllerDataSource {
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        return nil
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        let vc = UIViewController()
        vc.view.backgroundColor = [UIColor.red, UIColor.gray, UIColor.green].randomElement()
        return vc
    }
}

