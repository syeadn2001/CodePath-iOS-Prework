//
//  ViewController.swift
//  Prework
//
//  Created by Adnaan_Syed on 7/25/22.
//

/*
 CURRENT BUGS:
 - Have to fix layout
- Have to fix Price Per Person & Party Size Incrementer
 & Number!!!
 
 - Fixed default slider going to half the bill
 - When we change person, price per person defaults to 0
 
 */

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var billAmountTextField: UITextField!
    @IBOutlet weak var tipAmountLabel: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var scrollTipControl: UISlider!
    @IBOutlet weak var scrollPercentage: UILabel!
    @IBOutlet weak var peopleControl: UISegmentedControl!
    @IBOutlet weak var personPricer: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.title = "Tip Calculator"
        //This code removes the keyboard after touching the screen
        
        view.addGestureRecognizer(UITapGestureRecognizer(target: view, action: #selector(UIView.endEditing(_:))))

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("view will appear")
        // This is a good place to retrieve the default tip percentage from UserDefaults
        // and use it to update the tip amount
        
        let userSettings = UserDefaults.standard
                
        // The background will be light/dark, based off the value of dark mode in userDefaults

        if(userSettings.bool(forKey: "darkMode")){
            overrideUserInterfaceStyle = .dark;
        } else {
            overrideUserInterfaceStyle = .light
        }

    }

    
    
    //This function calculates the bill & tip based off the tip percentage
    func totalBill(_ tipPercentage: Double) -> (bill:Double, tip:Double){
        let bill = Double(billAmountTextField.text!) ?? 0
        
        let tip = tipPercentage * bill
        
        return (bill, tip)
        
    }
    
    @IBAction func inputBill(_ sender: Any) {
        let payment = totalBill(0)
        tipAmountLabel.text = String(format: "$%.2f", payment.tip)
        // Update Total Amount
        totalLabel.text = String(format: "$%.2f", payment.bill)
        personPricer.text = ""
        
        scrollTipControl.value = 0
        scrollPercentage.text = "0%"

        
    }
    
    
    @IBAction func scrollCalculate(_ sender: Any) {
        //let bill = Double(billAmountTextField.text!) ?? 0
        var tipPercentage:Double;
        
        tipPercentage = Double(scrollTipControl.value).isNaN ? 0 : Double(scrollTipControl.value)
        let strPercent:String = String(Int(tipPercentage*100))
        scrollPercentage.text = strPercent+"%"
        
        
        let payment = totalBill(round(tipPercentage*100)/100)
        let total = payment.bill+payment.tip
        tipAmountLabel.text = String(format: "$%.2f", payment.tip)
        // Update Total Amount
        totalLabel.text = String(format: "$%.2f", total)
        
        
        let totalPpl = Double(peopleControl.selectedSegmentIndex+1)
        personPricer.text = String(format:"%.2f", total/totalPpl)
        
//        let perPrice = Double(partySizeIncrementer.value)
//
//        personPricer.text = String(format: "$%.2f", (total/perPrice))

    }

    

    
    
    
    
    
   
//        numPeople.text = String(format: "%.0f",partySizeIncrementer.value)
//
//        let perPrice =  Double(partySizeIncrementer.value)
//        let total = Double(totalLabel.text!)
//        personPricer.text = String(format: "$%.2f", (total/perPrice))
        
    
    
    
}

