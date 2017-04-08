//
//  ViewController.swift
//  Pitonew IOS
//
//  Created by Chris Townsend on 2017-02-25.
//  Copyright © 2017 Chris Townsend. All rights reserved.
//

import UIKit
import Foundation //Generic


class ViewController: UIViewController, UITextFieldDelegate {
    
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
    @IBOutlet weak var normalAirFlowResultLabel: UILabel!
    
    @IBOutlet weak var areaResultLabel: UILabel!
    @IBOutlet weak var gasDensityResultLabel: UILabel!
    @IBOutlet weak var ductPressureResultLabel: UILabel!
    @IBOutlet weak var actualAirFlowResultLabel: UILabel!
    @IBOutlet weak var massAirFlowResultLabel: UILabel!
    @IBOutlet weak var atmosphericPressureResultLabel: UILabel!
    @IBOutlet weak var relativeHumidityResultLabel: UILabel!
    //TextFields
    
    @IBOutlet weak var widthTextField: UITextField!
    //@IBOutlet weak var widthTextField: UITextField!
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
    
    
    //Views
    @IBOutlet weak var Line4: UIView!
    @IBOutlet weak var Line2: UIView!
    @IBOutlet weak var Line13: UIView!
    //Area
    
    @IBOutlet weak var widthTitle: UILabel!
    @IBOutlet weak var velocityAverageTitle: UILabel!
    @IBOutlet weak var normalAirFlowTitle: UILabel!
    @IBOutlet weak var dryBulbTitle: UILabel!
    @IBOutlet weak var atmoshpericPressureTItle: UILabel!
    @IBOutlet weak var massAirFlowTitle: UILabel!
    @IBOutlet weak var actualAirFlowTitle: UILabel!
    @IBOutlet weak var gasDensityTitle: UILabel!
    @IBOutlet weak var dynamicVelocityTitle: UILabel!
    @IBOutlet weak var staticPressureTitle: UILabel!
    @IBOutlet weak var molecularWeightTitle: UILabel!
    @IBOutlet weak var relativeHumidityUnit: UILabel!
    @IBOutlet weak var elevationUnitLabel: UILabel!
    
    @IBOutlet weak var heighTitle: UILabel!
    @IBOutlet weak var ductPressureTitle: UILabel!
    @IBOutlet weak var areaTitle: UILabel!
    @IBOutlet weak var nonStandardAirSwitchTitle: UILabel!
    @IBOutlet weak var wetBulbSwitchTitle: UILabel!
    @IBOutlet weak var seaLevelTitle: UILabel!
    @IBOutlet weak var elevationTitle: UILabel!
    @IBOutlet weak var relativeHumidityTitle: UILabel!
    @IBOutlet weak var pitotTubeTitle: UILabel!
    @IBOutlet weak var molecularWeightResultTitle: UILabel!
    
    @IBOutlet weak var pipeShapeTitle: UILabel!
    
    func average(nums: [Double]) -> Double {
        
        var total = 0.0
        for number in nums{
            total += Double(number)
        }
        let totalNumbers = Double(nums.count)
        var average = total/totalNumbers
        return average
    }
    
