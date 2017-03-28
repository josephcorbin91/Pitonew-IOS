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


class ViewController: UIViewController {
    
    //Mark

    
    @IBOutlet weak var molecularWeightTextField: UITextField!
    
    @IBOutlet weak var dryBulbTemperatureTextField: UITextField!
    
    @IBOutlet weak var staticPressureTextField: UITextField!
    
    @IBOutlet weak var elevationAboveSealevelTextField: UITextField!
    
    @IBOutlet weak var wetBulbTemperatureTextField: UITextField!
    @IBOutlet weak var pitotTubeCoeffecientTextField: UITextField!
    @IBOutlet weak var pressureAtSealevelTextField: UITextField!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var widthTextField: UITextField!
    @IBOutlet weak var heightTextField: UITextField!
    
    
    //Labels
    @IBOutlet weak var areaLabel: UILabel!
    @IBOutlet weak var averageVelocityLabel: UILabel!
    @IBOutlet weak var massAirFlowLabel: UILabel!
    @IBOutlet weak var normalAirFlowLabel: UILabel!
    @IBOutlet weak var actualAirFlowLabel: UILabel!
    @IBOutlet weak var relativeHumidityLabel: UILabel!
    @IBOutlet weak var ductPressureLabel: UILabel!
    @IBOutlet weak var atmosphericPressureLabel: UILabel!
    @IBOutlet weak var gasDensityLabel: UILabel!
    @IBAction func clearButton(_ sender: UIButton) {
        //Clear text fields
        widthTextField.text="1"
        heightTextField.text="1"
        molecularWeightTextField.text="28.96"
        dryBulbTemperatureTextField.text="1"
        staticPressureTextField.text="1"
        elevationAboveSealevelTextField.text="1"
        wetBulbTemperatureTextField.text="1"
        pressureAtSealevelTextField.text="1"
        pitotTubeCoeffecientTextField.text="1"
        
        //Clear labels
        averageVelocityLabel.text="Average Velocity : "
        massAirFlowLabel.text="Mass Air Flow :"
        actualAirFlowLabel.text="Actual Air Flow :"
        normalAirFlowLabel.text="Normal Air Flow :"
        ductPressureLabel.text="Duct Pressure :"
        areaLabel.text="Area :"
        relativeHumidityLabel.text="Relative Humidity :"
        atmosphericPressureLabel.text="Atmospheric Pressure :"
        gasDensityLabel.text="Gas Density :"
        
        
        
        
    }
    @IBAction func calculateButton(_ sender: UIButton) {
        //if(verifyInput()){
        var dynamicPressureArray:[Double] = [1]
      
        let width = Double(widthTextField.text!)
        let height = Double(heightTextField.text!)
        let pilotTubeCoeffecient = Double(pitotTubeCoeffecientTextField.text!)
        let staticPressure = Double(staticPressureTextField.text!)
        let dryBulbTemperature = Double(dryBulbTemperatureTextField.text!)
        let elevationAboveSealevel = Double(elevationAboveSealevelTextField.text!)
        let wetBulbTemperature = Double(wetBulbTemperatureTextField.text!)
        let seaLevelPressure = Double(pressureAtSealevelTextField.text!)
        let molecularWeight = Double(molecularWeightTextField.text!)
                            
        
        let area = width!*height!
        let atmosphericPressure = seaLevelPressure!*pow(10, -0.00001696*elevationAboveSealevel!);
        let ductPressure = atmosphericPressure + staticPressure!*0.249088
        let gasDensity = 1000 * ductPressure / (273.15 + dryBulbTemperature!) / (8314.3 / molecularWeight!)
        
        var dynamicVelocityArray = [Double]()
        for item in dynamicPressureArray {
        dynamicVelocityArray.append(pilotTubeCoeffecient!*pow(2*item*1000/4.01864/gasDensity,0.5))
         }
         let averageVelocity = average(nums: dynamicVelocityArray)
         let actualAirFlow = averageVelocity*area*3600
         let massAirFlow=actualAirFlow*gasDensity/3600;
         let normalAirFlow = actualAirFlow*ductPressure/101.325*273.15/(273.15+((dryBulbTemperature!-32)/1.8))
            

     

        
        averageVelocityLabel.text="Average Velocity : " + String(averageVelocity)
        massAirFlowLabel.text="Mass Air Flow : "+String(massAirFlow)
        actualAirFlowLabel.text="Actual Air Flow : " + String(actualAirFlow)
        normalAirFlowLabel.text="Normal Air Flow : " + String(normalAirFlow)
        ductPressureLabel.text="Duct Pressure : " + String(ductPressure)
        areaLabel.text="Area : " + String(area)
        relativeHumidityLabel.text=String()
        atmosphericPressureLabel.text="Atmospheric Pressure : " + String(atmosphericPressure)
       gasDensityLabel.text="Gas Density : " + String(gasDensity)
        
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

