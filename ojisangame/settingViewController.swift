//
//  settingViewController.swift
//  ojisangame
//
//  Created by 福島達也 on 2017/10/09.
//  Copyright © 2017年 Tatsuya Fukushima. All rights reserved.
//

import UIKit
import SwiftSpinner


class settingViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.

    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func back(){
        self.dismiss(animated: true, completion: nil)
        
    }
    
    @IBAction func tophoto(){
        
        SwiftSpinner.show(delay:0,title:"写真読み込み中",animated:true)
        DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
         
        SwiftSpinner.hide()
        }
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
