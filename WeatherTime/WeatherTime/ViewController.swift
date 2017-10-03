//
//  ViewController.swift
//  WeatherTime
//
//  Created by Christopher D Fontana on 9/28/17.
//  Copyright © 2017 Christopher D Fontana. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var currentWeather = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        // this gets the information from the URL web service
        if let url = NSURL(string: "https://api.darksky.net/forecast/1d333bf5f0331df4ca287b0ad0c30a8a/41.881832,-87.623177"){
            
            // it gets the data
            if let data = NSData(contentsOf: url as URL){
                
                // this tries the data
                do{
                    let parsed = try JSONSerialization.jsonObject(with: data as Data, options: JSONSerialization.ReadingOptions.allowFragments) as! [String:AnyObject] //1
                    
                    let newDict = parsed//2
                    //print(newDict["currently"]!["summary"])
                    self.currentStatus.text = "It is currently: \(newDict["currently"]!["summary"]!!) outside."
                    self.currentTemp.text = "Temperature: \(newDict["currently"]!["temperature"]!!) degrees"
                    self.hourlySummary.text = "\(newDict["hourly"]!["summary"]!!)"
                }
                    // if it cannot get the data this error is thrown.
                catch let error as NSError {
                    print("A JSON parsing error occurred, here are the details:\n \(error)")//3
                }
            }
        }
    }
    
    
    
    

    @IBOutlet weak var currentStatus: UILabel!
    
    @IBOutlet weak var currentTemp: UILabel!
    
    @IBOutlet weak var hourlySummary: UILabel!
}

