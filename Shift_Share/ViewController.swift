//
//  ViewController.swift
//  Shift_Share
//
//  Created by user167528 on 7/20/20.
//  Copyright © 2020 user167528. All rights reserved.
//

import UIKit
import AVKit

class ViewController: UIViewController {

    
    var videoPlayer:AVPlayer?
    
    var videoPlayerLayer:AVPlayerLayer?
    
    
    @IBOutlet weak var signUpButton: UIButton!
    
    
    @IBOutlet weak var logInButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
   
                setUpElements()
            }
            
            override func viewWillAppear(_ animated: Bool) {
                
                // Set up video in the background
                setUpVideo()
            }
            
            func setUpElements() {
                
                Utilities.styleFilledButton(signUpButton)
                Utilities.styleHollowButton(logInButton)
                
            }
            
            func setUpVideo() {
                
                // Get the path to the resource in the bundle
                let bundlePath = Bundle.main.path(forResource: "loginbg", ofType: "mp4")
                
                guard bundlePath != nil else {
                    return
                }
                
                // Create a URL from it
                let url = URL(fileURLWithPath: bundlePath!)
                
                // Create the video player item
                let item = AVPlayerItem(url: url)
                
                // Create the player
                videoPlayer = AVPlayer(playerItem: item)
                
                // Create the layer
                videoPlayerLayer = AVPlayerLayer(player: videoPlayer!)
                
                // Adjust the size and frame
                videoPlayerLayer?.frame = CGRect(x: -self.view.frame.size.width*1.5, y: 0, width: self.view.frame.size.width*4, height: self.view.frame.size.height/1.5)
                
                view.layer.insertSublayer(videoPlayerLayer!, at: 0)
                
                // Add it to the view and play it
                videoPlayer?.playImmediately(atRate: 0.3)
            }

    @IBAction func signUpButton(_ sender: Any) {
  self.performSegue(withIdentifier: "SignUp", sender: self)
    }
    
    @IBAction func logInButton(_ sender: Any) {
          self.performSegue(withIdentifier: "LogIn", sender: self)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
      if segue.identifier=="SignUp"{
          _ = segue.destination as! SignUpViewController
      }
        else if segue.identifier=="LogIn"
      {        _ = segue.destination as! LogInViewController
        
    }
      else {
        return
        }
}
}
