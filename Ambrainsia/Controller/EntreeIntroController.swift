//
//  EntreeIntroController.swift
//  Ambrainsia
//
//  Created by Timothy Itodo on 5/22/19.
//  Copyright © 2019 Timothy Itodo. All rights reserved.
//

import UIKit

class EntreeIntroController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        Timer.scheduledTimer(timeInterval: 3.0, target: self, selector: #selector(timeToMoveOn), userInfo: nil, repeats: false)
        
    }
    
    @objc func timeToMoveOn() {
        self.performSegue(withIdentifier: "goToEntree", sender: self)
    }
}
