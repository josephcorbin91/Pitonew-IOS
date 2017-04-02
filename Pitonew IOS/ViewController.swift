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
    
    
    //Switch
    @IBOutlet weak var AirCompositionSwitch: UISwitch!
    @IBOutlet weak var wetBulbSwitch: UISwitch!
    @IBOutlet weak var pipeShapeSwitch: UISwitch!
    
    
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
    
    @IBOutlet weak var CO2TextField: UITextField!
    
    @IBOutlet weak var ArTextField: UITextField!
    @IBOutlet weak var N2TextField: UITextField!
    @IBOutlet weak var H20TextField: UITextField!
    
    @IBOutlet weak var O2TextField: UITextField!
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
        
        if((widthTextField.text?.isEmpty)! || (heightTextField.text?.isEmpty)! || (pitotTubeCoeffecientTextField.text?.isEmpty)! || (staticPressureTextField.text?.isEmpty)! || (dryBulbTemperatureTextField.text?.isEmpty)! || (elevationAboveSeaLevelTextField.text?.isEmpty)! || (wetBulbTemperatureTextField.text?.isEmpty)! || (pressureAtSeaLevelTextField.text?.isEmpty)! || (molecularWeightTextField.text?.isEmpty)!) //|| (CO2TextField.text?.isEmpty)! || (O2TextField.text?.isEmpty)! || (N2TextField.text?.isEmpty)! || (ArTextField.text?.isEmpty)! || (H20TextField.text?.isEmpty)!)
        {
            
        }
        else{
        var dynamicPressureArray:[Double] = [1]
        let width = Double(widthTextField.text!)
        let height = Double(heightTextField.text!)
        let pilotTubeCoeffecient = Double(pitotTubeCoeffecientTextField.text!)
        let staticPressure = Double(staticPressureTextField.text!)
        let dryBulbTemperature = Double(dryBulbTemperatureTextField.text!)
        let elevationAboveSealevel = Double(elevationAboveSeaLevelTextField.text!)
        let wetBulbTemperature = Double(wetBulbTemperatureTextField.text!)
        let seaLevelPressure = Double(pressureAtSeaLevelTextField.text!)
        var molecularWeight = Double(molecularWeightTextField.text!)
        let C02Composition = Double(CO2TextField.text!)
        let O2Composition = Double(O2TextField.text!)
        let N2Composition = Double(N2TextField.text!)
        let ARComposition = Double(ArTextField.text!)
        let H2OComposition = Double(H20TextField.text!)
        var relativeHumidity: Double
        var dryBulbRankine: Double
        var wetBulbRankine: Double
        var Kd: Double
        var humidityH20WetAir = 0.0
        var Kw: Double
        var dryMolecularWeight: Double
        var partialPressureOfWaterPA: Double
        var dryBulbWaterSaturationPressurePD: Double
        var wetBulbWaterSaturationPressurePW: Double
        var partialWaterPressureDueToDepressionPM: Double
        let standardAirMolarWeight = 28.96;
        let criticalPressureH20 = 166818.0;
        let criticalTemperatureH20 = 1165.67;
        let pressMmHg=754.30;
        var humidityH20DryAir:Double
        
        if(wetBulbSwitch.isOn){
            if(UnitSwitch.isOn){
                dryBulbRankine = (dryBulbTemperature! * 1.8 + 32)  + 459.67
                wetBulbRankine = (wetBulbTemperature! * 1.8 + 32) + 459.67
            }
            else {
                dryBulbRankine = dryBulbTemperature! + 459.67
                wetBulbRankine = wetBulbTemperature! + 459.67
            }
            
            Kd = -0.0000000008833 * pow(dryBulbRankine,3) + 0.000003072 * pow(dryBulbRankine,2) - 0.003469 * dryBulbRankine + 4.39553
            Kw = -0.0000000008833 * pow(wetBulbRankine,3)+0.000003072 * pow(wetBulbRankine,2) - 0.003469 * wetBulbRankine + 4.39553
            dryBulbWaterSaturationPressurePD = criticalPressureH20 * pow(10, Kd * (1 - (criticalTemperatureH20 / dryBulbRankine)))
            wetBulbWaterSaturationPressurePW = criticalPressureH20 * pow(10, Kw * (1 - (criticalTemperatureH20 / wetBulbRankine)))
            partialWaterPressureDueToDepressionPM = 0.000367 * (1 + ((wetBulbRankine-459.67) - 32) / 1571) * (pressMmHg - wetBulbWaterSaturationPressurePW) * ((dryBulbRankine - 459.67) - (wetBulbRankine - 459.67))
            
             // if((wetBulbWaterSaturationPressurePW - partialWaterPressureDueToDepressionPM) / dryBulbWaterSaturationPressurePD> = 100 || (wetBulbWaterSaturationPressurePW -  partialWaterPressureDueToDepressionPM) / dryBulbWaterSaturationPressurePD < 0){
            //}
           // else{
                
                relativeHumidity = 100 * (wetBulbWaterSaturationPressurePW-partialWaterPressureDueToDepressionPM)/dryBulbWaterSaturationPressurePD
           // }
            
            partialPressureOfWaterPA = 0.01 * relativeHumidity * dryBulbWaterSaturationPressurePD
            
            if(wetBulbSwitch.isOn){
                humidityH20WetAir = partialPressureOfWaterPA / pressMmHg
            }
            else{
                humidityH20WetAir = 0
            }
            
                var part1 = 44.01 * (C02Composition! * (1 - humidityH20WetAir))
                var part2 = 31.999 * (O2Composition! * ( 1 - humidityH20WetAir))
                var part3 = 28.013*(N2Composition! * (1-humidityH20WetAir))
                var part4 = 39.948*(ARComposition! * (1 - humidityH20WetAir))
                
                dryMolecularWeight = (part1 + part2 + part3 + part4)/100;
                
                humidityH20DryAir = (18.02 / dryMolecularWeight) * (partialPressureOfWaterPA / (pressMmHg - partialPressureOfWaterPA))
        
        }
        else{
            
            }
            
            
            if(AirCompositionSwitch.isOn){
                if(wetBulbSwitch.isOn){
                    var part1 = 0.03 * (1 - humidityH20WetAir)
                    var part2 = 20.95 * (1 - humidityH20WetAir)
                    var part3 = 78.09 * (1 - humidityH20WetAir)
                    var part4 = 0.93 * (1 - humidityH20WetAir)
                    var part5 = 100 * humidityH20WetAir
                    
                    
                    molecularWeight = part1 + part2 + part3 + part4 + part5
                }
                else {
                    molecularWeight = 28.96
                }
            }
            else {
                if(wetBulbSwitch.isOn){
                    var part1 = 44.01 * C02Composition! * (1 - humidityH20WetAir)
                    var part2 = 31.999 * O2Composition! * (1 - humidityH20WetAir)
                    var part3 = 28.013 * N2Composition! * (1 - humidityH20WetAir)
                    var part4 = 39.948 * ARComposition! * (1 - humidityH20WetAir)
                    var part5 = 18.016 * 100 * humidityH20WetAir
                    molecularWeight = (part1 + part2 + part3 + part4 + part5)/100
                }
                else {
                    var part1 = 44.01 * C02Composition!
                    var part2 = 31.999 * O2Composition!
                    var part3 = 28.013 * N2Composition!
                    var part4 = 39.948 * ARComposition!
                    molecularWeight = (part1 + part2 + part3 + part4) / 100
                }
                
            }
            /*
            
            
            
            
           
         }
         else {
        }
       
    }
            
 */
            
        
        
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
        
    }
    
    
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    @IBAction func segmentedControlindexChange(_ sender: Any) {
       
        switch segmentedControl.selectedSegmentIndex {
        case 0:
            {
                self.widthUnitLabel.isHidden = false
                self.heightUnitLabel.isHidden = false
                self.dryBulbUnitLabel.isHidden = false
                self.staticPressureUnitLabel.isHidden = false
                self.pressureSeaLevelUnitLabel.isHidden = false
                self.wetBulbUnitLabel.isHidden = false
                
                self.areaUnitLabel.isHidden = true
                self.averageVelocityUnitLabel.isHidden = true
                self.normalAirFlowUnitLabel.isHidden = true
                self.atmosphericPressureUnitLabel.isHidden = true
                self.actualAirFlowUnitLabel.isHidden = true
                self.massAirFlowUnitLabel.isHidden = true
                self.ductPressureUnitLabel.isHidden = true
                self.gasDensityUnitLabel.isHidden = true
                
                self.averageVelocityResultLabel.isHidden = true
                self.areaResultLabel.isHidden = true
                self.normalAirFlowResultLabel.isHidden = true
                self.gasDensityResultLabel.isHidden = true
                self.ductPressureResultLabel.isHidden = true
                self.actualAirFlowResultLabel.isHidden = true
                self.massAirFlowResultLabel.isHidden = true
                self.atmosphericPressureResultLabel.isHidden = true
                self.relativeHumidityResultLabel.isHidden = true
                
                
                
                self.AirCompositionSwitch.isHidden = false
                self.wetBulbSwitch.isHidden = false
                self.pipeShapeSwitch.isHidden = false
                self.CO2Label.isHidden = false
  
                
                self.widthTextField.isHidden = false
                self.heightTextField.isHidden = false
                self.molecularWeightTextField.isHidden = false
                self.dryBulbTemperatureTextField.isHidden = false
                self.staticPressureTextField.isHidden = false
                self.elevationAboveSeaLevelTextField.isHidden = false
                self.wetBulbTemperatureTextField.isHidden = false
                self.pitotTubeCoeffecientTextField.isHidden = false
                self.pressureAtSeaLevelTextField.isHidden = false
                
                
   
   
            }
            
        case 1:
            {
        
                self.widthUnitLabel.isHidden = true
                self.heightUnitLabel.isHidden = true
                self.dryBulbUnitLabel.isHidden = true
                self.staticPressureUnitLabel.isHidden = true
                self.pressureSeaLevelUnitLabel.isHidden = true
                self.wetBulbUnitLabel.isHidden = true
                
                self.areaUnitLabel.isHidden = false
                self.averageVelocityUnitLabel.isHidden = false
                self.normalAirFlowUnitLabel.isHidden = false
                self.atmosphericPressureUnitLabel.isHidden = false
                self.actualAirFlowUnitLabel.isHidden = false
                self.massAirFlowUnitLabel.isHidden = false
                self.ductPressureUnitLabel.isHidden = false
                self.gasDensityUnitLabel.isHidden = false
                
                self.averageVelocityResultLabel.isHidden = false
                self.areaResultLabel.isHidden = false
                self.normalAirFlowResultLabel.isHidden = false
                self.gasDensityResultLabel.isHidden = false
                self.ductPressureResultLabel.isHidden = false
                self.actualAirFlowResultLabel.isHidden = false
                self.massAirFlowResultLabel.isHidden = false
                self.atmosphericPressureResultLabel.isHidden = false
                self.relativeHumidityResultLabel.isHidden = false
                
                
                
                self.AirCompositionSwitch.isHidden = true
                self.wetBulbSwitch.isHidden = true
                self.pipeShapeSwitch.isHidden = true
                self.CO2Label.isHidden = true
  
                
                self.widthTextField.isHidden = true
                self.heightTextField.isHidden = true
                self.molecularWeightTextField.isHidden = true
                self.dryBulbTemperatureTextField.isHidden = true
                self.staticPressureTextField.isHidden = true
                self.elevationAboveSeaLevelTextField.isHidden = true
                self.wetBulbTemperatureTextField.isHidden = true
                self.pitotTubeCoeffecientTextField.isHidden = true
                self.pressureAtSeaLevelTextField.isHidden = true
                
        }
            
        default:
            break
        }

    }
    
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
        var averageVelocity = Double(averageVelocityResultLabel.text!)
        var normalAirFlow = Double(normalAirFlowResultLabel.text!)
        var massAirFlow = Double(massAirFlowResultLabel.text!)
        var atmosphericPressure = Double(atmosphericPressureResultLabel.text!)
        var actualAirFlow = Double(actualAirFlowResultLabel.text!)
        var gasDensity = Double(gasDensityResultLabel.text!)
        var ductPressure = Double(ductPressureResultLabel.text!)
        
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
            ductPressureUnitLabel.text = "kPa"
            
            if(widthTextField.text?.isEmpty)!{
            }
            else{
                widthTextField.text = String(width! / 0.3048)
            }
            if(heightTextField.text?.isEmpty)!{
            }
            else{
            heightTextField.text = String(height! / 0.3048)
            }
            if(staticPressureTextField.text?.isEmpty)!{
            }
            else{
            staticPressureTextField.text = String(staticPressure! / 0.2952998751)
            }
            if(dryBulbTemperatureTextField.text?.isEmpty)!{
            }
            else{
            dryBulbTemperatureTextField.text = String((dryBulbTemperature! - 32) / 1.8)
            }
            if(wetBulbTemperatureTextField.text?.isEmpty)!{
            }
            else{
            wetBulbTemperatureTextField.text = String((wetBulbTemperature! - 32) / 1.8)
            }
            if(pressureAtSeaLevelTextField.text?.isEmpty)!{
            }
            else{
            pressureAtSeaLevelTextField.text = String(seaLevelPressure! / 0.2952998751)
            }
            if(areaResultLabel.text?.isEmpty)!{
            }
            else{
            areaResultLabel.text = String(width! * 0.3048)
            }
            if(averageVelocityResultLabel.text?.isEmpty)!{
            }
            else{
            averageVelocityResultLabel.text = String(averageVelocity! * 12 / 39.3701)
            }
            if(normalAirFlowResultLabel.text?.isEmpty)!{
            }
            else{
            normalAirFlowResultLabel.text = String(normalAirFlow! * 60 / ((pow(39.3701 / 12,3) * (294.26/273.15))))
            }
            if(atmosphericPressureResultLabel.text?.isEmpty)!{
            }
            else{
            atmosphericPressureResultLabel.text = String(atmosphericPressure! * 0.3048)
            }
            if(massAirFlowResultLabel.text?.isEmpty)!{
            }
            else{
            massAirFlowResultLabel.text = String(massAirFlow! / (2.2046*60))
            }
            if(actualAirFlowResultLabel.text?.isEmpty)!{
            }
            else{
            actualAirFlowResultLabel.text = String(actualAirFlow! * 60 / (pow(39.3701 / 12,3)))
            }
            if(normalAirFlowResultLabel.text?.isEmpty)!{
            }
            else{
            normalAirFlowResultLabel.text = String(normalAirFlow! / 0.3048)
            }
            if(ductPressureResultLabel.text?.isEmpty)!{
            }
            else{
            ductPressureResultLabel.text = String(ductPressure! * 3.38639)
            }
            if(gasDensityResultLabel.text?.isEmpty)!{
            }
            else{
            gasDensityResultLabel.text = String(gasDensity! * 16.018463)
            }
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
            
                  if(widthTextField.text?.isEmpty)!{
            }
            else{
            widthTextField.text = String(width! * 0.3048)
            }
            if(heightTextField.text?.isEmpty)!{
            }
            else{
            heightTextField.text = String(height! * 0.3048)
            }
            if(staticPressureTextField.text?.isEmpty)!{
            }
            else{
            staticPressureTextField.text = String(staticPressure! * 0.2952998751)
            }
            if(dryBulbTemperatureTextField.text?.isEmpty)!{
            }
            else{
            dryBulbTemperatureTextField.text = String((dryBulbTemperature! * 1.8)+32)
            }
            if(wetBulbTemperatureTextField.text?.isEmpty)!{
            }
            else{
            wetBulbTemperatureTextField.text = String((wetBulbTemperature! * 1.8)+32)
            }
            if(pressureAtSeaLevelTextField.text?.isEmpty)!{
            }
            else{
            pressureAtSeaLevelTextField.text = String(seaLevelPressure! * 0.2952998751)
            }
            if(areaResultLabel.text?.isEmpty)!{
            }
            else{
            areaResultLabel.text = String(width! / 0.3048)
            }
            if(averageVelocityResultLabel.text?.isEmpty)!{
            }
            else{
            averageVelocityResultLabel.text = String(averageVelocity! * 39.3701 / 12)
            }
            if(normalAirFlowResultLabel.text?.isEmpty)!{
            }
            else{
            normalAirFlowResultLabel.text = String(normalAirFlow! * ((pow(39.3701 / 12,3) * (294.26/273.15))) / 60)
            }
            if(atmosphericPressureResultLabel.text?.isEmpty)!{
            }
            else{
            atmosphericPressureResultLabel.text = String(atmosphericPressure! / 0.3048)
            }
            if(massAirFlowResultLabel.text?.isEmpty)!{
            }
            else{
            massAirFlowResultLabel.text = String(massAirFlow! * (2.2046*60))
            }
            if(actualAirFlowResultLabel.text?.isEmpty)!{
            }
            else{
            actualAirFlowResultLabel.text = String(actualAirFlow! * (pow(39.3701 / 12,3)) / 60)
            }
            if(normalAirFlowResultLabel.text?.isEmpty)!{
            }
            else{
            normalAirFlowResultLabel.text = String(normalAirFlow! * 60 / ((pow(39.3701 / 12,3) * (294.26/273.15))))
            }
            if(ductPressureResultLabel.text?.isEmpty)!{
            }
            else{
            ductPressureResultLabel.text = String(ductPressure! / 3.38639)
            }
            if(gasDensityResultLabel.text?.isEmpty)!{
            }
            else{
            gasDensityResultLabel.text = String(gasDensity! / 16.018463)
            }
        }
        
    }
    @IBOutlet weak var CO2Label: UILabel!
    
    @IBOutlet weak var H2OLabel: UILabel!
    @IBOutlet weak var ArLabel: UILabel!
    @IBOutlet weak var N2Label: UILabel!
    @IBOutlet weak var O2LAbel: UILabel!
    
    @IBAction func standardAirSwitch(_ sender: Any) {
        if(AirCompositionSwitch.isOn){
            CO2Label.isHidden = true
            CO2TextField.isHidden = true
            O2LAbel.isHidden = true
            O2TextField.isHidden = true
            N2Label.isHidden = true
            N2TextField.isHidden = true
            ArLabel.isHidden = true
            ArTextField.isHidden = true
            H2OLabel.isHidden = true
            H20TextField.isHidden = true
            
            
            CO2TextField.text = "0.03"
            O2TextField.text = "20.81"
            N2TextField.text = "78.09"
            ArTextField.text = "0.93"
            H20TextField.text = "0.00"        }
        else{
            CO2Label.isHidden = false
            CO2TextField.isHidden = false
            O2LAbel.isHidden = false
            O2TextField.isHidden = false
            N2Label.isHidden = false
            N2TextField.isHidden = false
            ArLabel.isHidden = false
            ArTextField.isHidden = false
            H2OLabel.isHidden = false
            H20TextField.isHidden = false
            
            CO2TextField.text = "0.03"
            O2TextField.text = "20.81"
            N2TextField.text = "78.09"
            ArTextField.text = "0.93"
            H20TextField.text = "0.00"
            
            
        }
    }
    
    @IBOutlet weak var wetBulbLabel: UILabel!
    @IBAction func wetBulbEnabled(_ sender: Any) {
        
        if(wetBulbSwitch.isOn){
            
            wetBulbUnitLabel.isHidden = false
            wetBulbTemperatureTextField.isHidden = false
            wetBulbLabel.isHidden = false        }
        else{
            wetBulbUnitLabel.isHidden = true
            wetBulbTemperatureTextField.isHidden = true
            wetBulbLabel.isHidden = true
            
            
        }
        
    }
    
    @IBAction func pipeShape(_ sender: Any) {
        
        if(pipeShapeSwitch.isOn){
            widthUnitLabel.text = "Diameter"
            heightLabel.isHidden = true
            heightTextField.isHidden = true
            heightUnitLabel.isHidden = true
        }
        else{
            widthUnitLabel.text = "Width"
            heightLabel.isHidden = false
            heightTextField.isHidden = false
            heightUnitLabel.isHidden = false
        }
            }
    
    //Dynamic Velocity
    
    
    @IBOutlet weak var dynamicVelocityStepper: UIStepper!
    @IBOutlet weak var dynamicVelocityLabel: UILabel!
    @IBOutlet weak var dynamicVelocityEditText: UITextField!
    
    @IBOutlet weak var heightLabel: UILabel!
    
    
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
        CO2TextField.text="0.03"
        ArTextField.text="20.95"
        N2TextField.text="78.09"
        O2TextField.text="0.93"
        H20TextField.text="0.0"
       
        
            }
    var dynamicPresureArray = [Double]()
    @IBAction func modifyDynamicVelocityList(_ sender: UIStepper) {
        
        
        if(dynamicVelocityStepper.value > oldValue && oldValue >= 0){
            oldValue = oldValue + 1
            dynamicPresureArray.append(Double(dynamicVelocityEditText.text!)!)
            var dynamicPressureArrayString = ""
            for dynamicPressure in dynamicPresureArray {
                dynamicPressureArrayString += String(dynamicPressure) + " "
            }
            dynamicVelocityLabel.text = "DynamicValue" + String(dynamicVelocityStepper.value) + "Old Value" + String(oldValue) + dynamicPressureArrayString        }
        else {
            oldValue = oldValue - 1
            
            dynamicPresureArray.removeLast()
            var dynamicPressureArrayString = ""
            for dynamicPressure in dynamicPresureArray {
                dynamicPressureArrayString += String(dynamicPressure) + " "
            }
            dynamicVelocityLabel.text = "DynamicValue" + String(dynamicVelocityStepper.value) + "Old Value" + String(oldValue) + dynamicPressureArrayString        }
        
    }
    
 
    var oldValue : Double = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dynamicVelocityStepper.wraps = false
        dynamicVelocityStepper.autorepeat = false
        dynamicVelocityStepper.maximumValue = 40
        dynamicVelocityStepper.minimumValue = 0
        oldValue = dynamicVelocityStepper.value
        
        
}
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

    
