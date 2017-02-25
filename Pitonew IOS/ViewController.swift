//
//  ViewController.swift
//  Pitonew IOS
//
//  Created by Chris Townsend on 2017-02-25.
//  Copyright © 2017 Chris Townsend. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //Mark

    
    
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var widthTextField: UITextField!

    @IBOutlet weak var heightTextField: UITextField!
    
    @IBOutlet weak var areaLabel: UILabel!
    @IBAction func clearButton(_ sender: UIButton) {
        widthTextField.text=""
        heightTextField.text=""
    }
    @IBAction func calculateButton(_ sender: UIButton) {
        let width = Double(widthTextField.text!)
        let height = Double(heightTextField.text!)
        let area = width!*height!
        areaLabel.text=String(area)
    }
    
    
    //Unit Labels
    @IBOutlet weak var widthUnitLabel: UILabel!
    
    @IBOutlet weak var heightUnitLabel: UILabel!
    
    @IBOutlet weak var molecularWeightUnitLabel: UILabel!
    
    @IBOutlet weak var dryBulbTemperatureUnitLabel: UILabel!
    
    @IBOutlet weak var staticPressureUnitLable: UILabel!
    
    @IBOutlet weak var elevationUnitLabel: UILabel!
    
    @IBOutlet weak var wetBulbUnitLabel: UILabel!
    
    @IBOutlet weak var unitSwitch: UISwitch!
    
    /*
    @IBAction func unitSwitch(_ sender: Any) {
        if ([self.unitSwitch isOn]) {
            self.widthUnitLabel.text = "m"
            [self.unitSwitch setOn:NO animated:YES];
        } else {
            self.widthUnitLabel.text = "f";
            [self.unitSwitch setOn:YES animated:YES];
        }
    }
    
    
    - (void)stateChanged:(UISwitch *)switchState
    {
    if ([switchState isOn]) {
    self.myTextField.text = @"The Switch is On";
    } else {
    self.myTextField.text = @"The Switch is Off";
    }
    }
 
    //Properties
    func stateChanged(switchState: UISwitch) {
        if unitSwitch.isOn {
            widthUnitLabel.text = "m"
        } else {
            heightUnitLabel.text = "f"
        }
    }
 */
    override func viewDidLoad() {
        super.viewDidLoad()
        
       /* unitSwitch.addTarget(self, action: Selector("stateChanged:"), for: UIControlEvents.valueChanged)
        */
    }

    
}

