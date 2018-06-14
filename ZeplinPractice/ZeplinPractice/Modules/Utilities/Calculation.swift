//
//  Calculation.swift
//  ZeplinPractice
//
//  Created by James H Layton on 6/14/18.
//  Copyright © 2018 james. All rights reserved.
//

import Foundation
import UIKit

class Calculation: NSObject {
    
    func calculateProgress(_ firstInput: Int, _ secondInput: Int) -> Float {
        let firstValue = Float(firstInput)
        let secondValue = Float(secondInput)
        return (firstValue / secondValue)
    }
}
