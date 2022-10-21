//
//  ViewController.swift
//  Animel Gallery (Swipe and Pan Gesture Recognizer)
//
//  Created by Junaed Muhammad Chowdhury on 21/10/22.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var trashImageView: UIImageView!
    
    let gallery = [
        UIImage(named: "animel_1"),
        UIImage(named: "animel_2"),
        UIImage(named: "animel_3"),
        UIImage(named: "animel_4"),
        UIImage(named: "animel_5"),
        UIImage(named: "animel_6"),
        UIImage(named: "animel_7"),
        UIImage(named: "animel_8"),
        UIImage(named: "animel_9"),
        UIImage(named: "animel_10"),
        UIImage(named: "animel_11"),
        UIImage(named: "animel_12"),
        UIImage(named: "animel_13"),
        UIImage(named: "animel_14"),
        UIImage(named: "animel_15"),
        UIImage(named: "animel_16"),
        UIImage(named: "animel_17"),
        UIImage(named: "animel_19"),
        UIImage(named: "animel_18"),
        UIImage(named: "animel_20"),
        UIImage(named: "animel_21"),
        UIImage(named: "animel_22"),
        UIImage(named: "animel_23"),
        UIImage(named: "animel_24"),
        UIImage(named: "animel_25"),
        UIImage(named: "animel_26"),
        UIImage(named: "animel_27"),
        UIImage(named: "animel_28"),
        UIImage(named: "animel_29"),
        UIImage(named: "animel_30"),
        UIImage(named: "animel_31"),
        UIImage(named: "animel_32")
    ]
    
    var nextIndex = 0
    var currentPicture: UIImageView?
    let originalSize: CGFloat = 300
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    func createPicture() -> UIImageView?{
        guard nextIndex < gallery.count else { return nil }
        let imageView = UIImageView(image: gallery[nextIndex])
        
        nextIndex += 1
        return imageView
    }
}

