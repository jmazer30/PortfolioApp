//
//  ViewController.swift
//  PortfolioApp
//
//  Created by  on 11/14/19.
//  Copyright © 2019 JordansEpicApps. All rights reserved.
//

import UIKit

class ViewController: UIViewController
{
    @IBOutlet weak var myImageView: UIImageView!
    var myImages: [UIImage] = [UIImage]()
    
    var count = 0
    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        myImages = [UIImage(named: "1")!, UIImage(named: "2")!, UIImage(named: "3")!, UIImage(named: "16")!, UIImage(named: "4")!, UIImage(named: "5")!, UIImage(named: "6")!, UIImage(named: "7")!, UIImage(named: "8")!, UIImage(named: "9")!, UIImage(named: "10")!, UIImage(named: "11")!, UIImage(named: "12")!, UIImage(named: "13")!, UIImage(named: "14")!, UIImage(named: "15")!, UIImage(named: "17")!]
        myImageView.image = myImages [0]
    }
    
    @IBAction func imageTapped(_ sender: UITapGestureRecognizer)
    {
         let imageView = sender.view as! UIImageView
            let newImageView = UIImageView(image: imageView.image)
            newImageView.frame = UIScreen.main.bounds
            newImageView.backgroundColor = .black
            newImageView.contentMode = .scaleAspectFit
            newImageView.isUserInteractionEnabled = true
            let tap = UITapGestureRecognizer(target: self, action: #selector(dismissFullscreenImage))
            newImageView.addGestureRecognizer(tap)
            self.view.addSubview(newImageView)
            self.navigationController?.isNavigationBarHidden = true
            self.tabBarController?.tabBar.isHidden = true
        }

        @objc func dismissFullscreenImage(_ sender: UITapGestureRecognizer)
        {
            self.navigationController?.isNavigationBarHidden = false
            self.tabBarController?.tabBar.isHidden = false
            sender.view?.removeFromSuperview()
        }
    
    @IBAction func swipeImagesRight(_ sender: UISwipeGestureRecognizer)
    {
        changeImageRight()
    }
    
    @IBAction func swipeImages(_ sender: UISwipeGestureRecognizer)
    {
        changeImageLeft()
    }
    
    @IBAction func slideUP(_ sender: UIButton)
    {
        changeImageLeft()
    }
    
    @IBAction func slideBACK(_ sender: UIButton)
    {
       changeImageRight()
    }
   
    func changeImageLeft()
    {
        UIView.animate(withDuration: 0.7, animations:
          {
              self.myImageView.center = CGPoint(x: -600, y: self.myImageView.center.y)
          },
        completion:
          {
              completion in
              self.count = self.count + 1
              // CHECK OUT OF BOUMDS AND FIX
              if self.count >= self.myImages.count
              {
                  self.count = 0
              }
              self.myImageView.image = self.myImages[self.count]
              
              self.myImageView.center = CGPoint(x: 600, y: self.myImageView.center.y)
              UIView.animate(withDuration: 0.6, animations:
              {
                  self.myImageView.center = self.view.center
              }, completion: nil)
              
          })
    }
  
    func changeImageRight()
    {
        UIView.animate(withDuration: 0.7, animations:
                  {
                self.myImageView.center = CGPoint(x: 600, y: self.myImageView.center.y)
                  },
               
        completion:
        {
            completion in
            self.count = self.count - 1
            if self.count < 0
                {
                self.count = self.myImages.count - 1
                }
               self.myImageView.image = self.myImages[self.count]
                      
                self.myImageView.center = CGPoint(x: -150, y: self.myImageView.center.y)
                UIView.animate(withDuration: 0.6, animations:
             {
               self.myImageView.center = self.view.center
             }, completion: nil)
            
                      
           })
    }

    
    
}

