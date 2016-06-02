//
//  Game.swift
//  GameShop
//
//  Created by Alican Toprak on 02.06.16.
//  Copyright © 2016 Alican Toprak. All rights reserved.
//

import Foundation


class Game {
    
    let title, cover, system, price: String
    var _selected: Bool
    var selected:Bool {
        get{
            return _selected
        }
        set(value){
            self._selected = value
        }
    }
    
    init(title: String, cover: String, system: String, price: String){
        self.title = title
        self.cover = cover
        self.system = system
        self.price = price
        self._selected = false
    }
    
}