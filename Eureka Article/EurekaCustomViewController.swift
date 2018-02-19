//
//  AurekaCustomViewController.swift
//  Eureka Article
//
//  Created by Tomáš Srna on 19/02/2018.
//  Copyright © 2018 Inloop. All rights reserved.
//

import UIKit
import Eureka

class EurekaCustomViewController: FormViewController {
    
    // Struct for form items tag constants
    struct FormItems {
        static let stringLength = "stringLength"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        form +++ Section("String with max length")
            <<< StringLengthRow(FormItems.stringLength) { row in
                row.maximumLength = 20
                row.placeholder = "Enter maximum of 20 characters"
        }
    }

}
