//
//  ViewController.swift
//  test-autolayout
//
//  Created by Kaz Yoshikawa on 2015/01/31.
//  Copyright (c) 2015年 Electricwoods LLC. All rights reserved.
//

import UIKit



class ViewController: UIViewController {

	enum Layout {
		case LayoutA, LayoutB
	}

	@IBOutlet var a_height: NSLayoutConstraint!
	@IBOutlet var a_bottom: NSLayoutConstraint!
	@IBOutlet var a_left: NSLayoutConstraint!
	@IBOutlet var a_right: NSLayoutConstraint!


	@IBOutlet var b_width: NSLayoutConstraint!
	@IBOutlet var b_top: NSLayoutConstraint!
	@IBOutlet var b_bottom: NSLayoutConstraint!
	@IBOutlet var b_left: NSLayoutConstraint!

	@IBOutlet weak var toolView: UIView!

	var layout: Layout = .LayoutA

	override func viewDidLoad() {
		super.viewDidLoad()

		self.view.layer.borderWidth = 1
		self.view.layer.borderColor = UIColor.redColor().CGColor
		self.toolView.layer.borderWidth = 2
		self.toolView.layer.borderColor = UIColor.blueColor().CGColor

		self.view.removeConstraints(b_constraints)
		self.view.addConstraints(a_constraints)
	}

	override func viewWillLayoutSubviews() {
		super.viewWillLayoutSubviews()
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}

	@IBAction func tap(sender: UITapGestureRecognizer) {
		switch layout {
		case .LayoutA: layout = .LayoutB
		case .LayoutB: layout = .LayoutA
		}
		self.view.setNeedsUpdateConstraints()
		UIView.animateWithDuration(0.3, animations: { () -> Void in
			self.view.layoutIfNeeded()
		}) { (Bool) -> Void in
		}
	}

	override func updateViewConstraints() {
		println("\(__FUNCTION__)")
		super.updateViewConstraints()
		switch layout {
		case .LayoutA:
			self.view.removeConstraints(b_constraints)
			self.view.addConstraints(a_constraints)
		case .LayoutB:
			self.view.removeConstraints(a_constraints)
			self.view.addConstraints(b_constraints)
		}
	}

	var a_constraints : [NSLayoutConstraint] {
		return [a_height, a_bottom, a_left, a_right]
	}

	var b_constraints : [NSLayoutConstraint] {
		return [b_width, b_top, b_bottom, b_left]
	}
}

