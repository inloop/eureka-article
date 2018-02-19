//
//  EurekaSelectionsViewController.swift
//  Eureka Article
//
//  Created by Tomáš Srna on 18/02/2018.
//  Copyright © 2018 Inloop. All rights reserved.
//

import UIKit
import Eureka

class EurekaSelectionsViewController: FormViewController {
    
    // Struct for form items tag constants
    struct FormItems {
        static let whenDoYouCode = "whenDoYouCode"
        static let primaryLanguage = "primaryLanguage"
        static let methodology = "methodology"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        form +++ Section("Coding")
            <<< PickerInputRow<String>(FormItems.whenDoYouCode) { row in
                row.title = "When do you code?"
                row.options = ["9 to 5", "At night", "All the time :)"]
            }
            <<< PushRow<String>(FormItems.primaryLanguage) { row in
                row.title = "Preferred language"
                row.options = ["Swift", "Objective C"]
        }
        
        
        let methodologies = ["MVVM", "RxSwift", "Dependency injection", "Clean Swift", "VIPER"]
        
        form +++ SelectableSection<ListCheckRow<String>>("Which methodologies do you prefer?", selectionType: .multipleSelection)
        for option in methodologies {
            form.last! <<< ListCheckRow<String>(option) { lrow in
                lrow.title = option
                lrow.selectableValue = option
                lrow.value = nil
            }
        }
    }
}
