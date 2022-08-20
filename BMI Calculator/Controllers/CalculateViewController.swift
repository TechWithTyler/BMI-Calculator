//
//  CalculateViewController.swift
//  BMI Calculator
//
//  Created by Angela Yu on 21/08/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit

class CalculateViewController: UIViewController {

	@IBOutlet weak var heightLabel: UILabel?

	@IBOutlet weak var weightLabel: UILabel?

	@IBOutlet weak var heightSlider: UISlider?

	@IBOutlet weak var weightSlider: UISlider?

	var calculatorBrain = CalculatorBrain()

	let segueName = "goToResult"

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

	@IBAction func heightSliderChanged(_ sender: UISlider) {
		let height = sender.value
		let heightString = String(format: "%.2f", height)
		heightLabel?.text = "\(heightString)m"
		}

	@IBAction func weightSliderChanged(_ sender: UISlider) {
		let weight = sender.value
		let weightString = String(format: "%.0f", weight)
		weightLabel?.text = "\(weightString)Kg"
	}

	@IBAction func calculateButtonPressed(_ sender: UIButton) {
		let height = (heightSlider?.value)!
		let weight = (weightSlider?.value)!
		calculatorBrain.calculateBMI(height: height, weight: weight)
		performSegue(withIdentifier: segueName, sender: self)
	}

	// MARK: - Navigation

	// In a storyboard-based application, you will often want to do a little preparation before navigation
	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		// Get the new view controller using segue.destination.
		// Pass the selected object to the new view controller.
		if segue.identifier == segueName {
			let destinationVC = segue.destination as? ResultViewController
			destinationVC?.bmiValue = calculatorBrain.getBMIValue()
			destinationVC?.advice = calculatorBrain.getAdvice()
			destinationVC?.color = calculatorBrain.getColor()
		}
	}

}

