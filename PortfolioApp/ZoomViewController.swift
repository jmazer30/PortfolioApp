//
//  ZoomViewController.swift
//  PortfolioApp
//
//  Created by  on 1/2/20.
//  Copyright © 2020 JordansEpicApps. All rights reserved.
//

import UIKit

class ZoomViewController: UIViewController {

    @IBOutlet weak var myImageVIew: UIImageView!
    
    var myImage = UIImage ()
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
            
        view.backgroundColor = UIColor.black
        myImageVIew.image = myImage
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(dismissFullscreenImage))
        myImageVIew.addGestureRecognizer(tap)
       

        // Do any additional setup after loading the view.
    }
    
    @IBAction func scalePiece(_ gestureRecognizer : UIPinchGestureRecognizer) {   guard gestureRecognizer.view != nil else { return }

    if gestureRecognizer.state == .began || gestureRecognizer.state == .changed {
       gestureRecognizer.view?.transform = (gestureRecognizer.view?.transform.scaledBy(x: gestureRecognizer.scale, y: gestureRecognizer.scale))!
       gestureRecognizer.scale = 1.0
    }}

  var initialCenter = CGPoint()  // The initial center point of the view.
    
  @IBAction func panPiece(_ gestureRecognizer : UIPanGestureRecognizer)
  {
     guard gestureRecognizer.view != nil else {return}
     let piece = gestureRecognizer.view!
     // Get the changes in the X and Y directions relative to
     // the superview's coordinate space.
     let translation = gestureRecognizer.translation(in: piece.superview)
     if gestureRecognizer.state == .began {
        // Save the view's original position.
        self.initialCenter = piece.center
     }
        // Update the position for the .began, .changed, and .ended states
     if gestureRecognizer.state != .cancelled {
        // Add the X and Y translation to the view's original position.
        let newCenter = CGPoint(x: initialCenter.x + translation.x, y: initialCenter.y + translation.y)
        piece.center = newCenter
     }
     else {
        // On cancellation, return the piece to its original location.
        piece.center = initialCenter
     }
  }
   
    @objc func dismissFullscreenImage(_ sender: UITapGestureRecognizer)
        {
      self.navigationController?.isNavigationBarHidden = false
            self.tabBarController?.tabBar.isHidden = false
    //        sender.view?.removeFromSuperview()
            dismiss(animated: true, completion: nil)
        }
}
