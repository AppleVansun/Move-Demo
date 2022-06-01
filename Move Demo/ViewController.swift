//
//  ViewController.swift
//  Move Demo
//
//  Created by Ivan Grin on 1.06.22.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var label: UILabel!
    var weatherManager = WeatherManager()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        weatherManager.fetchWether(cityName: "minsk")
        
        weatherManager.delegate = self
    }


    @IBAction func button(_ sender: UIButton) {
        weatherManager.fetchWether(cityName: "minsk")
    }
}

extension ViewController: WeatherManagerDelegate {
    
    func didUpdateWeather(_ weatherManager: WeatherManager, weather: WeatherModel) {
        DispatchQueue.main.async {
            self.label.text = weather.stringTemperature
        }
    }
    
    func didFailWithError(error: Error) {
        print(error)
    }
    
}
