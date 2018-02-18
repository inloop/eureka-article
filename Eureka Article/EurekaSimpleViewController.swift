//
//  EurekaSimpleViewController.swift
//  Eureka Article
//
//  Created by Tomáš Srna on 13/02/2018.
//  Copyright © 2018 Inloop. All rights reserved.
//

import UIKit
import Eureka

class EurekaSimpleViewController: FormViewController {
    
    // Struct for form items tag constants
    struct FormItems {
        static let name = "name"
        static let birthDate = "birthDate"
        static let like = "like"
        
        static let yoda = "yoda"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        form +++ Section("About You")
            <<< TextRow(FormItems.name) { row in
                row.title = "Name"
                row.placeholder = "Your Name"
            }
            <<< DateRow(FormItems.birthDate) { row in
                row.title = "Birthday"
            }
            <<< CheckRow(FormItems.like) { row in
                row.title = "I like Eureka"
                row.value = true
        }
        
        form +++ Section("Pre-fill")
            <<< ButtonRow { row in
                row.title = "Yoda"
                }.onCellSelection({ [unowned self] (cell, row) in
                    if let nameRow = self.form.rowBy(tag: FormItems.name) as? RowOf<String>,
                        let birthDateRow = self.form.rowBy(tag: FormItems.birthDate) as? RowOf<Date>,
                        let likeRow = self.form.rowBy(tag: FormItems.like) as? RowOf<Bool> {
                        nameRow.value = "Yoda"
                        nameRow.updateCell()
                        
                        birthDateRow.value = Date(timeInterval: -900*365*86400, since: Date())
                        birthDateRow.updateCell()
                        
                        likeRow.value = true
                        likeRow.updateCell()
                        
                        row.disabled = .function([FormItems.name]) { form in
                            (form.rowBy(tag: FormItems.name) as? RowOf<String>)?.value == "Yoda"
                        }
                        row.evaluateDisabled()
                    }
                })
    }
    
}
