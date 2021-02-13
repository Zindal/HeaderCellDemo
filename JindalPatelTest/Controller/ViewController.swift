//
//  ViewController.swift
//  JindalPatelTest
//
//  Created by Zindal on 12/02/21.
//

import UIKit
typealias DefaultCallback = (()->())

class ViewController: UIViewController {

    @IBOutlet var tblView: UITableView!
    var infoArr: [HeaderInfo]! = []
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func btnAddHeader(_ sender: Any) {
        let headerInfo = HeaderInfo(headerNo:infoArr.count + 1)
        infoArr.append(headerInfo)
        tblView.reloadData()
    }
   
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return infoArr.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let rowCount = infoArr[section].cellInfo?.count ?? 0
        return rowCount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableCell") as! TableCell
        let modelCell = infoArr[indexPath.section].cellInfo?[indexPath.row]
        
        cell.plusCountCallBack = {
            let currentCount = self.infoArr[indexPath.section].cellInfo?[indexPath.row].cellCount ?? 0
            self.infoArr[indexPath.section].cellInfo?[indexPath.row].cellCount = currentCount + 1
            DispatchQueue.main.async {
                self.tblView.reloadRows(at: [indexPath], with: .none)
            }
        }
        
        cell.minusCountCallBack = {
            let currentCount = self.infoArr[indexPath.section].cellInfo?[indexPath.row].cellCount ?? 0
            if currentCount != 0 {
                self.infoArr[indexPath.section].cellInfo?[indexPath.row].cellCount = currentCount - 1
                DispatchQueue.main.async {
                    self.tblView.reloadRows(at: [indexPath], with: .none)
                }
            }
        }

        cell.lblCellTitle.text = "Cell \(modelCell?.cellNo ?? 0)"
        cell.lblCount.text = "\(modelCell?.cellCount ?? 0)"

        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let nib = UINib(nibName: "HeaderView", bundle: Bundle.main)
        let view = nib.instantiate(withOwner: self, options: nil)[0] as! HeaderView
        let model = infoArr[section]
        view.lblTitle.text = "Header \(model.headerNo ?? 0)"
        view.plusClickCallBack = {
            self.infoArr[section].cellInfo?.append(CellInfo(cellNo: (model.cellInfo?.count ?? 0) + 1, cellCount: 0))
            DispatchQueue.main.async {
                self.tblView.reloadData()
            }
        }
        return view
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 55
    }
    
}