    @IBAction func clearButton(_ sender: Any) {
        
        
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
        ArTextField.text="0.93"
        N2TextField.text="78.09"
        O2TextField.text="20.95"
        H20TextField.text="0.0"
        dynamicPresureArray.append(1.0)
        dynamicPresureArray.append(1.0)
        segmentedControl.selectedSegmentIndex = 0
        
        
        self.Line2.isHidden = true
        self.Line4.isHidden = true
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
        //self.pipeShapeSwitch.isHidden = false
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
        self.elevationUnitLabel.isHidden = false
        
        
        self.widthTitle.isHidden = false
        self.velocityAverageTitle.isHidden = true
        self.normalAirFlowTitle.isHidden = true
        self.dryBulbTitle.isHidden = false
        self.atmoshpericPressureTItle.isHidden = true
        self.massAirFlowTitle.isHidden = true
        self.actualAirFlowTitle.isHidden = true
        self.gasDensityTitle.isHidden = true
        self.dynamicVelocityTitle.isHidden = false
        self.ductPressureTitle.isHidden = true
        self.staticPressureTitle.isHidden = false
        self.molecularWeightTitle.isHidden = false
        self.areaTitle.isHidden = true
        self.pipeShapeSwitch.isHidden = false
        self.nonStandardAirSwitchTitle.isHidden = false
        self.wetBulbSwitchTitle.isHidden = false
        self.dryBulbTitle.isHidden = false
        self.seaLevelTitle.isHidden = false
        self.elevationTitle.isHidden = false
        self.relativeHumidityTitle.isHidden = true
        self.pitotTubeTitle.isHidden = false
        self.pipeShapeTitle.isHidden = false
        self.wetBulbLabel.isHidden = false
        self.relativeHumidityUnit.isHidden = true
        self.elevationUnitLabel.isHidden = false
        self.heighTitle.isHidden = false
        self.dynamicVelocityStepper.isHidden = false
        self.dynamicVelocityLabel.isHidden = false
        self.dynamicVelocityEditText.isHidden = false
        self.CO2Label.isHidden = false
        self.H2OLabel.isHidden = false
        self.ArLabel.isHidden = false
        self.N2Label.isHidden = false
        self.O2LAbel.isHidden = false
        self.molecularWeightResultTitle.isHidden = true
        self.CO2TextField.isHidden = false
        self.ArTextField.isHidden = false
        self.N2TextField.isHidden = false
        self.H20TextField.isHidden = false
        self.O2TextField.isHidden = false
        
           }
    
    
    @IBAction func calculateButton(_ sender: Any) {
        
        if((widthTextField.text?.isEmpty)! || (heightTextField.text?.isEmpty)! || (pitotTubeCoeffecientTextField.text?.isEmpty)! || (staticPressureTextField.text?.isEmpty)! || (dryBulbTemperatureTextField.text?.isEmpty)! || (elevationAboveSeaLevelTextField.text?.isEmpty)! || (wetBulbTemperatureTextField.text?.isEmpty)! || (pressureAtSeaLevelTextField.text?.isEmpty)!) //|| (molecularWeightTextField.text?.isEmpty)!) || (CO2TextField.text?.isEmpty)! || (O2TextField.text?.isEmpty)! || (N2TextField.text?.isEmpty)! || (ArTextField.text?.isEmpty)! || (H20TextField.text?.isEmpty)!)
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
            let area: Double
            let atmosphericPressure: Double
            let ductPressure: Double
            let gasDensity: Double
            
            var dynamicVelocityArray = [Double]()
            
            let averageVelocity: Double
            let actualAirFlow: Double
            let massAirFlow: Double
            let normalAirFlow: Double
            
            
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
            
            
            if(pipeShapeSwitch.isOn){
                area = Double.pi * pow(height! / 2, 2.0)
            }
            else{
                area = width!*height!
            }
            
            atmosphericPressure = seaLevelPressure!*pow(10, -0.00001696*elevationAboveSealevel!)
            if(UnitSwitch.isOn){
			             ductPressure = atmosphericPressure + staticPressure!*0.249088
                
            }
            else{
			             ductPressure = atmosphericPressure + staticPressure!*0.07355
                
            }
            
            if(UnitSwitch.isOn){
                gasDensity = 1000 * ductPressure / (273.15 + dryBulbTemperature!) / (8314.3 / molecularWeight!)
                
            }
            else{
                
                var part1 = ((dryBulbTemperature!-32)*(5/9))
                var part2 = (ductPressure*3.386375)
                gasDensity = 0.062428*(1000 * part2 / (273.15 +  part1 / (8314.3 / molecularWeight!)))
            }
            
            if(UnitSwitch.isOn){
                for item in dynamicPressureArray {
                    dynamicVelocityArray.append(pilotTubeCoeffecient!*pow(2*item*1000/4.01864/gasDensity,0.5))
                }
            }
            else{
                for item in dynamicPressureArray {
                    
                    dynamicVelocityArray.append(pilotTubeCoeffecient!*pow(2*item*1000/4.01864/(gasDensity / 0.062428),0.5) * 3.2804)
                }
            }
            averageVelocity = average(nums: dynamicVelocityArray)
            if(UnitSwitch.isOn){
                actualAirFlow = averageVelocity*area*3600
                
            }
            else{
                actualAirFlow = ((averageVelocity*0.3048)*(area*0.00064516)*3600)*pow((39.3701/12),3)/60
            }
            if(UnitSwitch.isOn){
                massAirFlow=actualAirFlow*gasDensity/3600
                
            }
            else{
                massAirFlow=(actualAirFlow*60/pow((39.3701/12),3)*(gasDensity/0.062428)/3600)*2.2046*60
            }
            if(UnitSwitch.isOn){
                normalAirFlow = (actualAirFlow*ductPressure/101.325)*273.15/(273.15+((dryBulbTemperature!-32)/1.8))
                
            }
            else{
                normalAirFlow=(actualAirFlow*60/(pow(39.3701/12,3))*(ductPressure/0.2953)/101.325)*273.15/(273.15+dryBulbTemperature!)/60*pow((39.3701/12),3)*(294.26/273.15);
                
            }
            
            
            
            
            
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
            
            self.Line2.isHidden = false
            self.Line4.isHidden = false
            self.widthUnitLabel.isHidden = false
            self.heighTitle.isHidden = true
            self.wetBulbLabel.isHidden = true
            self.elevationUnitLabel.isHidden = true
            self.molecularWeightResultTitle.isHidden = false
            self.widthUnitLabel.isHidden = true
            self.heightUnitLabel.isHidden = true
            self.dryBulbUnitLabel.isHidden = true
            self.staticPressureUnitLabel.isHidden = true
            self.pressureSeaLevelUnitLabel.isHidden = true
            self.wetBulbUnitLabel.isHidden = true
            self.relativeHumidityUnit.isHidden = false
            self.areaUnitLabel.isHidden = false
            self.averageVelocityUnitLabel.isHidden = false
            self.normalAirFlowUnitLabel.isHidden = false
            self.atmosphericPressureUnitLabel.isHidden = false
            self.actualAirFlowUnitLabel.isHidden = false
            self.massAirFlowUnitLabel.isHidden = false
            self.ductPressureUnitLabel.isHidden = false
            self.gasDensityUnitLabel.isHidden = false
            self.molecularWeightTitle.isHidden = true
            self.elevationUnitLabel.isHidden = true
            
            self.averageVelocityResultLabel.isHidden = false
            self.areaResultLabel.isHidden = false
            self.normalAirFlowResultLabel.isHidden = false
            self.gasDensityResultLabel.isHidden = false
            self.ductPressureResultLabel.isHidden = false
            self.actualAirFlowResultLabel.isHidden = false
            self.massAirFlowResultLabel.isHidden = false
            self.atmosphericPressureResultLabel.isHidden = false
            self.relativeHumidityResultLabel.isHidden = false
            
            
            
            self.CO2TextField.isHidden = true
            self.ArTextField.isHidden = true
            self.N2TextField.isHidden = true
            self.H20TextField.isHidden = true
            self.O2TextField.isHidden = true
            
            self.AirCompositionSwitch.isHidden = true
            self.wetBulbSwitch.isHidden = true
            //     self.pipeShapeSwitch.isHidden = true
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
            
            self.widthTitle.isHidden = true
            self.velocityAverageTitle.isHidden = false
            self.normalAirFlowTitle.isHidden = false
            self.dryBulbTitle.isHidden = true
            self.atmoshpericPressureTItle.isHidden = false
            self.massAirFlowTitle.isHidden = false
            self.actualAirFlowTitle.isHidden = false
            self.gasDensityTitle.isHidden = false
            self.dynamicVelocityTitle.isHidden = true
            self.ductPressureTitle.isHidden = false
            
            self.staticPressureTitle.isHidden = true
            
            
            self.areaTitle.isHidden = false
            self.pipeShapeSwitch.isHidden = true
            self.nonStandardAirSwitchTitle.isHidden = true
            self.wetBulbSwitchTitle.isHidden = true
            self.dryBulbTitle.isHidden = true
            self.seaLevelTitle.isHidden = true
            self.elevationTitle.isHidden = true
            self.relativeHumidityTitle.isHidden = false
            self.pitotTubeTitle.isHidden = true
            self.pipeShapeTitle.isHidden = true
            self.dynamicVelocityStepper.isHidden = true
            self.dynamicVelocityLabel.isHidden = true
            self.dynamicVelocityEditText.isHidden = true
            self.CO2Label.isHidden = true
            self.H2OLabel.isHidden = true
            self.ArLabel.isHidden = true
            self.N2Label.isHidden = true
            self.O2LAbel.isHidden = true
            self.dynamicVelocityResult.isHidden = false
            self.dynamicVelocityResultTitle.isHidden = false
            segmentedControl.selectedSegmentIndex = 1
            
            
            
            
            
        }
        
        
    }
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    @IBAction func segmentedControlindexChange(_ sender: Any) {
        
        switch segmentedControl.selectedSegmentIndex {
        case 0:
            
            self.widthUnitLabel.isHidden = false
            self.heightUnitLabel.isHidden = false
            self.dryBulbUnitLabel.isHidden = false
            self.staticPressureUnitLabel.isHidden = false
            self.pressureSeaLevelUnitLabel.isHidden = false
            self.wetBulbUnitLabel.isHidden = false
            self.Line2.isHidden = true
            self.Line4.isHidden = true
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
            //self.pipeShapeSwitch.isHidden = false
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
            self.elevationUnitLabel.isHidden = false
            
            
            self.widthTitle.isHidden = false
            self.velocityAverageTitle.isHidden = true
            self.normalAirFlowTitle.isHidden = true
            self.dryBulbTitle.isHidden = false
            self.atmoshpericPressureTItle.isHidden = true
            self.massAirFlowTitle.isHidden = true
            self.actualAirFlowTitle.isHidden = true
            self.gasDensityTitle.isHidden = true
            self.dynamicVelocityTitle.isHidden = false
            self.ductPressureTitle.isHidden = true
            self.staticPressureTitle.isHidden = false
            self.molecularWeightTitle.isHidden = false
            self.areaTitle.isHidden = true
            self.pipeShapeSwitch.isHidden = false
            self.nonStandardAirSwitchTitle.isHidden = false
            self.wetBulbSwitchTitle.isHidden = false
            self.dryBulbTitle.isHidden = false
            self.seaLevelTitle.isHidden = false
            self.elevationTitle.isHidden = false
            self.relativeHumidityTitle.isHidden = true
            self.pitotTubeTitle.isHidden = false
            self.pipeShapeTitle.isHidden = false
            self.wetBulbLabel.isHidden = false
            self.relativeHumidityUnit.isHidden = true
            self.elevationUnitLabel.isHidden = false
            self.heighTitle.isHidden = false
            self.dynamicVelocityStepper.isHidden = false
            self.dynamicVelocityLabel.isHidden = false
            self.dynamicVelocityEditText.isHidden = false
            self.CO2Label.isHidden = false
            self.H2OLabel.isHidden = false
            self.ArLabel.isHidden = false
            self.N2Label.isHidden = false
            self.O2LAbel.isHidden = false
            self.molecularWeightResultTitle.isHidden = true
            self.CO2TextField.isHidden = false
            self.ArTextField.isHidden = false
            self.N2TextField.isHidden = false
            self.H20TextField.isHidden = false
            self.O2TextField.isHidden = false
            self.dynamicVelocityResult.isHidden = true
            self.dynamicVelocityResultTitle.isHidden = true
            
            
            
            
            
            
            
            
        case 1:
            self.heighTitle.isHidden = true
            self.wetBulbLabel.isHidden = true
            self.elevationUnitLabel.isHidden = true
            self.molecularWeightResultTitle.isHidden = false
            self.widthUnitLabel.isHidden = true
            self.heightUnitLabel.isHidden = true
            self.dryBulbUnitLabel.isHidden = true
            self.staticPressureUnitLabel.isHidden = true
            self.pressureSeaLevelUnitLabel.isHidden = true
            self.wetBulbUnitLabel.isHidden = true
            self.relativeHumidityUnit.isHidden = false
            self.areaUnitLabel.isHidden = false
            self.averageVelocityUnitLabel.isHidden = false
            self.normalAirFlowUnitLabel.isHidden = false
            self.atmosphericPressureUnitLabel.isHidden = false
            self.actualAirFlowUnitLabel.isHidden = false
            self.massAirFlowUnitLabel.isHidden = false
            self.ductPressureUnitLabel.isHidden = false
            self.gasDensityUnitLabel.isHidden = false
            self.molecularWeightTitle.isHidden = true
            self.elevationUnitLabel.isHidden = true
            
            self.averageVelocityResultLabel.isHidden = false
            self.areaResultLabel.isHidden = false
            self.normalAirFlowResultLabel.isHidden = false
            self.gasDensityResultLabel.isHidden = false
            self.ductPressureResultLabel.isHidden = false
            self.actualAirFlowResultLabel.isHidden = false
            self.massAirFlowResultLabel.isHidden = false
            self.atmosphericPressureResultLabel.isHidden = false
            self.relativeHumidityResultLabel.isHidden = false
            self.Line2.isHidden = false
            self.Line4.isHidden = false
            
            
            self.CO2TextField.isHidden = true
            self.ArTextField.isHidden = true
            self.N2TextField.isHidden = true
            self.H20TextField.isHidden = true
            self.O2TextField.isHidden = true
            
            self.AirCompositionSwitch.isHidden = true
            self.wetBulbSwitch.isHidden = true
            //     self.pipeShapeSwitch.isHidden = true
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
            
            self.widthTitle.isHidden = true
            self.velocityAverageTitle.isHidden = false
            self.normalAirFlowTitle.isHidden = false
            self.dryBulbTitle.isHidden = true
            self.atmoshpericPressureTItle.isHidden = false
            self.massAirFlowTitle.isHidden = false
            self.actualAirFlowTitle.isHidden = false
            self.gasDensityTitle.isHidden = false
            self.dynamicVelocityTitle.isHidden = true
            self.ductPressureTitle.isHidden = false
            
            self.staticPressureTitle.isHidden = true
            
            
            self.areaTitle.isHidden = false
            self.pipeShapeSwitch.isHidden = true
            self.nonStandardAirSwitchTitle.isHidden = true
            self.wetBulbSwitchTitle.isHidden = true
            self.dryBulbTitle.isHidden = true
            self.seaLevelTitle.isHidden = true
            self.elevationTitle.isHidden = true
            self.relativeHumidityTitle.isHidden = false
            self.pitotTubeTitle.isHidden = true
            self.pipeShapeTitle.isHidden = true
            self.dynamicVelocityStepper.isHidden = true
            self.dynamicVelocityLabel.isHidden = true
            self.dynamicVelocityEditText.isHidden = true
            self.CO2Label.isHidden = true
            self.H2OLabel.isHidden = true
            self.ArLabel.isHidden = true
            self.N2Label.isHidden = true
            self.O2LAbel.isHidden = true
            self.dynamicVelocityResult.isHidden = false
            self.dynamicVelocityResultTitle.isHidden = false
            
            
            
            
            
            
            
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
        var area = Double(areaResultLabel.text!)
        
        
        
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
            gasDensityUnitLabel.text = "kg/m^3"
            
            if(widthTextField.text?.isEmpty)!{
            }
            else{
                widthTextField.text = numberFourDigitsFomatter.string(from: (width! / 0.3048) as NSNumber)
                
            }
            if(heightTextField.text?.isEmpty)!{
            }
            else{
                heightTextField.text = numberFourDigitsFomatter.string(from: (height! / 0.3048) as NSNumber)
            }
            if(staticPressureTextField.text?.isEmpty)!{
            }
            else{
                
                staticPressureTextField.text = numberTwoDigitsFomatter.string(from: (staticPressure!/0.2952998751) as NSNumber)
                
                
            }
            if(dryBulbTemperatureTextField.text?.isEmpty)!{
            }
            else{
                
                dryBulbTemperatureTextField.text = numberTwoDigitsFomatter.string(from: ((dryBulbTemperature! - 32) / 1.8) as NSNumber)
            }
            if(wetBulbTemperatureTextField.text?.isEmpty)!{
            }
            else{
                wetBulbTemperatureTextField.text = numberTwoDigitsFomatter.string(from: ((wetBulbTemperature! - 32) / 1.8) as NSNumber)
            }
            if(pressureAtSeaLevelTextField.text?.isEmpty)!{
            }
            else{
                pressureAtSeaLevelTextField.text = numberTwoDigitsFomatter.string(from: (seaLevelPressure! / 0.2952998751) as NSNumber)
            }
            if(areaResultLabel.text?.isEmpty)!{
            }
            else{
              //  areaResultLabel.text =  numberThreeDigitsFomatter.string(from: (area! * 0.00064516) as NSNumber)
                
            }
            if(averageVelocityResultLabel.text?.isEmpty)!{
            }
            else{
                averageVelocityResultLabel.text = numberTwoDigitsFomatter.string(from: (averageVelocity! * 12 / 39.3701) as NSNumber)
                
            }
            if(normalAirFlowResultLabel.text?.isEmpty)!{
            }
            else{
                normalAirFlowResultLabel.text = String(Int(normalAirFlow! * 60 / ((pow(39.3701 / 12,3) * (294.26/273.15)))))
            }
            if(atmosphericPressureResultLabel.text?.isEmpty)!{
            }
            else{
                atmosphericPressureResultLabel.text = numberTwoDigitsFomatter.string(from: (atmosphericPressure! * 0.3048) as NSNumber)
                
            }
            if(massAirFlowResultLabel.text?.isEmpty)!{
            }
            else{
                massAirFlowResultLabel.text = numberTwoDigitsFomatter.string(from: (massAirFlow! / (2.2046*60)) as NSNumber)
                
            }
            if(actualAirFlowResultLabel.text?.isEmpty)!{
            }
            else{
                
                
                actualAirFlowResultLabel.text = String(Int(actualAirFlow! * 60 / (pow(39.3701 / 12,3))))
            }
            
            if(ductPressureResultLabel.text?.isEmpty)!{
            }
            else{
                ductPressureResultLabel.text = numberTwoDigitsFomatter.string(from: (ductPressure! * 3.38639) as NSNumber)
                
            }
            if(gasDensityResultLabel.text?.isEmpty)!{
            }
            else{
                gasDensityResultLabel.text = numberFourDigitsFomatter.string(from: (gasDensity! * 16.018463) as NSNumber)
                
            }
        }
        else{
            widthUnitLabel.text = "in"
            heightUnitLabel.text = "in"
            dryBulbUnitLabel.text = "°F"
            staticPressureUnitLabel.text = "in Hg"
            wetBulbUnitLabel.text = "°F"
            pressureSeaLevelUnitLabel.text = "in Hg"
            areaUnitLabel.text = "inch^2"
            averageVelocityUnitLabel.text = "ft/s"
            normalAirFlowUnitLabel.text = "SCFM"
            atmosphericPressureUnitLabel.text = "in Hg"
            massAirFlowUnitLabel.text = "lb/min"
            actualAirFlowUnitLabel.text = "ACFM"
            normalAirFlowUnitLabel.text = "SCFM"
            gasDensityUnitLabel.text = "lb/cu. ft."            
            if(widthTextField.text?.isEmpty)!{
            }
            else{
                widthTextField.text = numberThreeDigitsFomatter.string(from: (width! * 0.3048) as NSNumber)
            }
            if(heightTextField.text?.isEmpty)!{
            }
            else{
                heightTextField.text = numberThreeDigitsFomatter.string(from: (height! * 0.3048) as NSNumber)
            }
            if(staticPressureTextField.text?.isEmpty)!{
            }
            else{
                staticPressureTextField.text = numberTwoDigitsFomatter.string(from: (staticPressure! * 0.2952998751) as NSNumber)
                
            }
            if(dryBulbTemperatureTextField.text?.isEmpty)!{
            }
            else{
                dryBulbTemperatureTextField.text = numberTwoDigitsFomatter.string(from: ((dryBulbTemperature! * 1.8)+32) as NSNumber)
                
            }
            if(wetBulbTemperatureTextField.text?.isEmpty)!{
            }
            else{
                wetBulbTemperatureTextField.text = numberTwoDigitsFomatter.string(from: ((wetBulbTemperature! * 1.8)+32) as NSNumber)
                
            }
            if(pressureAtSeaLevelTextField.text?.isEmpty)!{
            }
            else{
                pressureAtSeaLevelTextField.text = numberTwoDigitsFomatter.string(from: (seaLevelPressure! * 0.2952998751) as NSNumber)
                
            }
            if(areaResultLabel.text?.isEmpty)!{
            }
            else{
        //        areaResultLabel.text =  numberThreeDigitsFomatter.string(from: (area! / 0.00064516) as NSNumber)
                
            }
            if(averageVelocityResultLabel.text?.isEmpty)!{
            }
            else{
                averageVelocityResultLabel.text = numberTwoDigitsFomatter.string(from: (averageVelocity! * 39.3701 / 12) as NSNumber)
                
            }
            if(normalAirFlowResultLabel.text?.isEmpty)!{
            }
            else{
                
                normalAirFlowResultLabel.text = String(Int(normalAirFlow! * ((pow(39.3701 / 12,3) * (294.26/273.15))) / 60))
            }
            if(atmosphericPressureResultLabel.text?.isEmpty)!{
            }
            else{
                atmosphericPressureResultLabel.text = numberTwoDigitsFomatter.string(from: (atmosphericPressure! / 0.3048) as NSNumber)
                
            }
            if(massAirFlowResultLabel.text?.isEmpty)!{
            }
            else{
                massAirFlowResultLabel.text = numberTwoDigitsFomatter.string(from: (massAirFlow! * (2.2046*60)) as NSNumber)
                
            }
            if(actualAirFlowResultLabel.text?.isEmpty)!{
            }
            else{
                
                actualAirFlowResultLabel.text = String(Int(actualAirFlow! * (pow(39.3701 / 12,3)) / 60))
            }
            
            if(ductPressureResultLabel.text?.isEmpty)!{
            }
            else{
                ductPressureResultLabel.text = numberTwoDigitsFomatter.string(from: (ductPressure! / 3.38639) as NSNumber)
                
            }
            if(gasDensityResultLabel.text?.isEmpty)!{
            }
            else{
                gasDensityResultLabel.text = numberFourDigitsFomatter.string(from: (gasDensity! / 16.018463) as NSNumber)
            }
        }
        
    }
    @IBOutlet weak var CO2Label: UILabel!
    
    @IBOutlet weak var H2OLabel: UILabel!
    @IBOutlet weak var ArLabel: UILabel!
    @IBOutlet weak var N2Label: UILabel!
    @IBOutlet weak var O2LAbel: UILabel!
    
    @IBAction func standardAirSwitch(_ sender: Any) {
      
        
            adjustPosition()
                
       }
    
    @IBOutlet weak var wetBulbLabel: UILabel!
    @IBAction func wetBulbEnabled(_ sender: Any) {
        adjustPosition()
        
        
     
    }
    func adjustPosition(){
        if(wetBulbSwitch.isOn && pipeShapeSwitch.isOn && AirCompositionSwitch.isOn ){
            
            wetBulbUnitLabel.isHidden = false
            wetBulbTemperatureTextField.isHidden = false
            wetBulbLabel.isHidden = false
            
            heighTitle.text = "Diameter"
            widthTitle.isHidden = true
            widthTextField.isHidden = true
            widthUnitLabel.isHidden = true
            var frame = CGRect()
            frame = wetBulbLabel.frame
            frame.origin.y = 539
            wetBulbLabel.frame = frame
            frame = wetBulbTemperatureTextField.frame
            frame.origin.y = 539
            wetBulbTemperatureTextField.frame = frame
            frame = wetBulbUnitLabel.frame
            frame.origin.y = 539
            wetBulbUnitLabel.frame = frame
            
            
            frame = Divider2.frame
            frame.origin.y = 576
            Divider2.frame = frame
            

            frame = dynamicVelocityTitle.frame
            frame.origin.y = 585
            dynamicVelocityTitle.frame = frame
            frame = dynamicVelocityEditText.frame
            frame.origin.y = 622
            dynamicVelocityEditText.frame = frame
            frame = dynamicVelocityStepper.frame
            frame.origin.y = 622
            dynamicVelocityStepper.frame = frame
            frame = dynamicVelocityLabel.frame
            frame.origin.y = 652
            dynamicVelocityLabel.frame = frame
            
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
            H20TextField.text = "0.00"

            
        }
        else if(wetBulbSwitch.isOn && pipeShapeSwitch.isOn && !AirCompositionSwitch.isOn ){
            wetBulbUnitLabel.isHidden = false
            wetBulbTemperatureTextField.isHidden = false
            wetBulbLabel.isHidden = false
            
            
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
            
            CO2TextField.text = ""
            O2TextField.text = ""
            N2TextField.text = ""
            ArTextField.text = ""
            H20TextField.text = ""

            
            heighTitle.text = "Diameter"
            widthTitle.isHidden = true
            widthTextField.isHidden = true
            widthUnitLabel.isHidden = true
            
            var frame = CGRect()
            frame = wetBulbLabel.frame
            frame.origin.y = 539
            wetBulbLabel.frame = frame
            frame = wetBulbTemperatureTextField.frame
            frame.origin.y = 539
            wetBulbTemperatureTextField.frame = frame
            frame = wetBulbUnitLabel.frame
            frame.origin.y = 539
            wetBulbUnitLabel.frame = frame
            
            
            frame = Divider1.frame
            frame.origin.y = 576
            Divider1.frame = frame
            
            frame = CO2Label.frame
            frame.origin.y = 585
            CO2Label.frame = frame
            
            frame = CO2TextField.frame
            frame.origin.y = 585
            CO2TextField.frame = frame
            
            frame = O2LAbel.frame
            frame.origin.y = 620
            O2LAbel.frame = frame
            
            frame = O2TextField.frame
            frame.origin.y = 620
            O2TextField.frame = frame
            
            
            
            frame = N2Label.frame
            frame.origin.y = 655
            N2Label.frame = frame
            
            frame = N2TextField.frame
            frame.origin.y = 655
            N2TextField.frame = frame
            
            frame = ArLabel.frame
            frame.origin.y = 690
            ArLabel.frame = frame
            
            frame = ArTextField.frame
            frame.origin.y = 690
            ArTextField.frame = frame
            
            frame = H2OLabel.frame
            frame.origin.y = 725
            H2OLabel.frame = frame
            
            frame = H20TextField.frame
            frame.origin.y = 725
            H20TextField.frame = frame
            
            
            frame = Divider2.frame
            frame.origin.y = 764
            Divider2.frame = frame
            

            
            frame = dynamicVelocityTitle.frame
            frame.origin.y = 773
            dynamicVelocityTitle.frame = frame
            frame = dynamicVelocityEditText.frame
            frame.origin.y = 810
            dynamicVelocityEditText.frame = frame
            frame = dynamicVelocityStepper.frame
            frame.origin.y = 810
            dynamicVelocityStepper.frame = frame
            frame = dynamicVelocityLabel.frame
            frame.origin.y = 840
            dynamicVelocityLabel.frame = frame
            
        }
            
        else if(wetBulbSwitch.isOn && !pipeShapeSwitch.isOn && AirCompositionSwitch.isOn){
            var frame = CGRect()
            frame = wetBulbLabel.frame
            frame.origin.y = 585
            wetBulbLabel.frame = frame
            frame = wetBulbTemperatureTextField.frame
            frame.origin.y = 585
            wetBulbTemperatureTextField.frame = frame
            frame = wetBulbUnitLabel.frame
            frame.origin.y = 585
            wetBulbUnitLabel.frame = frame
            
            
            heighTitle.text = "Height"
            widthTitle.isHidden = false
            widthTextField.isHidden = false
            widthUnitLabel.isHidden = false
            
            wetBulbUnitLabel.isHidden = false
            wetBulbTemperatureTextField.isHidden = false
            wetBulbLabel.isHidden = false
            
            frame = Divider2.frame
            frame.origin.y = 622
            Divider2.frame = frame
            

            
            frame = dynamicVelocityTitle.frame
            frame.origin.y = 631
            dynamicVelocityTitle.frame = frame
            frame = dynamicVelocityEditText.frame
            frame.origin.y = 667
            dynamicVelocityEditText.frame = frame
            frame = dynamicVelocityStepper.frame
            frame.origin.y = 667
            dynamicVelocityStepper.frame = frame
            frame = dynamicVelocityLabel.frame
            frame.origin.y = 697
            dynamicVelocityLabel.frame = frame
            
            
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
            H20TextField.text = "0.00"

        }
            
        else if(wetBulbSwitch.isOn && !pipeShapeSwitch.isOn && !AirCompositionSwitch.isOn){
            var frame = CGRect()
            frame = wetBulbLabel.frame
            frame.origin.y = 585
            wetBulbLabel.frame = frame
            frame = wetBulbTemperatureTextField.frame
            frame.origin.y = 585
            wetBulbTemperatureTextField.frame = frame
            frame = wetBulbUnitLabel.frame
            frame.origin.y = 585
            wetBulbUnitLabel.frame = frame
            
            wetBulbUnitLabel.isHidden = false
            wetBulbTemperatureTextField.isHidden = false
            wetBulbLabel.isHidden = false
            heighTitle.text = "Height"
            widthTitle.isHidden = false
            widthTextField.isHidden = false
            widthUnitLabel.isHidden = false
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
            
            CO2TextField.text = ""
            O2TextField.text = ""
            N2TextField.text = ""
            ArTextField.text = ""
            H20TextField.text = ""

            
            
            frame = Divider1.frame
            frame.origin.y = 622
            Divider1.frame = frame

            
            frame = CO2Label.frame
            frame.origin.y = 631
            CO2Label.frame = frame
            
            frame = CO2TextField.frame
            frame.origin.y = 631
            CO2TextField.frame = frame
            
            frame = O2LAbel.frame
            frame.origin.y = 666
            O2LAbel.frame = frame
            
            frame = O2TextField.frame
            frame.origin.y = 666
            O2TextField.frame = frame
            
            
            
            frame = N2Label.frame
            frame.origin.y = 701
            N2Label.frame = frame
            
            frame = N2TextField.frame
            frame.origin.y = 701
            N2TextField.frame = frame
            
            frame = ArLabel.frame
            frame.origin.y = 736
            ArLabel.frame = frame
            
            frame = ArTextField.frame
            frame.origin.y = 736
            ArTextField.frame = frame
            
            frame = H2OLabel.frame
            frame.origin.y = 771
            H2OLabel.frame = frame
            
            frame = H20TextField.frame
            frame.origin.y = 771
            H20TextField.frame = frame
            
            
            frame = Divider2.frame
            frame.origin.y = 810
            Divider2.frame = frame
            

            frame = dynamicVelocityTitle.frame
            frame.origin.y = 819
            dynamicVelocityTitle.frame = frame
            frame = dynamicVelocityEditText.frame
            frame.origin.y = 856
            dynamicVelocityEditText.frame = frame
            frame = dynamicVelocityStepper.frame
            frame.origin.y = 856
            dynamicVelocityStepper.frame = frame
            frame = dynamicVelocityLabel.frame
            frame.origin.y = 886
            dynamicVelocityLabel.frame = frame
        }
            
            
        else if(!wetBulbSwitch.isOn && !pipeShapeSwitch.isOn && AirCompositionSwitch.isOn){
            var frame = CGRect()
            wetBulbUnitLabel.isHidden = true
            wetBulbTemperatureTextField.isHidden = true
            wetBulbLabel.isHidden = true
            
            
            frame = Divider2.frame
            frame.origin.y = 576
            Divider2.frame = frame
            

            frame = dynamicVelocityTitle.frame
            frame.origin.y = 585
            dynamicVelocityTitle.frame = frame
            frame = dynamicVelocityEditText.frame
            frame.origin.y = 622
            dynamicVelocityEditText.frame = frame
            frame = dynamicVelocityStepper.frame
            frame.origin.y = 622
            dynamicVelocityStepper.frame = frame
            frame = dynamicVelocityLabel.frame
            frame.origin.y = 652
            dynamicVelocityLabel.frame = frame
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
            H20TextField.text = "0.00"
            heighTitle.text = "Height"
            widthTitle.isHidden = false
            widthTextField.isHidden = false
            widthUnitLabel.isHidden = false
            
        }
        else if(!wetBulbSwitch.isOn && !pipeShapeSwitch.isOn && !AirCompositionSwitch.isOn){
            
            heighTitle.text = "Height"
            widthTitle.isHidden = false
            widthTextField.isHidden = false
            widthUnitLabel.isHidden = false
            wetBulbUnitLabel.isHidden = true
            wetBulbTemperatureTextField.isHidden = true
            wetBulbLabel.isHidden = true
            
            
            
            
            var frame = CGRect()
            
            Divider1.isHidden = false
            frame = Divider1.frame
            frame.origin.y = 576
            Divider1.frame = frame
            
            frame = CO2Label.frame
            frame.origin.y = 585
            CO2Label.frame = frame
            
            frame = CO2TextField.frame
            frame.origin.y = 585
            CO2TextField.frame = frame
            
            frame = O2LAbel.frame
            frame.origin.y = 620
            O2LAbel.frame = frame
            
            frame = O2TextField.frame
            frame.origin.y = 620
            O2TextField.frame = frame
            
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
            
            CO2TextField.text = ""
            O2TextField.text = ""
            N2TextField.text = ""
            ArTextField.text = ""
            H20TextField.text = ""

            
            
            frame = N2Label.frame
            frame.origin.y = 655
            N2Label.frame = frame
            
            frame = N2TextField.frame
            frame.origin.y = 655
            N2TextField.frame = frame
            
            frame = ArLabel.frame
            frame.origin.y = 690
            ArLabel.frame = frame
            
            frame = ArTextField.frame
            frame.origin.y = 690
            ArTextField.frame = frame
            
            frame = H2OLabel.frame
            frame.origin.y = 725
            H2OLabel.frame = frame
            
            frame = H20TextField.frame
            frame.origin.y = 725
            H20TextField.frame = frame
            
            frame = Divider2.frame
            frame.origin.y = 764
            Divider2.frame = frame
            
            
            frame = dynamicVelocityTitle.frame
            frame.origin.y = 773
            dynamicVelocityTitle.frame = frame
            frame = dynamicVelocityEditText.frame
            frame.origin.y = 810
            dynamicVelocityEditText.frame = frame
            frame = dynamicVelocityStepper.frame
            frame.origin.y = 810
            dynamicVelocityStepper.frame = frame
            frame = dynamicVelocityLabel.frame
            frame.origin.y = 840
            dynamicVelocityLabel.frame = frame
            
            
            
            
            
            
        }
            
            
        else if(!wetBulbSwitch.isOn && pipeShapeSwitch.isOn && AirCompositionSwitch.isOn){
            var frame = CGRect()
            
            wetBulbUnitLabel.isHidden = true
            wetBulbTemperatureTextField.isHidden = true
            wetBulbLabel.isHidden = true
            heighTitle.text = "Diameter"
            widthTitle.isHidden = true
            widthTextField.isHidden = true
            widthUnitLabel.isHidden = true
            
            frame = Divider2.frame
            frame.origin.y = 530
            Divider2.frame = frame
            

            frame = dynamicVelocityTitle.frame
            frame.origin.y = 539
            dynamicVelocityTitle.frame = frame
            frame = dynamicVelocityEditText.frame
            frame.origin.y = 575
            dynamicVelocityEditText.frame = frame
            frame = dynamicVelocityStepper.frame
            frame.origin.y = 575
            dynamicVelocityStepper.frame = frame
            frame = dynamicVelocityLabel.frame
            frame.origin.y = 605
            dynamicVelocityLabel.frame = frame
            
            
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
            H20TextField.text = "0.00"

            
            
        }
            
        else if(!wetBulbSwitch.isOn && pipeShapeSwitch.isOn && !AirCompositionSwitch.isOn){
            var frame = CGRect()
            
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
            
            CO2TextField.text = ""
            O2TextField.text = ""
            N2TextField.text = ""
            ArTextField.text = ""
            H20TextField.text = ""

            
            heighTitle.text = "Diameter"
            widthTitle.isHidden = true
            widthTextField.isHidden = true
            widthUnitLabel.isHidden = true
            
            wetBulbUnitLabel.isHidden = true
            wetBulbTemperatureTextField.isHidden = true
            wetBulbLabel.isHidden = true
            
            
            frame = Divider1.frame
            frame.origin.y = 530
            Divider1.frame = frame

            frame = CO2Label.frame
            frame.origin.y = 539
            CO2Label.frame = frame
            
            frame = CO2TextField.frame
            frame.origin.y = 539
            CO2TextField.frame = frame
            
            frame = O2LAbel.frame
            frame.origin.y = 574
            O2LAbel.frame = frame
            
            frame = O2TextField.frame
            frame.origin.y = 574
            O2TextField.frame = frame
            
            
            
            frame = N2Label.frame
            frame.origin.y = 609
            N2Label.frame = frame
            
            frame = N2TextField.frame
            frame.origin.y = 609
            N2TextField.frame = frame
            
            frame = ArLabel.frame
            frame.origin.y = 644
            ArLabel.frame = frame
            
            frame = ArTextField.frame
            frame.origin.y = 644
            ArTextField.frame = frame
            
            frame = H2OLabel.frame
            frame.origin.y = 679
            H2OLabel.frame = frame
            
            frame = H20TextField.frame
            frame.origin.y = 679
            H20TextField.frame = frame
            
            
            frame = Divider2.frame
            frame.origin.y = 718
            Divider2.frame = frame
            

            
            frame = dynamicVelocityTitle.frame
            frame.origin.y = 727
            dynamicVelocityTitle.frame = frame
            frame = dynamicVelocityEditText.frame
            frame.origin.y = 763
            dynamicVelocityEditText.frame = frame
            frame = dynamicVelocityStepper.frame
            frame.origin.y = 763
            dynamicVelocityStepper.frame = frame
            frame = dynamicVelocityLabel.frame
            frame.origin.y = 793
            dynamicVelocityLabel.frame = frame
            
            
            
        }
        
        
        
        
    }
    @IBOutlet weak var Divider1: UIView!
    @IBOutlet weak var Divider2: UIView!
    @IBAction func pipeShape(_ sender: Any) {
        
        adjustPosition()
    }
    
    //Dynamic Velocity
    
    @IBOutlet weak var dynamicVelocityResultTitle: UILabel!
    @IBOutlet weak var dynamicVelocityResult: UILabel!
    
    @IBOutlet weak var dynamicVelocityStepper: UIStepper!
    @IBOutlet weak var dynamicVelocityLabel: UILabel!
    @IBOutlet weak var dynamicVelocityEditText: UITextField!
    
    @IBOutlet weak var heightLabel: UILabel!
    
    
    var dynamicPresureArray = [Double]()
    @IBAction func modifyDynamicVelocityList(_ sender: UIStepper) {
        
        
        if(dynamicVelocityStepper.value > oldValue && oldValue >= 0 && !(dynamicVelocityEditText.text?.isEmpty)!){
            oldValue = oldValue + 1
            dynamicPresureArray.append(Double(dynamicVelocityEditText.text!)!)
            var dynamicPressureArrayString = ""
            for dynamicPressure in dynamicPresureArray {
                dynamicPressureArrayString += String(dynamicPressure)         }
            dynamicVelocityEditText.text = ""
            dynamicVelocityLabel.text = dynamicPressureArrayString        }
        else {
            oldValue = oldValue - 1
            
            if(dynamicPresureArray.count > 0){
                dynamicPresureArray.removeLast()
            }
            var dynamicPressureArrayString = ""
            for dynamicPressure in dynamicPresureArray {
                dynamicPressureArrayString += String(dynamicPressure)
            }
            dynamicVelocityLabel.text = dynamicPressureArrayString        }
        
    }
    
    
    var oldValue : Double = 0.0
    func dismissKeyboard() {
        widthTextField.resignFirstResponder()
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        widthTextField.resignFirstResponder()
        return true
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
      
        self.view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: Selector("dismissKeyboard")))
        dynamicVelocityStepper.wraps = false
        dynamicVelocityStepper.autorepeat = false
        dynamicVelocityStepper.maximumValue = 40
        dynamicVelocityStepper.minimumValue = 0
        wetBulbSwitch.setOn(false,animated: false)
        AirCompositionSwitch.setOn(false,animated: false)
        pipeShapeSwitch.setOn(false, animated: false)
        
        oldValue = dynamicVelocityStepper.value
        self.widthUnitLabel.isHidden = false
        self.heightUnitLabel.isHidden = false
        self.dryBulbUnitLabel.isHidden = false
        self.staticPressureUnitLabel.isHidden = false
        self.pressureSeaLevelUnitLabel.isHidden = false
        self.wetBulbUnitLabel.isHidden = true
        
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
        //self.pipeShapeSwitch.isHidden = false
        self.CO2Label.isHidden = false
        
        
        self.widthTextField.isHidden = false
        self.heightTextField.isHidden = false
        self.molecularWeightTextField.isHidden = false
        self.dryBulbTemperatureTextField.isHidden = false
        self.staticPressureTextField.isHidden = false
        self.elevationAboveSeaLevelTextField.isHidden = false
        self.wetBulbTemperatureTextField.isHidden = true
        self.pitotTubeCoeffecientTextField.isHidden = false
        self.pressureAtSeaLevelTextField.isHidden = false
        self.elevationUnitLabel.isHidden = false
        
        
        self.widthTitle.isHidden = false
        self.velocityAverageTitle.isHidden = true
        self.normalAirFlowTitle.isHidden = true
        self.dryBulbTitle.isHidden = false
        self.atmoshpericPressureTItle.isHidden = true
        self.massAirFlowTitle.isHidden = true
        self.actualAirFlowTitle.isHidden = true
        self.gasDensityTitle.isHidden = true
        self.dynamicVelocityTitle.isHidden = false
        self.ductPressureTitle.isHidden = true
        self.staticPressureTitle.isHidden = false
        self.molecularWeightTitle.isHidden = false
        self.areaTitle.isHidden = true
        self.pipeShapeSwitch.isHidden = false
        self.nonStandardAirSwitchTitle.isHidden = false
        self.wetBulbSwitchTitle.isHidden = false
        self.dryBulbTitle.isHidden = false
        self.seaLevelTitle.isHidden = false
        self.elevationTitle.isHidden = false
        self.relativeHumidityTitle.isHidden = true
        self.pitotTubeTitle.isHidden = false
        self.pipeShapeTitle.isHidden = false
        self.wetBulbLabel.isHidden = true
        self.relativeHumidityUnit.isHidden = true
        self.elevationUnitLabel.isHidden = false
        self.heighTitle.isHidden = false
        self.dynamicVelocityStepper.isHidden = false
        self.dynamicVelocityLabel.isHidden = false
        self.dynamicVelocityEditText.isHidden = false
        self.CO2Label.isHidden = false
        self.H2OLabel.isHidden = false
        self.ArLabel.isHidden = false
        self.N2Label.isHidden = false
        self.O2LAbel.isHidden = false
        self.molecularWeightResultTitle.isHidden = true
        self.CO2TextField.isHidden = false
        self.ArTextField.isHidden = false
        self.N2TextField.isHidden = false
        self.H20TextField.isHidden = false
        self.O2TextField.isHidden = false
        self.dynamicVelocityResult.isHidden = true
        self.dynamicVelocityResultTitle.isHidden = true
        var dynamicPressureArrayString = ""
        for dynamicPressure in dynamicPresureArray {
            dynamicPressureArrayString += String(dynamicPressure)
        }
        var frame = CGRect()

        
        frame = CO2Label.frame
        frame.origin.y = 585
        CO2Label.frame = frame
        
        frame = CO2TextField.frame
        frame.origin.y = 585
        CO2TextField.frame = frame
        
        frame = O2LAbel.frame
        frame.origin.y = 620
        O2LAbel.frame = frame
        
        frame = O2TextField.frame
        frame.origin.y = 620
        O2TextField.frame = frame
        
        
        
        frame = N2Label.frame
        frame.origin.y = 655
        N2Label.frame = frame
        
        frame = N2TextField.frame
        frame.origin.y = 655
        N2TextField.frame = frame
        
        frame = ArLabel.frame
        frame.origin.y = 690
        ArLabel.frame = frame
        
        frame = ArTextField.frame
        frame.origin.y = 690
        ArTextField.frame = frame
        
        frame = H2OLabel.frame
        frame.origin.y = 725
        H2OLabel.frame = frame
        
        frame = H20TextField.frame
        frame.origin.y = 725
        H20TextField.frame = frame

        dynamicVelocityLabel.text = dynamicPressureArrayString
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}


