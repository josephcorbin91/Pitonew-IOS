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
        /*
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
         let actualAirFlow = averageVelocity*area*3600
         let massAirFlow=(actualAirFlow*60/pow((39.3701/12),3)*(gasDensity/0.062428)/3600)*2.2046*60
         let normalAirFlow= (actualAirFlow*60/(pow(39.3701/12,3))*(ductPressure/0.2953)/101.325)*273.15/(273.15+dryBulbTemperature!) /60*pow((39.3701/12),3)*(294.26/273.15);

		 }
        */
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

    
    

      
    /*
    @IBAction func unitSwitch(_ sender: Any) {
        if ([self.unitSwitch isOn]) {
		
		
			//Change Units Input
			heightUnitLabel.text = "m"
            widthUnitLabel.text = "m"
			dryBulbTemperatureUnitLabel.text = "°C"
			wetBulbUnitLabel.text = "°C"
			elevationUnitLabel.text = "ft"
			staticPressureUnitLable.text = "kPa"
			
			//Change Units Results
			 unitsAverageVelocity.text = "m/s";
             unitsMassAirFlow.text = "kg/s";
			 unitsNormalAirFlow.text = "Nm³/h";
			 unitsActualAirFlow.text = "m³/h";
			 unitsDuctPressure.text = "kPa";
			 UnitsMolarWeight.text = "g/mol";
			 unitsCalculatedGasDensity.text = "kg/m³";
			 unitsAtmosphericPressureTextView.text = "kPa";
			 unitsAreaTextView.text = "m²";
			 unitsDynamicVelocityTextView.text = "m/s";

			  averageVelocityResultLabel.text = String(Double(averageVelocityResultLabel.text!)*12/39.3701)
              massAirFlowResultLabel.text = String(Double(massAirFlowResultLabel.text!)/(2.2046*60))
              normalAirFlowResultLabel.text = String(Double(normalAirFlowResultLabel.text!)*60/((pow(39.3701/12,3)*(294.26/273.15))))
              actualAirFlowResultLabel.text = String(Double(actualAirFlowResultLabel.text!)*60/(pow(39.3701/12,3)))
              ductPressureFragmentLabel.text = String(Double(ductPressureFragmentLabel.text!)*3.38639)
              gasDesnityResultLabel.text = String(Double(gasDesnityResultLabel.text!)*16.018463))
              atmosphericPressureLabel.text = String(Double(atmosphericPressureLabel.text!)*3.38639)
              ductAreaGasFlowFragmentLabel.text = String(Double.valueOf(ductAreaGasFlowFragmentLabel.text!) * 0.00064516)



                    
			
            [self.unitSwitch setOn:NO animated:YES];
        } else {
			
		    heightUnitLabel.text = "inches"
            widthUnitLabel.text = "inches"
			dryBulbTemperatureUnitLabel.text = "°F"
			wetBulbUnitLabel.text = "°F"
			elevationUnitLabel.text = "ft"
			staticPressureUnitLable.text = "in. Hg"
		
			//Change Units Results
			 unitsAverageVelocity.text = "ft/s";
             unitsMassAirFlow.text = "lb/min";
			 unitsNormalAirFlow.text = "ACFM";
			 unitsActualAirFlow.text = "SCFM";
			 unitsDuctPressure.text = "in. Hg";
			 UnitsMolarWeight.text = "g/mol";
			 unitsCalculatedGasDensity.text = "lb/ft³";
			 unitsAtmosphericPressureTextView.text = "in. Hg";
			 unitsAreaTextView.text = "in²";
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
        }
    }
	*/

    
    
    
    
    //Unit Labels
    @IBOutlet weak var widthUnitLabel: UILabel!
    
    @IBOutlet weak var heightUnitLabel: UILabel!
    
    @IBOutlet weak var molecularWeightUnitLabel: UILabel!
    
    @IBOutlet weak var dryBulbTemperatureUnitLabel: UILabel!
    
    @IBOutlet weak var staticPressureUnitLable: UILabel!
    
    @IBOutlet weak var elevationUnitLabel: UILabel!
    
    @IBOutlet weak var wetBulbUnitLabel: UILabel!
    
    @IBOutlet weak var unitSwitch: UISwitch!
 
    override func viewDidLoad() {
        super.viewDidLoad()
        
       /* unitSwitch.addTarget(self, action: Selector("stateChanged:"), for: UIControlEvents.valueChanged)
        */
    }

    
}

