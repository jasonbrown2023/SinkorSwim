//
//  MiscViewController.swift
//  UIExample
//
//  Created by Sam Yao on 9/11/23.
//

import UIKit

class MiscViewController: UIViewController {

    @IBOutlet weak var numberLabel: UILabel!
    @IBOutlet weak var numberStepper: UIStepper!
    
    lazy var numberModel = {
        return NumberModel.sharedInstance()
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.numberLabel.text = "\(Int(numberModel.getRandomInt()))"
        self.numberStepper.value = Double(numberModel.getRandomInt())
    }
    
    @IBAction func changeNumber(_ sender: UIStepper) {
        numberModel.setRandomInt(Int(sender.value))
        self.numberLabel.text = "\(numberModel.getRandomInt())"
    }
    
    @IBAction func dankModeSwitch(_ sender: UISwitch) {
        if sender.isOn{
            self.view.backgroundColor = UIColor.green
        }else{
            self.view.backgroundColor = UIColor.white
        }
    }
    
}
