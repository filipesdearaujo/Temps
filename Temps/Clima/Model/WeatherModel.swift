//
//  WeatherModel.swift
//  Clima
//
//  Created by Filipe Simões on 05/03/24.
//

import Foundation

struct WeatherModel {
    let conditionId: Int
    let cityName: String
    let temperature: Double
    
    var temperatureString: String {
        return String(format: "%.1f", temperature)
    }

    var conditionName: String {
        switch conditionId {
        case 200...232:
            return "cloud.bolt"
        case 300...321:
            return "cloud.drizzle"
        case 500...531:
            return "cloud.rain"
        case 600...622:
            return "cloud.snow"
        case 701...781:
            return "cloud.fog"
        case 800:
            return "circle.fill"
        case 801...804:
            return "cloud.bolt"
        default:
            return "cloud"
        }
    }
    
    var backgroundColor: [CGFloat] {
        switch conditionId {
        case 200...232:
            return [35, 45, 72] //"232D48" - cloud.bolt
        case 300...321:
            return [35, 45, 72] //"232D48" - cloud.drizzle
        case 500...531:
            return [35, 45, 72] //"232D48" - cloud.rain
        case 600...622:
            return [35, 45, 72] //"232D48" - cloud.snow
        case 701...781:
            return [35, 45, 72] //"232D48" - cloud.fog
        case 800:
            return [247, 233, 191] //"F7E9BF" - circle.fill - sol
        case 801...804:
            return [35, 45, 72] //"232D48" - cloud.bolt - nuvem com trovao
        default:
            return [112, 112, 112] //"707070" - cloud
        }
    }
    
    var colorElements: [CGFloat] {
        switch conditionId {
        case 200...232:
            return [255, 255, 255] //"232D48" - cloud.bolt
        case 300...321:
            return [255, 255, 255] //"232D48" - cloud.drizzle
        case 500...531:
            return [255, 255, 255] //"232D48" - cloud.rain
        case 600...622:
            return [255, 255, 255] //"232D48" - cloud.snow
        case 701...781:
            return [255, 255, 255] //"232D48" - cloud.fog
        case 800:
            return [0, 0, 0] //"F7E9BF" - circle.fill - sol
        case 801...804:
            return [255, 255, 255] //"232D48" - cloud.bolt - nuvem com trovao
        default:
            return [255, 255, 255] //"707070" - cloud
        }
    }    
}
