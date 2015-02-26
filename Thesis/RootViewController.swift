//
//  RootViewController.swift
//  Thesis
//
//  Created by Maxwell Barvian on 1/25/15.
//  Copyright (c) 2015 Maxwell Barvian. All rights reserved.
//

import UIKit
import SDCloudUserDefaults

public let RootViewControllerLearnTabIndex = 0, RootViewControllerRelaxTabIndex = 1, RootViewControllerReflectTabIndex = 2

class RootViewController: UITabBarController {
	
	private(set) lazy var learnController: LearnViewController = {
		let learnController = LearnViewController()
		
		return learnController
	}()
	
	private(set) lazy var relaxController: RelaxViewController = {
		let relaxController = RelaxViewController()
		
		return relaxController
	}()
	
	private(set) lazy var reflectController: ReflectViewController = {
		let reflectController = ReflectViewController()
		
		return reflectController
	}()
	
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
		
		var viewControllers = [UIViewController]()
		viewControllers.insert(UINavigationController(rootViewController: learnController), atIndex: RootViewControllerLearnTabIndex)
		viewControllers.insert(relaxController, atIndex: RootViewControllerRelaxTabIndex)
		viewControllers.insert(reflectController, atIndex: RootViewControllerReflectTabIndex)
		self.viewControllers = viewControllers
        selectedIndex = RootViewControllerRelaxTabIndex
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        if !SDCloudUserDefaults.hasSeenWelcome {
            let welcomeController = OnboardingViewController()
            presentViewController(welcomeController, animated: true, completion: {
                SDCloudUserDefaults.hasSeenWelcome = true
            })
        }
    }
    
    // MARK: Constraints
    
    private var _didSetupConstraints = false
    
    override func updateViewConstraints() {
        if !_didSetupConstraints {
            _didSetupConstraints = true
        }
        
        super.updateViewConstraints()
    }
    
}

