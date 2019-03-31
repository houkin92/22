//
//  ViewController.swift
//  通知
//
//  Created by 方瑾 on 2019/2/26.
//  Copyright © 2019 方瑾. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var countLabel: UILabel!
    
    
    @IBOutlet weak var inputTableView: UITableView!
    var array = ["bvuiefhbvierhvievneibeb kfb jfbvkdfb kdvkbkvkvbvnjvdkvkenkf bkfbfb kjdfb kfd kfb keb ",                 "bcsdbv.aggndjkśhhdscshcsalkhcalcsduhuervhkjevhuievberubvbrjuvbdkfjbvka;dvbadkvnefvnkvnkjfjcbcsdbv.aggndjkśhhdscshcsalkhcalcsduhuervhkjevhuievberubvbrjuvbdkfjbvka;dvbadkvnefvnkvnkjfjcbcsdbv.aggndjkśhhdscshcsalkhcalcsduhuervhkjevhuievberubvbrjuvbdkfjbvka;dvbadkvnefvnkvnkjfjcbcsdbv.aggndjkśhhdscshcsalkhcalcsduhuervhkjevhuievberubvbrjuvbdkfjbvka;dvbadkvnefvnkvnkjfjcbcsdbv.aggndjkśhhdscshcsalkhcalcsduhuervhkjevhuievberubvbrjuvbdkfjbvka;dvbadkvnefvnkvnkjfjcbcsdbv.aggndjkśhhdscshcsalkhcalcsduhuervhkjevhuievberubvbrjuvbdkfjbvka;dvbadkvnefvnkvnkjfjc",                 "bcsdbv.aggndjkśhhdscshcsalkhcalcsduhuervhkjevhuievberubvbrjuvbdkfjbvka;dvbadkvnefvnkvnkjfjcbcsdbv.aggndjkśhhdscshcsalkhcalcsduhuervhkjevhuievberubvbrjuvbdkfjbvka;dvbadkvnefvnkvnkjfjcbcsdbv.aggndjkśhhdscshcsalkhcalcsduhuervhkjevhuievberubvbrjuvbdkfjbvka;dvbadkvnefvnkvnkjfjcbcsdbv.aggndjkśhhdscshcsalkhcalcsduhuervhkjevhuievberubvbrjuvbdkfjbvka;dvbadkvnefvnkvnkjfjcbcsdbv.aggndjkśhhdscshcsalkhcalcsduhuervhkjevhuievberubvbrjuvbdkfjbvka;dvbadkvnefvnkvnkjfjcbcsdbv.aggndjkśhhdscshcsalkhcalcsduhuervhkjevhuievberubvbrjuvbdkfjbvka;dvbadkvnefvnkvnkjfjc","bcsdbv.aggndjkśhhdscshcsalkhcalcsduhuervhkjevhuievberubvbrjuvbdkfjbvka;dvbadkvnefvnkvnkjfjcbcsdbv.aggndjkśhhdscshcsalkhcalcsduhuervhkjevhuievberubvbrjuvbdkfjbvka;dvbadkvnefvnkvnkjfjcbcsdbv.aggndjkśhhdscshcsalkhcalcsduhuervhkjevhuievberubvbrjuvbdkfjbvka;dvbadkvnefvnkvnkjfjcbcsdbv.aggndjkśhhdscshcsalkhcalcsduhuervhkjevhuievberubvbrjuvbdkfjbvka;dvbadkvnefvnkvnkjfjcbcsdbv.aggndjkśhhdscshcsalkhcalcsduhuervhkjevhuievberubvbrjuvbdkfjbvka;dvbadkvnefvnkvnkjfjcbcsdbv.aggndjkśhhdscshcsalkhcalcsduhuervhkjevhuievberubvbrjuvbdkfjbvka;dvbadkvnefvnkvnkjfjc"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        countLabel.text = "请继续输入"
        inputTableView.delegate = self
        inputTableView.dataSource = self
        NotificationCenter.default.addObserver(self, selector: #selector(changeLabel), name: changeLabelText, object: nil)
    }
    @objc func changeLabel() {
        countLabel.text = "不能再继续输入"
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)   //析构函数,适当进行移除
    }
//    override func viewWillDisappear(_ animated: Bool) {
//        super.viewWillDisappear(animated)
//        NotificationCenter.default.removeObserver(self)
//
//    }

}

extension ViewController: UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1 + array.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "inputcell", for: indexPath) as! InputTableViewCell
//            cell.xieyi = self   //给它赋值
            return cell
        } else {
            let cell = UITableViewCell()
            cell.textLabel?.numberOfLines = 0
            cell.textLabel!.text = array[indexPath.row - 1 ]
            return cell
        }
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return 80
        } else {
            return UITableView.automaticDimension//自己找高度
        }
        
    }
}
//在需要定义并执行协议的方法的地方，对当前页面进行拓展
//extension ViewController : MakeLabelChangeDelegate {
//    func changeLabel() {
//        countLabel.text = "不能再继续输入"
//    }
//}
