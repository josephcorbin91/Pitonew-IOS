//
//  ViewController.swift
//  Pitonew IOS
//
//  Created by Chris Townsend on 2017-02-25.
//  Copyright © 2017 Chris Townsend. All rights reserved.
//

import UIKit
import Foundation //Generic
import UIKit      //iOS
import Cocoa      //OS X

class ViewController: UIViewController {
    
    //Mark

    
    @IBOutlet weak var molecularWeightTextField: UITextField!
    
    @IBOutlet weak var dryBulbTemperatureTextField: UITextField!
    
    @IBOutlet weak var staticPressureTextField: UITextField!
    
    @IBOutlet weak var elevationAboveSealevelTextField: UITextField!
    
    @IBOutlet weak var wetBulbTemperatureTextField: UITextField!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var widthTextField: UITextField!

    @IBOutlet weak var heightTextField: UITextField!
    
    @IBOutlet weak var areaLabel: UILabel!
    @IBAction func clearButton(_ sender: UIButton) {
        //Clear text fields
        widthTextField.text=""
        heightTextField.text=""
        molecularWeightTextField.text=""
        dryBulbTemperatureTextField.text=""
        staticPressureTextField.text=""
        elevationAboveSealevelTextField.text=""
        wetBulbTemperatureTextField.text=""
        seaLevelPressureTextField.text=""
        pilotTubeCoeffecient.text=""
        
        //Clear Edit Texts
        
    }
    @IBAction func calculateButton(_ sender: UIButton) {
        //if(verifyInput()){
        var dynamicPressureArray:[Double] = [10, 20, 30]
      
        let width = Double(widthTextField.text!)
        let height = Double(heightTextField.text!)
        let seaLevelPressure = Double(seaLevelPressureTextField.text!)
        let elevationAboveSealevel = Double(elevationAboveSealevelTextField.text!)
        let staticPressure = Double(staticPressureTextField.text!)
        let dryBulbTemperature = Double(dryBulbTemperatureTextField.text!)
        let molecularWeight = Double(molecularWeight.text!)
        let pilotTubeCoeffecient = Double(pilotTubeCoeffecient.text!)
        let area = width!*height!
        let atmosphericPressure = seaLevelPressure!*pow(10, -0.00001696 *elevationAboveSealevel!);
        let ductPressure = atmosphericPressure! + staticPressure!*0.
        let gasDensity = 1000 * ductPressure! / (273.15 + dryBulbTemperature!) / (8314.3 / molecularWeight!)
        
        var dynamicVelocityArray:[Double]()
        for item in dynamicPressureArray {
        dynamicVelocityArray.append(pilotTubeCoeffecient!*pow(2*item*1000/4.01864/gasDensity!,0.5)
         }
         let averageVelocity = average(dynamicVelocityArray)
         let actualAirFlow= averageVelocity!*area!*3600
         let normalAirFlow = actualAirFlow!*ductPressure!/101.325*273.15/(273.15+((dryBulbTemperature!-32)/1.8));
            

     

        
        areaLabel.text=String(area)
        }
        
        
    func average(nums: [Double]) -> Double {

        var total = 0.0
        //use the parameter-array instead of the global variable votes
        for vote in nums{

            total += Double(vote)

        }

        let votesTotal = Double(nums.count)
        var average = total/votesTotal
        return average
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

