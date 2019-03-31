//
//  InputTableViewCell.swift
//  通知
//
//  Created by 方瑾 on 2019/2/26.
//  Copyright © 2019 方瑾. All rights reserved.
//

import UIKit
let changeLabelText = NSNotification.Name("ChangeLabelText")
//第二种方法：在将要使用协议的地方定义协议（一定要在class的外面）
//Protocol MakeLabelChangeDelegate {
//    func changeLabel()
//}
class InputTableViewCell: UITableViewCell {

    @IBOutlet weak var inputTextView: UITextView!
    
//    var xieyi : MakeLabelChangeDelegate？
    override func awakeFromNib() {
        super.awakeFromNib()
        
        inputTextView.delegate = self
        
        inputTextView.layer.borderWidth = 0.5
        inputTextView.layer.borderColor = UIColor.black.cgColor
        
        
    }
}
extension InputTableViewCell: UITextViewDelegate {
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        let text = inputTextView.text!
        if text.count == 10 {
//            xieyi?.changeLabel()
            //发送通知
            NotificationCenter.default.post(name: changeLabelText, object: self)
            return false
        } else {
            return true
        }
    }
}
