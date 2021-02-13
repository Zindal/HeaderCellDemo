//
//  TableCell.swift
//  JindalPatelTest
//
//  Created by Zindal on 12/02/21.
//

import Foundation
import UIKit

class TableCell: UITableViewCell {
    
    @IBOutlet var btnMinus: UIButton!
    @IBOutlet var lblCount: UILabel!
    @IBOutlet var btnPlus: UIButton!
    
    @IBOutlet var lblCellTitle: UILabel!
        
    var minusCountCallBack: DefaultCallback?
    var plusCountCallBack: DefaultCallback?

    @IBAction func btnPlusClicked(_ sender: Any) {
        plusCountCallBack?()
    }
    
    @IBAction func btnMinusClicked(_ sender: Any) {
        minusCountCallBack?()
    }
    
}
