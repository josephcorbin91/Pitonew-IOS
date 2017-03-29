//
//  ViewController.swift
//  Pitonew IOS
//
//  Created by Chris Townsend on 2017-02-25.
//  Copyright © 2017 Chris Townsend. All rights reserved.
//

import UIKit
import Foundation //Generic


class ViewController: UIViewController {
    
    @IBOutlet weak var widthUnitLabel: UILabel!
    @IBOutlet weak var UnitSwitch: UISwitch!
    @IBAction func unitSwitchClicked(_ sender: Any) {
        if UnitSwitch.isOn{
            widthUnitLabel.text = "m"
        }
        else{
            widthUnitLabel.text = "ft"
            
        }
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
}
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}


    /*
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
    /*
    //Switch 
    @IBOutlet var unitSwitch: UISwitch!
    
    func stateChanged(switchState: UISwitch){
        if switchState.isOn{
            areaLabel.text = "On"
        }
        else{
            areaLabel.text = "Off"
        }
    }
    */
    
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
                            
          // if(currentUnits = SI){
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
        //}
			//else if(currentUnits = US){
        let area = width!*height!
        let atmosphericPressure = seaLevelPressure!*pow(10, -0.00001696*elevationAboveSealevel!)
        let ductPressure = atmosphericPressure + staticPressure!* 0.07355
		let gasDensity = 0.062428*(1000 * (ductPressure*3.386375) / (273.15 + ((dryBulbTemperature!-32)*(5/9))) / (8314.3 / molecularWeight!));

        
        var dynamicVelocityArray = [Double]()
        for item in dynamicPressureArray {
        dynamicVelocityArray.append(3.28084 * pilotTubeCoeffecient!*pow(2*item*1000/4.01864/(gasDensity/0.062428),0.5))
        }
         let averageVelocity = average(nums: dynamicVelocityArray)
			 unitsDynamicVelocityTextView.text = "ft/s";
			 
			  averageVelocityResultLabel.text = String(Double(averageVelocityResultLabel.text!)*39.3701/12)
              massAirFlowResultLabel.text = String(Double(massAirFlowResultLabel.text!)*2.2046*60)
              normalAirFlowResultLabel.text = String(Double(normalAirFlowResultLabel.text!)*(pow(39.3701/12,3)*(294.26/273.15)/60))
              actualAirFlowResultLabel.text = String(Double(actualAirFlowResultLabel.text!)/60*(pow(39.3701/12,3)))
              ductPressureFragmentLabel.text = String(Double(ductPressureFragmentLabel.text!)/3.38639)
              gasDesnityResultLabel.text = String(Double(gasDesnityResultLabel.text!)/16.018463))
              atmosphericPressureLabel.text = String(Double(atmosphericPressureLabel.text!)/3.38639)
              ductAreaGasFlowFragmentLabel.text = String(Double.valueOf(ductAreaGasFlowFragmentLabel.text!) / 0.00064516)

			 


			
			
			
            [self.unitSwitch setOn:YES animated:YES];
        }/Users/user125303/Documents/Pitonew-IOS/Pitonew IOS/ViewController.swift:183:4: Unterminated '/*' comment
    }
	

    
    
    
    
    //Unit Labels
    @IBOutlet weak var widthUnitLabel: UILabel!
    
    @IBOutlet weak var heightUnitLabel: UILabel!
    
    @IBOutlet weak var molecularWeightUnitLabel: UILabel!
    
    @IBOutlet weak var dryBulbTemperatureUnitLabel: UILabel!
    
    @IBOutlet weak var staticPressureUnitLable: UILabel!
    
    @IBOutlet weak var elevationUnitLabel: UILabel!
    
    @IBOutlet weak var wetBulbUnitLabel: UILabel!
 */
 
 */
