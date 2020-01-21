//
//  ViewController.swift
//  PortfolioApp
//
//  Created by  on 11/14/19.
//  Copyright © 2019 JordansEpicApps. All rights reserved.
//

import UIKit; let imageCache = NSCache<AnyObject, AnyObject>()
import SDWebImage




class ViewController: UIViewController
{
    @IBOutlet weak var myImageView: UIImageView!
    
    var myImages: [UIImage] = [UIImage]()
    var count = 0
    
    var arrayOfURLs: [String] = [String]()
    override func viewDidLoad()
      
        
        
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
       
        readwebsite()
        if arrayOfURLs.count > 1
        {
            arrayOfURLs.removeFirst()
        }
        
//        for i in 0..<arrayOfURLs.count
//        {
//            myImageView.sd_setImage(with: URL(string: arrayOfURLs[0]), placeholderImage: UIImage(named: "17"))
//
//
////            myImages.append(<#T##newElement: UIImage##UIImage#>)
//        }
         myImageView.sd_setImage(with: URL(string: arrayOfURLs[0]), placeholderImage: UIImage(named: "11"))
        
        
//        myImages = [UIImage(named: "1")!, UIImage(named: "2")!, UIImage(named: "3")!, UIImage(named: "16")!, UIImage(named: "4")!, UIImage(named: "5")!, UIImage(named: "6")!, UIImage(named: "7")!, UIImage(named: "8")!, UIImage(named: "9")!, UIImage(named: "10")!, UIImage(named: "11")!, UIImage(named: "12")!, UIImage(named: "13")!, UIImage(named: "14")!, UIImage(named: "15")!, UIImage(named: "17")!]
//        myImageView.image = myImages [0]
        
       // myImageView.sd_setImage(with: URL(string: "https://lh5.googleusercontent.com/SFyKYVJkLuSnCDw6G60aPT9990TUpJ5Xy8UqSdzQwWwobbdheujZBnCDtnb6Xz2lwhIsJ88=w16383"), placeholderImage: UIImage(named: "17"))
        
    }
   
    @IBAction func imageTapped(_ sender: UITapGestureRecognizer)
    {
        performSegue(withIdentifier: "imageSegue", sender: self)
//         let imageView = sender.view as! UIImageView
//            let newImageView = UIImageView(image: imageView.image)
//            newImageView.frame = UIScreen.main.bounds
//            newImageView.backgroundColor = .black
//            newImageView.contentMode = .scaleAspectFit
//            newImageView.isUserInteractionEnabled = true
//            let tap = UITapGestureRecognizer(target: self, action: #selector(dismissFullscreenImage))
//            newImageView.addGestureRecognizer(tap)
//            self.view.addSubview(newImageView)
//            self.navigationController?.isNavigationBarHidden = true
//            self.tabBarController?.tabBar.isHidden = true
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
              // CHECK OUT OF BOUNDS AND FIX
//              if self.count >= self.myImages.count
            if self.count >= self.arrayOfURLs.count
              {
                  self.count = 0
              }
            self.myImageView.sd_setImage(with: URL(string: self.arrayOfURLs[self.count]), placeholderImage: UIImage(named: "17"))
            
//              self.myImageView.image = self.myImages[self.count]
              
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
//            if self.count < 0
            if self.count < 0
                {
                //self.count = self.myImages.count - 1
                self.count = self.arrayOfURLs.count - 1
                }
              // self.myImageView.image = self.myImages[self.count]
               self.myImageView.sd_setImage(with: URL(string: self.arrayOfURLs[self.count]), placeholderImage: UIImage(named: "17"))
                      
                self.myImageView.center = CGPoint(x: -150, y: self.myImageView.center.y)
                UIView.animate(withDuration: 0.6, animations:
             {
               self.myImageView.center = self.view.center
             }, completion: nil)
            
                      
           })
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "imageSegue"
        {
            let dest = segue.destination as! ZoomViewController
            dest.myImage = myImageView.image!
        }
    }
    
    func readwebsite ()
    {
        if let url = URL(string: "https://docs.google.com/document/d/1j4qIezidNjpWHSdma3SIEe_MHsCuZz6HDtMXp-4OL_4/edit?usp=sharing") {
            do {
                var contents = try String(contentsOf: url)
                
//                print(contents)
                
                // conditional google.com and https://lh4.googleusercontent.com/hSN9p295X0juKmqMHQU5KhMNePv7CEaEBLHLXVRfJj1WhNL1OmFjtGfRVaFw1DRyrVIQ1g=w1200-h630-p
                // get rid of duplicate links
                
                var substring = contents
                while (contents.index(of: "https://lh") != nil)
                {
                    guard let ind = contents.index(of: "https://lh") else { return  }
                    substring = String(contents.suffix(from: ind))
                    
                    
                    guard let quoteind = substring.index(of: "\"") else {return}
    //                print(ind)
    //                print(quoteind)
                    let pictureurl = String(substring[..<quoteind])
                    
                   print(pictureurl)
                    if !arrayOfURLs.contains(pictureurl)
                    {
                       arrayOfURLs.append(pictureurl)
                    }
                    
                    
                    
                    // throw out picture url
                    
                    contents = String(contents.suffix(from: quoteind))
                }
            //    print(arrayOfURLs)
                
                
            } catch {
                // contents could not be loaded
            }
        } else {
            // the URL was bad!
        }
    }
    
    
    
}

