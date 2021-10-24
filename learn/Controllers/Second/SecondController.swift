//
//  SecondController.swift
//  learn
//
//  Created by sunliheng on 2021/10/22.
//

import UIKit

class SecondController: UIViewController {
    @IBOutlet weak var vTitle: UILabel!
    @IBOutlet weak var vTable: UITableView!
   
    /*
    //定义的列表有几个
    var names = ["A","B","C","D","E","F","G","H"]
    var nums = ["1","2","3","4","5","6","7","8"]
    */
    private var datas: [SectionInterface] = []
    
    private lazy var nameSection: NameSection = {
        NameSection(tableview: vTable)
    }()
    
    private lazy var numSection: NumSection = {
        NumSection(tableview: vTable)
    }()


    override func viewDidLoad() {
        
         super.viewDidLoad()
        /*
        下面两行代码，是把NameCellxip文件给绑定在一起
        let nib = UINib(nibName: "NameCell", bundle: nil)
        vTable.register(nib, forCellReuseIdentifier: "NameCell")
        let nib1 = UINib(nibName: "NameFooterCell", bundle: nil)
        vTable.register(nib1, forCellReuseIdentifier: "NameFooterCell")
        let nib2 = UINib(nibName: "HeaderCell", bundle: nil)
        vTable.register(nib2, forCellReuseIdentifier: "HeaderCell")
        let nib3 = UINib(nibName: "NumCell", bundle: nil)
        vTable.register(nib3, forCellReuseIdentifier: "NumCell")
        */
        datas = [nameSection, numSection]
        vTable.reloadData()
    }

    @IBAction func close() {
        self.dismiss(animated: true, completion: nil)
    }
}
extension SecondController: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return datas.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return datas[section].cellRows()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return datas[indexPath.section].cellAndData(indexPath: indexPath)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return datas[indexPath.section].cellHeight(indexPath: indexPath)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        datas[indexPath.section].cellDidSelect(indexPath: indexPath)
    }
}
    /*  func numberOfSections(in tableView: UITableView) -> Int {
        //定义这里有列表数据
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //这里就是tableview，根据names的数量定有多少表格
        //return names.count
        //判断我选择哪个列表
        return section == 0 ? (names.count + 2) : (nums.count + 1)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      if indexPath.row == 0 {
            let cell = vTable.dequeueReusableCell(withIdentifier: "HeaderCell",for: indexPath) as! HeaderCell
            cell.vTitle.text = indexPath.section == 0 ? "字母" : "数字"
            return cell
        }
        if indexPath.section == 0 && indexPath.row == (names.count + 1) {
            let cell = vTable.dequeueReusableCell(withIdentifier: "NameFooterCell",for: indexPath) as! NameFooterCell
            return cell
        }
        if indexPath.row == 0 {
            let cell = vTable.dequeueReusableCell(withIdentifier: "NameCell",for: indexPath) as! NameCell
            //NameCell输入关联后，这里就可以改动tableview 里面的值了
            //cell.vName.text = "a"
            //这里这indexPath，就能调用我们上面写的names里的不同的值了
            //cell.vName.text = names[indexPath.row]
            cell.vName.text = names[indexPath.row - 1]
            return cell
        }
            let cell = vTable.dequeueReusableCell(withIdentifier: "NumCell",for: indexPath) as! NumCell
            cell.vTitle.text = nums[indexPath.row - 1]
            return cell
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return 50
        }
        //定义下NameFooterCell的高度
        if indexPath.section == 0 && indexPath.row == names.count {
            return 200
        }
        //这里就是tableview的高度
        return indexPath.section == 0 ? 100 : 80
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0 {
            return
        }
        if indexPath.section == 0 && indexPath.row == names.count {
            return
    }
        //通过这个代码，就能把标题改成点击的名字
        //vTitle.text = names[indexPath.row]
        vTitle.text = indexPath.section == 0 ? names[indexPath.row - 1] : nums[indexPath.row - 1]
    }
    //func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
    //形成一个分组
    //return section == 0 ? "字母" : "数字"
    //}
    }
}
*/
