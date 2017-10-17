//
//  startViewController.swift
//  ojisangame
//
//  Created by 福島達也 on 2017/10/11.
//  Copyright © 2017年 Tatsuya Fukushima. All rights reserved.
//

import UIKit
import SwiftSpinner

class startViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func to33(){
        
        performSegue(withIdentifier: "to33", sender: nil)
        
    }
    
    @IBAction func to44(){
        
        performSegue(withIdentifier: "to44", sender: nil)
        
    }

    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
