//
//  IndicatorView.swift
//  ZeplinPractice
//
//  Created by James H Layton on 6/14/18.
//  Copyright © 2018 james. All rights reserved.
//

import Foundation
import UIKit

class IndicatorView: NSObject {
    
    private var spinner = UIActivityIndicatorView()
    
    func startSpinner(view: UIView) {
        self.spinner.activityIndicatorViewStyle = .gray
        self.spinner.hidesWhenStopped = true
        self.spinner.center = view.center
        self.spinner.startAnimating()
        view.addSubview(self.spinner)
    }
    
    func removeSpinner() {
        self.spinner.stopAnimating()
        self.spinner.removeFromSuperview()
    }
}
