//
//  CalculatorBrain.swift
//  BMI Calculator
//
//  Created by Tyler Sheft on 8/19/22.
//  Copyright © 2022 Angela Yu. All rights reserved.
//

import UIKit

struct CalculatorBrain {

	var bmi: BMI?

	func getBMIValue() -> String {
		let bmiTo1DecimalPlace = String(format: "%.1f", bmi?.value ?? 0.0)
		return bmiTo1DecimalPlace
	}

	func getAdvice() -> String {
		return bmi?.advice ?? "Fit as a fiddle!"
	}

	func getColor() -> UIColor {
		return bmi?.color ?? .green
	}

	mutating func calculateBMI(height: Float, weight: Float) {
		let heightSquared = pow(height, 2)
		let bmiValue = weight / heightSquared
		if bmiValue < 18.5 {
			bmi = BMI(value: bmiValue, advice: "Eat more pies!", color: .cyan)
		} else if bmiValue < 24.9 {
			bmi = BMI(value: bmiValue, advice: "Fit as a fiddle!", color: .green)
		} else {
			bmi = BMI(value: bmiValue, advice: "Eat less pies!", color: .red)
		}
	}

}
