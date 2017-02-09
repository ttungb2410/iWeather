//
//  ViewController.swift
//  iWeather
//
//  Created by TTung on 2/8/17.
//  Copyright © 2017 TTung. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var lbl_city: UILabel!
    @IBOutlet weak var lbl_quote: UILabel!
    @IBOutlet weak var lbl_tempNumb: UILabel!
    @IBOutlet weak var lbl_temp: UILabel!
    @IBOutlet weak var im_backgroud: UIImageView!
    
    var quote = ["Since we cannot change reality, let us change the eyes which see reality.",
                 "Without a struggle, there can be no progress.",
                 "If you don't like something, change it. If you can't change it, change your attitude."]
    
    var city = ["Ha Noi",
                "Ho Chi Minh City ",
                "New York",
                "Tokyo",
                "Melbourne",
                "Rome",
                "Paris"]
    
    var images = ["Blood","Moon","Sun"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    
    @IBAction func btn_changeTemp(_ sender: Any) {
        changeTemp()
    }

    @IBAction func btn_refresh(_ sender: Any) {
        
        var cityIndex = Int(arc4random_uniform(UInt32(city.count)))             // random thanh pho, 2 turn lien nhau khong trung
            if lbl_city.text == city[cityIndex]{
            cityIndex = Int(arc4random_uniform(UInt32(city.count)))
            lbl_city.text = city[cityIndex]

            }else{
            lbl_city.text = city[cityIndex]
        }
        let quoteIndex = Int(arc4random_uniform(UInt32(quote.count)))           // random cau thanh ngu
        
        lbl_quote.text = quote[quoteIndex]
        
        let imageIndex = Int(arc4random_uniform(UInt32(images.count)))          // random backgroud
        
        im_backgroud.image = UIImage.init(named: images[imageIndex])
        
        lbl_tempNumb.isHidden = false
        lbl_quote.isHidden = false
        getTemp()
    }
    
    func getTemp() -> Void {
       
        let randomTemp = String(format: "%2.1f" , tempRandom())                 // nhiet do
        lbl_tempNumb.text = randomTemp
    }
    
    func tempRandom() -> Double{                                                            // random nhiet do
        if lbl_temp.text == "C"{
        return Double(arc4random_uniform(18) + 14) + Double(arc4random()) / Double(INT32_MAX)                   // khi o do C
        }else{
            return (Double(arc4random_uniform(18) + 14) + Double(arc4random()) / Double(INT32_MAX)) * 9/5 + 32  // khi o do F
        }
    }
    func changeTemp(){
        var cToF:Double = 0                                                      // thay doi nhiet do
        var fToC:Double = 0
        if lbl_temp.text == "C" {
            cToF = Double(lbl_tempNumb.text!)! * 9/5 + 32
            lbl_tempNumb.text = String(format: "%2.1f", cToF)
            lbl_temp.text = "F"
        }else{
            fToC = (Double(lbl_tempNumb.text!)! - 32) * 5/9
            lbl_tempNumb.text = String(format: "%2.1f", fToC)
            lbl_temp.text = "C"
        }
    }
   
}

