//
//  ViewController.swift
//  Clima
//
//  Created by Filipe Simões on 05/03/24.
//

import UIKit
import CoreLocation

class WeatherViewController: UIViewController {
    
    //@IBOutlet weak var conditionImageView: UIImageView!
    //@IBOutlet weak var temperatureLabel: UILabel!
    //@IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var searchTextField: UITextField!
        
    var weatherManager = WeatherManager()
    let locationManager = CLLocationManager()
    var lastCity = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.requestLocation()
        
        //weatherManager.delegate = self
        searchTextField.delegate = self
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult" {
            let destinationVC = segue.destination as! SearchViewController
            destinationVC.city = lastCity
        }
    }

}

//MARK: - UITextFieldDelegate

extension WeatherViewController: UITextFieldDelegate {
    
    @IBAction func searchPressed(_ sender: UIButton) {
        searchTextField.endEditing(true)
        performSegue(withIdentifier: "goToResult", sender: self)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        searchTextField.endEditing(true)
        return true
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        if textField.text != "" {
            return true
        } else {
            textField.placeholder = "Digite uma Cidade"
            return false
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        
        if let city = searchTextField.text {
            lastCity = city
        }
        searchTextField.text = ""
    }
}

//MARK: - WeatherManagerDelegate


//extension WeatherViewController: WeatherManagerDelegate {
//    
//    func didUpdateWeather(_ weatherManager: WeatherManager, weather: WeatherModel) {
//        DispatchQueue.main.async {
//            self.temperatureLabel.text = weather.temperatureString
//            self.conditionImageView.image = UIImage(systemName: weather.conditionName)
//            self.cityLabel.text = weather.cityName
//        }
//    }
//    
//    func didFailWithError(error: Error) {
//        print(error)
//    }
//}

//MARK: - CLLocationManagerDelegate


extension WeatherViewController: CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.last {
            locationManager.stopUpdatingLocation()
            let lat = location.coordinate.latitude
            let lon = location.coordinate.longitude
            weatherManager.fetchWeather(latitude: lat, longitude: lon)
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error)
    }
}
