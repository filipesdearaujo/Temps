//
//  SearchViewController.swift
//  Clima
//
//  Created by Filipe Simões on 05/03/24.
//

import UIKit

class SearchViewController: UIViewController, WeatherManagerDelegate {

    @IBOutlet weak var conditionImage: UIImageView!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var returnButton: UIButton!
    @IBOutlet weak var degreeLabel: UILabel!
    @IBOutlet weak var celsiusLabel: UILabel!
    
    
    
    var city: String = ""
    var weatherManager = WeatherManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewSetup()
        weatherManager.delegate = self
        weatherManager.fetchWeather(cityName: city)
    }
    
    @IBAction func returnPressed(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    func viewSetup() {
        returnButton.layer.cornerRadius = returnButton.bounds.height/2
        returnButton.layer.cornerRadius = returnButton.bounds.height/2
    }

    func didUpdateWeather(_ weatherManager: WeatherManager, weather: WeatherModel) {
            DispatchQueue.main.async {
                parameters()
        }
    func parameters() {
        self.temperatureLabel.text = weather.temperatureString
        self.conditionImage.image = UIImage(systemName: weather.conditionName)
        self.cityLabel.text = weather.cityName
        self.view.backgroundColor = UIColor(red: weather.backgroundColor[0]/255.0, green: weather.backgroundColor[1]/255.0, blue: weather.backgroundColor[2]/255.0, alpha: 1.0)
        self.celsiusLabel.textColor = UIColor(red: weather.colorElements[0]/255.0, green: weather.colorElements[1]/255.0, blue: weather.colorElements[2]/255.0, alpha: 1.0)
        self.cityLabel.textColor = UIColor(red: weather.colorElements[0]/255.0, green: weather.colorElements[1]/255.0, blue: weather.colorElements[2]/255.0, alpha: 1.0)
        self.temperatureLabel.textColor = UIColor(red: weather.colorElements[0]/255.0, green: weather.colorElements[1]/255.0, blue: weather.colorElements[2]/255.0, alpha: 1.0)
        self.degreeLabel.textColor = UIColor(red: weather.colorElements[0]/255.0, green: weather.colorElements[1]/255.0, blue: weather.colorElements[2]/255.0, alpha: 1.0)
        self.returnButton.tintColor = UIColor(red: weather.colorElements[0]/255.0, green: weather.colorElements[1]/255.0, blue: weather.colorElements[2]/255.0, alpha: 1.0)
        }
    }
    func didFailWithError(error: Error) {
        print(error)
    }
}
