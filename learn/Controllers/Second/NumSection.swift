//
//  NumSection.swift
//  learn
//
//  Created by sunliheng on 2021/10/24.
//

import UIKit

class NumSection: SectionInterface {
    var vTable: UITableView
    
    var nums = ["1","2","3","4","5","6","7","8"]
    
    required init(tableview: UITableView) {
        self.vTable = tableview
        let nib2 = UINib(nibName: "HeaderCell", bundle: nil)
        vTable.register(nib2, forCellReuseIdentifier: "HeaderCell")
        let nib3 = UINib(nibName: "NumCell", bundle: nil)
        vTable.register(nib3, forCellReuseIdentifier: "NumCell")
        
    }
    func cellAndData(indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell = vTable.dequeueReusableCell(withIdentifier: "HeaderCell",for: indexPath) as! HeaderCell
            cell.vTitle.text = "数字"
            return cell
        }
            let cell = vTable.dequeueReusableCell(withIdentifier: "NumCell",for: indexPath) as! NumCell
        cell.vTitle.text = nums[indexPath.row - 1]
            return cell
    }
    func cellRows() -> Int {
        return nums.count + 1
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
