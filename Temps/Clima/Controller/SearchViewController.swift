//
//  SearchViewController.swift
//  Clima
//
//  Created by Filipe Simões on 05/03/24.
//

import UIKit

class SearchViewController: UIViewController {

    @IBOutlet weak var conditionImage: UIImageView!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var returnButton: UIButton!
    
    var city: String = ""
    var weatherManager = WeatherManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        weatherManager.delegate = self
        // Do any additional setup after loading the view.
        print(city)
        weatherManager.fetchWeather(cityName: city)
        viewSetup()
    }
    
    @IBAction func returnPressed(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    func viewSetup() {
        returnButton.layer.cornerRadius = returnButton.bounds.height/2
        returnButton.layer.cornerRadius = returnButton.bounds.height/2
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension SearchViewController: WeatherManagerDelegate {

    func didUpdateWeather(_ weatherManager: WeatherManager, weather: WeatherModel) {
            DispatchQueue.main.async {
            self.temperatureLabel.text = weather.temperatureString
            self.conditionImage.image = UIImage(systemName: weather.conditionName)
            self.cityLabel.text = weather.cityName
        }
    }
    
    func didFailWithError(error: Error) {
        print(error)
    }
}
