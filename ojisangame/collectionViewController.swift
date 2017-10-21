//
//  collectionViewController.swift
//  ojisangame
//
//  Created by 福島達也 on 2017/10/09.
//  Copyright © 2017年 Tatsuya Fukushima. All rights reserved.
//

import UIKit
import SwiftSpinner

class collectionViewController: UIViewController , UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout,UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet var collectionView : UICollectionView!
    
    //表示する直前のUIImageの配列
    var photoArray = [UIImage]()
    //Userdefaultsから取り出した直後のDataの配列
    var dataphotoArray = [Data]()
   
    
    var selectedphotoImage = UIImage()
    var savedata = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        // Do any additional setup after loading the view.
        
        let xib : UINib = UINib(nibName:"photoCollectionViewCell",bundle:nil)
        collectionView.register(xib, forCellWithReuseIdentifier: "photocell")
        
        if savedata.object(forKey:"photodata") != nil{
            
            dataphotoArray = savedata.object(forKey:"photodata") as! [Data]
            
            for i in 0...(dataphotoArray.count - 1){

            photoArray.append(UIImage(data:dataphotoArray[i])!)
            
        }
        

            print("nilじゃない")
        }else{
            
            //初回だけ元々入ってる画像をUIImageからData化している
            
            photoArray = [UIImage(named:"satoken.png")!,UIImage(named:"komei.png")!,UIImage(named:"miyamoto.png")!,UIImage(named:"ookubo.png")!]
            
           dataphotoArray  = photoArray.map { (image) -> Data in
                (UIImagePNGRepresentation(image))!
            }
            
//            savedata.set(dataphotoArray,forKey:"photodata")
//            savedata.synchronize()
            
            print("nilです")
        }
        
        print("viewDidLoad")
    }
    

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize{
        
        let width : CGFloat = collectionView.bounds.width  / 2
        let height = width
        
        return CGSize(width: width, height: height)
    }
    
    
    //データの個数
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    {
        return photoArray.count
    }
    
    
    //データを返すメソッド
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
        //コレクションビューから識別子contentcellを取得する。
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "photocell", for: indexPath as IndexPath) as! photoCollectionViewCell
        
        //セルの背景色をランダムに設定する。
        cell.backgroundColor = UIColor(red: CGFloat(drand48()),
                                       green: CGFloat(drand48()),
                                       blue: CGFloat(drand48()),
                                       alpha: 0.8)
        cell.photo.image = photoArray[indexPath.row]
        
        return cell
        
    }
    
    //セル選択時に呼び出されるメソッド

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {

        photoArray.remove(at: indexPath.row)
        collectionView.reloadData()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        // 選択した画像のオリジナルデータを取得
        
        selectedphotoImage = info[UIImagePickerControllerOriginalImage] as! UIImage
        photoArray.append(selectedphotoImage)
        
        collectionView.reloadData()
        dismiss(animated: true, completion: nil)
        
    }

    @IBAction func plus() {
        
        // フォトライブラリが使用可能か？
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.photoLibrary) {
            
            // フォトライブラリの選択画面を表示
            let picker = UIImagePickerController()
            picker.delegate = self as UIImagePickerControllerDelegate & UINavigationControllerDelegate
            picker.sourceType = UIImagePickerControllerSourceType.photoLibrary
            self.present(picker, animated: true, completion: nil)
        }
    }
    
//    override func viewWillDisappear(_ animated: Bool) {
//        super.viewWillDisappear(true)
//    
//        
//        let dataphotoArray : [Data]  = photoArray.map { (image) -> Data in
//            (UIImagePNGRepresentation(image))!
//        }
//        
//        savedata.set(dataphotoArray,forKey:"photodata")
//        
//        print("画像は現在" + String(dataphotoArray.count)+"個")
//        print("viewWillDisappear")
//        
//    }
    

    
    @IBAction func save(){
        
        SwiftSpinner.show(delay:0,title:"写真保存中",animated:true)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
            SwiftSpinner.hide()
        }
        
       
        let dataphotoArray : [Data]  = self.photoArray.map { (image) -> Data in
            (UIImagePNGRepresentation(image))!
        
            }
            savedata.set(dataphotoArray,forKey:"photodata")
        print("画像は現在" + String(dataphotoArray.count)+"個")
        
        
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
