//
//  sixteenViewController.swift
//  ojisangame
//
//  Created by 福島達也 on 2017/10/09.
//  Copyright © 2017年 Tatsuya Fukushima. All rights reserved.
//

import UIKit
import AVFoundation

class sixteenViewController: UIViewController, AVAudioPlayerDelegate{
    
    @IBOutlet var view1: UIButton!
    @IBOutlet var view2: UIButton!
    @IBOutlet var view3: UIButton!
    @IBOutlet var view4: UIButton!
    @IBOutlet var view5: UIButton!
    @IBOutlet var view6: UIButton!
    @IBOutlet var view7: UIButton!
    @IBOutlet var view8: UIButton!
    @IBOutlet var view9: UIButton!
    @IBOutlet var view10: UIButton!
    @IBOutlet var view11: UIButton!
    @IBOutlet var view12: UIButton!
    @IBOutlet var view13: UIButton!
    @IBOutlet var view14: UIButton!
    @IBOutlet var view15: UIButton!
    @IBOutlet var view16: UIButton!
    
    @IBOutlet var haikei : UIView!
    
    
    var imageView: UIImageView!
    
    var answernumber : Int = 0
    
    var selectednumber = Int()
    
    var audioplayer : AVAudioPlayer!
    
    
    var dataphotoArray = [Data]()
    var photoArray = [UIImage]()
    
    var savedata = UserDefaults.standard
    
    func sethaikei(){
        

        var number  = Int()
        number = Int(arc4random_uniform(UInt32(Int(photoArray.count))))
        var haikei : UIImage!
        haikei = photoArray[number]
        
        view1.setBackgroundImage(haikei,for: UIControlState())
        view2.setBackgroundImage(haikei,for: UIControlState())
        view3.setBackgroundImage(haikei,for: UIControlState())
        view4.setBackgroundImage(haikei,for: UIControlState())
        view5.setBackgroundImage(haikei,for: UIControlState())
        view6.setBackgroundImage(haikei,for: UIControlState())
        view7.setBackgroundImage(haikei,for: UIControlState())
        view8.setBackgroundImage(haikei,for: UIControlState())
        view9.setBackgroundImage(haikei,for: UIControlState())
        view10.setBackgroundImage(haikei,for: UIControlState())
        view11.setBackgroundImage(haikei,for: UIControlState())
        view12.setBackgroundImage(haikei,for: UIControlState())
        view13.setBackgroundImage(haikei,for: UIControlState())
        view14.setBackgroundImage(haikei,for: UIControlState())
        view15.setBackgroundImage(haikei,for: UIControlState())
        view16.setBackgroundImage(haikei,for: UIControlState())
        
        print(number)
        
    }
    func hidebutton(){
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //imageView作成
        self.imageView = UIImageView(frame: CGRect(x:0, y:0,width: 375,height: 200))
        //中央寄せ
        self.imageView.center = self.view.center
        //画像を設定
        self.imageView.image = UIImage(named: "44.png")
        //viewに追加
        self.view.addSubview(self.imageView)
        
        do{
            let filePath = Bundle.main.path(forResource: "YEET", ofType: "mp3")
            let audioPath = NSURL(fileURLWithPath: filePath!)
            audioplayer = try AVAudioPlayer(contentsOf: audioPath as URL)
            audioplayer.delegate = self
            audioplayer.prepareToPlay()
        }catch{
            
        }
        
        if savedata.object(forKey: "photodata") != nil {
            
            dataphotoArray = savedata.object(forKey: "photodata") as! [Data]
            
            for i in 0...(dataphotoArray.count - 1){
                
                photoArray.append(UIImage(data:dataphotoArray[i])!)
                
                }
        }else{
                
//            photonameArray = ["satoken","komei","miyamoto","ookubo"]
//            savedata.set(photonameArray,forKey: "photoname")
        }
        sethaikei()
        answernumber = Int(arc4random_uniform(16))+1
        print("ハズレの数字は"+String(answernumber))
        
    }
    
    @IBAction func tap1(){
        selectednumber = 1
        answercheck()
    }
    @IBAction func tap2(){
        selectednumber = 2
        
        answercheck()
    }
    @IBAction func tap3(){
        selectednumber = 3
        answercheck()
    }
    @IBAction func tap4(){
        selectednumber = 4
        answercheck()
    }
    @IBAction func tap5(){
        selectednumber = 5
        answercheck()
    }
    @IBAction func tap6(){
        selectednumber = 6
        answercheck()
    }
    @IBAction func tap7(){
        selectednumber = 7
        answercheck()
    }
    @IBAction func tap8(){
        selectednumber = 8
        answercheck()
    }
    @IBAction func tap9(){
        selectednumber = 9
        answercheck()
    }
    
    @IBAction func tap10(){
        selectednumber = 10
        answercheck()
    }
    
    @IBAction func tap11(){
        selectednumber = 11
        answercheck()
    }
    @IBAction func tap12(){
        selectednumber = 12
        
        answercheck()
    }
    @IBAction func tap13(){
        selectednumber = 13
        answercheck()
    }
    @IBAction func tap14(){
        selectednumber = 14
        answercheck()
    }
    @IBAction func tap15(){
        selectednumber = 15
        answercheck()
    }
    @IBAction func tap16(){
        selectednumber = 16
        answercheck()
    }
    
