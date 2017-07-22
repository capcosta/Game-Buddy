//
//  ViewController.swift
//  Game Buddy
//
//  Created by Carlos on 2017-07-21.
//  Copyright © 2017 Carlos da Costa. All rights reserved.
//

import UIKit
import Firebase

class ViewController: UIViewController {
	
	
	
	override func viewDidLoad() {
		super.viewDidLoad()
	}

}

extension UIColor {
	convenience init(r: CGFloat, g: CGFloat, b: CGFloat) {
		self.init(red: r/255, green: g/255, blue: b/255, alpha: 1)
	}
}
