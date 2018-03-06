//
//  MainMenuModel.swift
//  UltimateTest
//
//  Created by SMILEY-ANDREWS, Simon on 6/3/18.
//  Copyright © 2018 SMILEY-ANDREWS, Simon. All rights reserved.
//

import Foundation

class MainMenuModel: NSObject {
    
    let menuTitles: [String] = ["About", "Teams", "Players", "Matches"]
    
    func getTitle(for path: IndexPath) -> String? {
        return menuTitles[path.row]
    }
    
    func getNumberOfRowsInSection() -> NSInteger {
        return menuTitles.count        
    }
}
