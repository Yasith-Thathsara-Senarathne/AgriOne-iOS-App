//
//  tempretureViewController.swift
//  AgriOne App
//
//  Created by Yasith Thathsara Senarathne on 3/7/20.
//  Copyright © 2020 Yasith Thathsara Senarathne. All rights reserved.
//

import MNkSupportUtilities

class TemperatureViewController:MNkViewController {
    
    override func config() {
        title = "Temperature Spreding"
        view.backgroundColor = AppColor.white
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.prefersLargeTitles = false
    }
}
