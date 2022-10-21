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
    
    var isActive = false
    
    var activeSize: CGFloat{
        return originalSize + 10
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        showNextPicture()
    }
    
    @objc func handleSwipe(_ sender: UISwipeGestureRecognizer) -> Void {
        guard !isActive else {return}
        hidePicture(currentPicture!)
        showNextPicture()
    }

    func showNextPicture() -> Void {
        if let newPicture = createPicture(){
            currentPicture = newPicture
            showPicture(newPicture)
            
            let tap = UITapGestureRecognizer(target: self, action: #selector(self.handleTap))
            newPicture.addGestureRecognizer(tap)
            
            let swipe = UISwipeGestureRecognizer(target: self, action: #selector(self.handleSwipe(_:)))
            
            swipe.direction = .up
            newPicture.addGestureRecognizer(swipe)
        }else{
            nextIndex = 0
            showNextPicture()
        }
    }
    
    
    @objc func handleTap(){
        isActive = !isActive
        
        
        if isActive{
            activeCurrentPicture()
        }else{
            deactiveCurrentPicture()
        }
    }
    
    func activeCurrentPicture(){
        UIView.animate(withDuration: 0.3) {
            self.currentPicture?.frame.size = CGSize(width: self.activeSize, height: self.activeSize)
            self.currentPicture?.layer.shadowOpacity = 0.5
            self.currentPicture?.layer.borderColor = UIColor.green.cgColor
        }
    }
    
    func deactiveCurrentPicture(){
        UIView.animate(withDuration: 0.3) {
            self.currentPicture?.frame.size = CGSize(width: self.originalSize, height: self.originalSize)
            self.currentPicture?.layer.shadowOpacity = 0
            self.currentPicture?.layer.borderColor = UIColor.darkGray.cgColor
        }
    }

    func createPicture() -> UIImageView?{
        guard nextIndex < gallery.count else { return nil }
        
        let imageView = UIImageView(image: gallery[nextIndex])
        imageView.frame = CGRect(x: self.view.frame.width, y: self.view.center.y - (originalSize/2), width: originalSize, height: originalSize)
        
        //Shadow
        imageView.layer.shadowColor = UIColor.black.cgColor
        imageView.layer.shadowOpacity = 0
        imageView.layer.shadowOffset = .zero
        imageView.layer.shadowRadius = 10
        
        //Frame
        imageView.layer.borderWidth = 2
        imageView.layer.borderColor = UIColor.darkGray.cgColor
        
        imageView.isUserInteractionEnabled = true
        
        nextIndex += 1
        return imageView
    }
    
    func showPicture(_ imageView: UIImageView){
        self.view.addSubview(imageView)
        
        UIView.animate(withDuration: 0.4) {
            imageView.center = self.view.center
        }
    }
    
    func hidePicture(_ imageView: UIImageView){
        
        UIView.animate(withDuration: 0.4) {
            self.currentPicture?.frame.origin.y = -self.originalSize
        } completion: { _ in
            imageView.removeFromSuperview()
        }

    }
}

