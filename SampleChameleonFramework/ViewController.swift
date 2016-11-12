//
//  ViewController.swift
//  SampleChameleonFramework
//
//  Created by 一騎高橋 on 2016/11/12.
//  Copyright © 2016年 IkkiTakahashi. All rights reserved.
//

import UIKit
import ChameleonFramework

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    @IBOutlet weak var coloredView: UIView!
    @IBOutlet weak var colorPicketView: UIPickerView!
    
    var colorTitleArr = ["Red", "Blue", "Green", "PurpleDark", "Orange_White", "Sand_SandDark", "Random"]
    
    var colorArr: [[UIColor]] = [[FlatRed()], [FlatBlue()], [FlatGreen()], [FlatPurpleDark()], [FlatOrange(), FlatWhite()],[FlatSand(), FlatSandDark()], [RandomFlatColor()]]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewDidLayoutSubviews() {
        self.coloredView.layer.borderColor = UIColor.black.cgColor
        self.coloredView.layer.borderWidth = 1.0
        self.coloredView.backgroundColor = self.colorArr[0][0]
    }
    
    // 表示列数
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    // 表示個数
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return colorTitleArr.count
    }
    
    // 表示内容
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return colorTitleArr[row]
    }
    
    // 選択時
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        print(colorTitleArr[row])
        
        if self.colorArr[row].count > 1 {
            self.coloredView.backgroundColor = GradientColor(.leftToRight, frame: self.coloredView.frame, colors: self.colorArr[row])
        } else if self.colorArr[row].count == 1 {
            if colorTitleArr[row] == "Random" {
                self.coloredView.backgroundColor = RandomFlatColor()
            } else {
                self.coloredView.backgroundColor = self.colorArr[row][0]
            }
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