    func answercheck(){
        
        if answernumber == selectednumber{
            
            let layer1:CALayer = view1.layer
            let layer4:CALayer = view4.layer
            let layer6:CALayer = view6.layer
            let layer7:CALayer = view7.layer
            let layer10:CALayer = view10.layer
            let layer11:CALayer = view11.layer
            let layer13:CALayer = view13.layer
            let layer16:CALayer = view16.layer
            
            
            let groupAnim = CAAnimationGroup()
            groupAnim.repeatCount = MAXFLOAT
            
            //回転アニメーション
            let rotation:CABasicAnimation = CABasicAnimation(keyPath: "transform.rotation")
            rotation.toValue = M_PI / 2.0
            rotation.duration = 0.25           // 0.25秒で90度回転
            
            // 縮小するアニメーション
            let scaleDown = CABasicAnimation(keyPath: "transform.scale")
            scaleDown.fromValue = 3.0
            scaleDown.toValue = 1.0
            
            groupAnim.animations = [rotation,scaleDown]
            layer1.add(groupAnim, forKey: nil)
            layer4.add(groupAnim, forKey: nil)
            layer6.add(groupAnim, forKey: nil)
            layer7.add(groupAnim, forKey: nil)
            layer10.add(groupAnim, forKey: nil)
            layer11.add(groupAnim, forKey: nil)
            layer13.add(groupAnim, forKey: nil)
            layer16.add(groupAnim, forKey: nil)
            
            print("BINGO")
            
            let alert: UIAlertController = UIAlertController(title: "BINGOOOOOOO!!!!", message: "", preferredStyle:  UIAlertControllerStyle.alert)
            
            audioplayer.play()
            
            let defaultAction: UIAlertAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler:{
                (action: UIAlertAction!) -> Void in
                self.answernumber = Int(arc4random_uniform(16)) + 1
                print("ハズレの数字は"+String(self.answernumber))
                
                self.view1.layer.removeAllAnimations()
                self.view4.layer.removeAllAnimations()
                self.view6.layer.removeAllAnimations()
                self.view7.layer.removeAllAnimations()
                self.view10.layer.removeAllAnimations()
                self.view11.layer.removeAllAnimations()
                self.view13.layer.removeAllAnimations()
                self.view16.layer.removeAllAnimations()
                
                self.view1.isHidden = false
                self.view2.isHidden = false
                self.view3.isHidden = false
                self.view4.isHidden = false
                self.view5.isHidden = false
                self.view6.isHidden = false
                self.view7.isHidden = false
                self.view8.isHidden = false
                self.view9.isHidden = false
                self.view10.isHidden = false
                self.view11.isHidden = false
                self.view12.isHidden = false
                self.view13.isHidden = false
                self.view14.isHidden = false
                self.view15.isHidden = false
                self.view16.isHidden = false
                
                self.sethaikei()
            })
            //            let cancelAction: UIAlertAction = UIAlertAction(title: "キャンセル", style: UIAlertActionStyle.cancel, handler:{
            //
            //                (action: UIAlertAction!) -> Void in
            //                print("Cancel")
            //            })
            
            //            alert.addAction(cancelAction)
            alert.addAction(defaultAction)
            
            present(alert, animated: true, completion: nil)
        }else{
            
            let alert: UIAlertController = UIAlertController(title: "セーフ", message: "", preferredStyle:  UIAlertControllerStyle.alert)
            
            let defaultAction: UIAlertAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler:{
                (action: UIAlertAction!) -> Void in
                
                
                if self.selectednumber == 1{
                    self.view1.isHidden = true
                }else if self.selectednumber == 2{
                    self.view2.isHidden = true
                }else if self.selectednumber == 3{
                    self.view3.isHidden = true
                }else if self.selectednumber == 4{
                    self.view4.isHidden = true
                }else if self.selectednumber == 5{
                    self.view5.isHidden = true
                }else if self.selectednumber == 6{
                    self.view6.isHidden = true
                }else if self.selectednumber == 7{
                    self.view7.isHidden = true
                }else if self.selectednumber == 8{
                    self.view8.isHidden = true
                }else if self.selectednumber == 9{
                    self.view9.isHidden = true
                }else if self.selectednumber == 10{
                    self.view10.isHidden = true
                }else if self.selectednumber == 11{
                    self.view11.isHidden = true
                }else if self.selectednumber == 12{
                    self.view12.isHidden = true
                }else if self.selectednumber == 13{
                    self.view13.isHidden = true
                }else if self.selectednumber == 14{
                    self.view14.isHidden = true
                }else if self.selectednumber == 15{
                    self.view15.isHidden = true
                }else{
                    self.view16.isHidden = true
                }
                
                print("OK")
            })
            
            alert.addAction(defaultAction)
            
            present(alert,animated: true,completion: nil)
            print("外れ")
            
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        //80%まで縮小させて・・・
        UIView.animate(withDuration: 0.5,
                       delay: 0.5,
                       options: UIViewAnimationOptions.curveEaseOut,
                       animations: { () in
                        self.imageView.transform = CGAffineTransform(scaleX: 0.6, y: 0.6)
        }, completion: { (Bool) in
            
        })
        
        //8倍まで拡大！
        UIView.animate(withDuration: 0.3
            ,
                       delay: 1.0,
                       options: UIViewAnimationOptions.curveEaseOut,
                       animations: { () in
                        self.imageView.transform = CGAffineTransform(scaleX: 8.0, y: 8.0)
                        self.imageView.alpha = 0
        }, completion: { (Bool) in
            //で、アニメーションが終わったらimageViewを消す
            self.imageView.removeFromSuperview()
        })
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.1) {
        self.haikei.isHidden = true
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func back(){
        
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func change(){
        
        sethaikei()
    }
    
}



