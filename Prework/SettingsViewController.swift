//
//  SettingsViewController.swift
//  Prework
//
//  Created by Adnaan_Syed on 7/27/22.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var switchMode: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let userSettings = UserDefaults.standard
        
        if(userSettings.bool(forKey: "darkMode")){
            switchMode.isOn = true
            overrideUserInterfaceStyle = .dark
        } else {
            switchMode.isOn = false
            overrideUserInterfaceStyle = .light
                
        }
        

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func changeBackground(_ sender: UISwitch) {
        let userSettings = UserDefaults.standard
        
        if(sender.isOn){
            userSettings.set(true, forKey: "darkMode")
            overrideUserInterfaceStyle = .dark
        } else {
            userSettings.set(false, forKey:"darkMode")
            overrideUserInterfaceStyle = .light
        }

        
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
