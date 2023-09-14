//
//  InfoCurrency.swift
//  ExhangerApp
//
//  Created by Şükrü Şimşek on 11.09.2023.
//

import Foundation

struct Currency{
    var code: String = ""
    var value: Double = 0
    var image: String{
        return code + ".png"
    }
    
}
