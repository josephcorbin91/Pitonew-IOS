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
    @IBOutlet weak var heightUnitLabel: UILabel!
    @IBOutlet weak var UnitSwitch: UISwitch!
    @IBOutlet weak var dryBulbUnitLabel: UILabel!
    @IBOutlet weak var staticPressureUnitLabel: UILabel!
    @IBOutlet weak var pressureSeaLevelUnitLabel: UILabel!
    @IBOutlet weak var wetBulbUnitLabel: UILabel!
    @IBOutlet weak var areaUnitLabel: UILabel!
    @IBOutlet weak var averageVelocityUnitLabel: UILabel!
    
    @IBOutlet weak var normalAirFlowUnitLabel: UILabel!
    @IBOutlet weak var atmosphericPressureUnitLabel: UILabel!
    
    @IBOutlet weak var actualAirFlowUnitLabel: UILabel!
    @IBOutlet weak var massAirFlowUnitLabel: UILabel!
    @IBOutlet weak var ductPressureUnitLabel: UILabel!
    @IBOutlet weak var gasDensityUnitLabel: UILabel!
    
    //Results
    @IBOutlet weak var averageVelocityResultLabel: UILabel!
    @IBOutlet weak var areaResultLabel: UILabel!
    @IBOutlet weak var normalAirFlowResultLabel: UILabel!
    
    @IBOutlet weak var gasDensityResultLabel: UILabel!
    @IBOutlet weak var ductPressureResultLabel: UILabel!
    @IBOutlet weak var actualAirFlowResultLabel: UILabel!
    @IBOutlet weak var massAirFlowResultLabel: UILabel!
    @IBOutlet weak var atmosphericPressureResultLabel: UILabel!
    @IBOutlet weak var relativeHumidityResultLabel: UILabel!
    //TextFields
    
    @IBOutlet weak var widthTextField: UITextField!
    @IBOutlet weak var heightTextField: UITextField!
    @IBOutlet weak var molecularWeightTextField: UITextField!
    @IBOutlet weak var dryBulbTemperatureTextField: UITextField!
    @IBOutlet weak var staticPressureTextField: UITextField!
    @IBOutlet weak var elevationAboveSeaLevelTextField: UITextField!
    
    @IBOutlet weak var wetBulbTemperatureTextField: UITextField!
    
    @IBOutlet weak var pitotTubeCoeffecientTextField: UITextField!
    @IBOutlet weak var pressureAtSeaLevelTextField: UITextField!
    
    //Area 
    
    func average(nums: [Double]) -> Double {
        
        var total = 0.0
        for number in nums{
            total += Double(number)
        }
        let totalNumbers = Double(nums.count)
        var average = total/totalNumbers
        return average
    }
    
    @IBAction func calculateButton(_ sender: Any) {
        var dynamicPressureArray:[Double] = [1]
        let width = Double(widthTextField.text!)
        let height = Double(heightTextField.text!)
        let pilotTubeCoeffecient = Double(pitotTubeCoeffecientTextField.text!)
        let staticPressure = Double(staticPressureTextField.text!)
        let dryBulbTemperature = Double(dryBulbTemperatureTextField.text!)
        let elevationAboveSealevel = Double(elevationAboveSeaLevelTextField.text!)
        let wetBulbTemperature = Double(wetBulbTemperatureTextField.text!)
        let seaLevelPressure = Double(pressureAtSeaLevelTextField.text!)
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
        
        
        
        
        let numberTwoDigitsFomatter: NumberFormatter = {
            let nf = NumberFormatter()
            nf.numberStyle = .decimal
            nf.minimumFractionDigits = 2
            nf.maximumFractionDigits = 2
            return nf
        }()
        
        let numberThreeDigitsFomatter: NumberFormatter = {
            let nf = NumberFormatter()
            nf.numberStyle = .decimal
            nf.minimumFractionDigits = 3
            nf.maximumFractionDigits = 3
            return nf
        }()
        
        
        let numberFourDigitsFomatter: NumberFormatter = {
            let nf = NumberFormatter()
            nf.numberStyle = .decimal
            nf.minimumFractionDigits = 4
            nf.maximumFractionDigits = 4
            return nf
        }()
        areaResultLabel.text =  numberThreeDigitsFomatter.string(from: area as NSNumber)
        averageVelocityResultLabel.text = numberTwoDigitsFomatter.string(from: averageVelocity as NSNumber)
        normalAirFlowResultLabel.text = String(Int(normalAirFlow))
        atmosphericPressureResultLabel.text = numberTwoDigitsFomatter.string(from: atmosphericPressure as NSNumber)
        massAirFlowResultLabel.text = numberTwoDigitsFomatter.string(from: massAirFlow as NSNumber)
        actualAirFlowResultLabel.text = String(Int(actualAirFlow))
        ductPressureResultLabel.text = numberTwoDigitsFomatter.string(from: ductPressure as NSNumber)
        gasDensityResultLabel.text = numberFourDigitsFomatter.string(from: gasDensity as NSNumber)
        

    
    }
    /*
    func formatNumber(value: Double) -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.maximumFractionDigits = 2;
        let result = formatter
    }
    
    */
    
    @IBAction func unitSwitchClicked(_ sender: Any) {
        var width = Double(widthTextField.text!)
        var height = Double(heightTextField.text!)
        var pilotTubeCoeffecient = Double(pitotTubeCoeffecientTextField.text!)
        var staticPressure = Double(staticPressureTextField.text!)
        var dryBulbTemperature = Double(dryBulbTemperatureTextField.text!)
        var elevationAboveSealevel = Double(elevationAboveSeaLevelTextField.text!)
        var wetBulbTemperature = Double(wetBulbTemperatureTextField.text!)
        var seaLevelPressure = Double(pressureAtSeaLevelTextField.text!)
        var molecularWeight = Double(molecularWeightTextField.text!)
        
        if UnitSwitch.isOn{
            widthUnitLabel.text = "m"
            heightUnitLabel.text = "m"
            dryBulbUnitLabel.text = "°C"
            staticPressureUnitLabel.text = "kPa"
            wetBulbUnitLabel.text = "°C"
            pressureSeaLevelUnitLabel.text = "kPa"
            areaUnitLabel.text = "m^2"
            averageVelocityUnitLabel.text = "m/s"
            normalAirFlowUnitLabel.text = "Nm^3/h"
            atmosphericPressureUnitLabel.text = "kPa"
            massAirFlowUnitLabel.text = "kg/s"
            actualAirFlowUnitLabel.text = "m^3/h"
            normalAirFlowUnitLabel.text = "Nm^3/h"
            widthTextField.text = String(width! * 3)
        }
        else{
            widthUnitLabel.text = "ft"
            heightUnitLabel.text = "ft"
            dryBulbUnitLabel.text = "°F"
            staticPressureUnitLabel.text = "in. Hg"
            wetBulbUnitLabel.text = "°F"
            pressureSeaLevelUnitLabel.text = "in . Hg"
            areaUnitLabel.text = "inch ^2"
            averageVelocityUnitLabel.text = "ft/s"
            normalAirFlowUnitLabel.text = "SCFM"
            atmosphericPressureUnitLabel.text = "in Hg"
            massAirFlowUnitLabel.text = "kg/s"
            actualAirFlowUnitLabel.text = "ACFM"
            normalAirFlowUnitLabel.text = "SCFM"
            widthTextField.text = String(width! / 3)
            
            
        }
        
    }
    
    
    @IBAction func clearButtonClicked(_ sender: Any) {
        widthTextField.text="1"
        heightTextField.text="1"
        molecularWeightTextField.text="28.96"
        dryBulbTemperatureTextField.text="1"
        staticPressureTextField.text="1"
        elevationAboveSeaLevelTextField.text="1"
        wetBulbTemperatureTextField.text="1"
        pressureAtSeaLevelTextField.text="1"
        pitotTubeCoeffecientTextField.text="1"
    }

    override func viewDidLoad() {
        super.viewDidLoad()
}
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}


    
