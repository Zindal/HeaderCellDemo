//
//  HeaderView.swift
//  JindalPatelTest
//
//  Created by Zindal on 12/02/21.
//

import Foundation
import UIKit

class HeaderView: UIView {
    
    @IBOutlet var lblTitle: UILabel!
    @IBOutlet var btnAdd: UIButton!
    var plusClickCallBack: DefaultCallback?
    
    @IBAction func btnAddCellAction(_ sender: Any) {
        plusClickCallBack?()
    }
    
}
