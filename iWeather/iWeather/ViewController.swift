//
//  ViewController.swift
//  iWeather
//
//  Created by Nick patel on 22/07/21.
//  Copyright © 2021 Nick patel. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var WArray = [FetchData]()
    
   /* private let mySerach:UISearchBar = {
       let searchbar = UISearchBar()
        searchbar.placeholder = "Search"
        return searchbar
    } () */
    
    private let mySerach = UISearchBar()
    
    private let citylbl:UILabel = {
       let lbl = UILabel()
        lbl.text = "Surat"
        lbl.textColor = .black
        lbl.font = UIFont.boldSystemFont(ofSize: 20)
        return lbl
    } ()
    
    private let regionlbl:UILabel = {
       let lbl = UILabel()
        lbl.text = "Gujrat,india"
        lbl.textColor = .gray
        //lbl.font = UIFont.boldSystemFont(ofSize: 20)
        return lbl
    } ()
    
    private let datetimelbl:UILabel = {
       let lbl = UILabel()
        lbl.text = "22/07/2021"
        lbl.numberOfLines = 2
        lbl.textColor = .black
        lbl.font = UIFont.boldSystemFont(ofSize: 20)
        return lbl
    } ()
    
    private let templbl:UILabel = {
       let lbl = UILabel()
        lbl.text = "40"
        lbl.textColor = .black
        lbl.font = UIFont.boldSystemFont(ofSize: 40)
        return lbl
    } ()
    
    private let statuslbl:UILabel = {
       let lbl = UILabel()
        lbl.text = "Cloudy"
        lbl.textColor = .gray
        //lbl.textAlignment = .center
        //lbl.font = UIFont.boldSystemFont(ofSize: 20)
        return lbl
    } ()
    
    private let currentDay:UILabel = {
       let lbl = UILabel()
        lbl.text = "Today"
        lbl.textColor = .black
        lbl.font = UIFont.boldSystemFont(ofSize: 20)
        return lbl
    } ()
    
    private let pressurelbl:UILabel = {
       let lbl = UILabel()
        lbl.text = "Pressure"
        lbl.textColor = .black
        lbl.font = UIFont.boldSystemFont(ofSize: 18)
        return lbl
    } ()
    
    private let pressureValue:UILabel = {
       let lbl = UILabel()
        lbl.text = "900mb"
        lbl.textColor = .gray
        //lbl.font = UIFont.boldSystemFont(ofSize: 20)
        return lbl
    } ()
    
    private let windlbl:UILabel = {
       let lbl = UILabel()
        lbl.text = "Wind"
        lbl.textColor = .black
        lbl.font = UIFont.boldSystemFont(ofSize: 18)
        return lbl
    } ()
    
    private let windVlaye:UILabel = {
       let lbl = UILabel()
        lbl.text = "10km"
        lbl.textColor = .gray
        //lbl.font = UIFont.boldSystemFont(ofSize: 20)
        return lbl
    } ()
    
    private let humaditylbl:UILabel = {
       let lbl = UILabel()
        lbl.text = "Humadity"
        lbl.textColor = .black
        lbl.font = UIFont.boldSystemFont(ofSize: 18)
        return lbl
    } ()
    
    private let humadityValue:UILabel = {
       let lbl = UILabel()
        lbl.text = "85%"
        lbl.textColor = .gray
        //lbl.font = UIFont.boldSystemFont(ofSize: 20)
        return lbl
    } ()
    
    private let icon:UIImageView = {
        let img = UIImageView()
        return img
    }()
    
    private let bgview:UIView = {
        let bg = UIView()
        bg.backgroundColor = .purple
        bg.alpha = 0.3
        bg.layer.cornerRadius = 7
        return bg
    }()
    
    private let myIcon = UIImageView()
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        view.addSubview(mySerach)
        view.addSubview(citylbl)
        view.addSubview(regionlbl)
        view.addSubview(datetimelbl)
        view.addSubview(templbl)
        view.addSubview(statuslbl)
        view.addSubview(currentDay)
        view.addSubview(pressurelbl)
        view.addSubview(pressureValue)
        view.addSubview(windlbl)
        view.addSubview(windVlaye)
        view.addSubview(humaditylbl)
        view.addSubview(humadityValue)
        view.addSubview(icon)
        view.addSubview(bgview)
        view.addSubview(myIcon)
         mySerach.delegate = self
       	 
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        bgview.frame = CGRect(x: 20, y: 420, width: 330, height: 180)
        
        mySerach.frame = CGRect(x: 40, y: 50, width: 300, height: 40)
        citylbl.frame = CGRect(x: 40, y: 120, width: 120, height: 35)
        regionlbl.frame = CGRect(x: 40, y: 162, width: 150, height: 14)
        datetimelbl.frame = CGRect(x: 220, y: 130, width: 140, height: 36)
        
        templbl.frame = CGRect(x: 150, y: 340, width: 120, height: 30)
        statuslbl.frame = CGRect(x: (view.width) / 2 - 60, y: 380, width: 300, height: 20)
        
        icon.frame = CGRect(x: 40, y: 200, width: 280, height: 80)
        
        currentDay.frame = CGRect(x: 40, y: 435, width: 60, height: 27)
        	
        pressurelbl.frame = CGRect(x: 60, y: 495, width: 80, height: 18)
        pressureValue.frame = CGRect(x: 75, y: 545, width: 80, height: 15)
        
        windlbl.frame = CGRect(x: 160, y: 495, width: 50, height: 18)
        windVlaye.frame = CGRect(x: 163, y: 535, width: 80, height: 35)
        
        humaditylbl.frame = CGRect(x: 235, y: 495, width: 90, height: 18)
        humadityValue.frame = CGRect(x: 254, y: 545, width: 80, height: 14)
        myIcon.frame = CGRect(x: 100, y: 170, width: 150, height: 150)
    }
    
    func displayData(searchKey:String)
             {
                 WArray = APIHandler.apidata.serchData(data: searchKey)
                 
                 for i in WArray {
                     
                    citylbl.text = i.location.name
                    regionlbl.text = i.location.region
                    datetimelbl.text = i.location.localtime
                    templbl.text = String(i.current.temp_c)
                    statuslbl.text = i.current.condition.text
                     
                   
                    pressureValue.text = String(i.current.wind_kph)
                   
                    windVlaye.text = String(i.current.pressure_in)
                  
                    humadityValue.text = String(i.current.humidity)
                    
                    //let apiurl = "cdn.weatherapi.com/weather/64x64/day/"
                    //let imgurl = apiurl + i.current.condition.icon.split(separator: "/").last!
                    
                    
                    //print(imgurl)
                    
                    //icon.image = UIImage(named: imgurl)
                    //icon.load(urlString: imgurl)
                    
                
                    
                    var temps = i.current.temp_c
                    
                    
                    if Int32(i.current.temp_c) < 0 {
                        myIcon.image = UIImage(named: "w_snow")
                    }
                    if i.current.temp_c < 10 {
                        myIcon.image = UIImage(named: "w_littleRain")
                    }
                    else if i.current.temp_c > 10 && i.current.temp_c < 20 {
                        myIcon.image = UIImage(named: "w_foggy")
                    }
                    
                    if temps >= 20
                    {
                        myIcon.image = UIImage(named: "w_foggy")
                    }
                    else
                    {
                        myIcon.image = UIImage(named: "w_day")
                    }
                    
                  
                    
                    
                    print(i.location.name)
                    print(i.location.region)
                     print(i.location.country)
                     print(i.location.localtime)
                     
                     print(i.current.temp_c)
                     print(i.current.temp_f)
                 
                     print(i.current.condition.text)
                     print(i.current.condition.icon)
                     print(i.current.condition.code)
                     
                     print(i.current.wind_kph)
                     print(i.current.pressure_in)
                     print(i.current.humidity)
                 
                 }
                 
             }
}

extension ViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
       print("entered")
        view.endEditing(true)
        displayData(searchKey:mySerach.text!)
    }
}
/*
extension UIImageView {
    func load(urlString: String) {
        guard let url = URL(string: urlString) else {
            return
        }
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }
}*/
