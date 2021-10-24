//
//  NameSection.swift
//  learn
//
//  Created by sunliheng on 2021/10/24.
//

import UIKit

class NameSection: SectionInterface {
    var vTable: UITableView
    
    var names = ["A","B","C","D","E","F","G","H"]
    
    required init(tableview: UITableView) {
        self.vTable = tableview
        let nib = UINib(nibName: "NameCell", bundle: nil)
        vTable.register(nib, forCellReuseIdentifier: "NameCell")
        let nib1 = UINib(nibName: "NameFooterCell", bundle: nil)
        vTable.register(nib1, forCellReuseIdentifier: "NameFooterCell")
        let nib2 = UINib(nibName: "HeaderCell", bundle: nil)
        vTable.register(nib2, forCellReuseIdentifier: "HeaderCell")
    }
    func cellAndData(indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell = vTable.dequeueReusableCell(withIdentifier: "HeaderCell",for: indexPath) as! HeaderCell
            cell.vTitle.text = "字母"
            return cell
        }
        if indexPath.row == names.count + 1 {
            let cell = vTable.dequeueReusableCell(withIdentifier: "NameFooterCell",for: indexPath) as! NameFooterCell
            return cell
        }
        let cell = vTable.dequeueReusableCell(withIdentifier: "NamesCell", for: indexPath) as! NameCell
        cell.vName.text = names[indexPath.row - 1]
        return cell
    }
    func cellRows() -> Int {
        return names.count + 2
    }
    
    func cellHeight(indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return 50
        }
            return 100
    }
    func cellDidSelect(indexPath: IndexPath) {
    }
}
