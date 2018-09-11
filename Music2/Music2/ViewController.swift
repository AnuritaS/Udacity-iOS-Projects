//
//  ViewController.swift
//  Music2
//
//  Created by Anurita Srivastava on 20/02/17.
//  Copyright © 2017 Anurita Srivastava. All rights reserved.
//

import UIKit
import AVKit
import AVFoundation

class ViewController: AVPlayerViewController {

    var audioPlayer: AVAudioPlayer?
    override func viewDidLoad() {
        super.viewDidLoad()
       
        // Do any additional setup after loading the view, typically from a nib.
        let path = Bundle.main.path(forResource: "Harry Potter", ofType: "mp3")
        var error:NSError?
        do{
            audioPlayer = try AVAudioPlayer(contentsOf: URL(string: path!)!)
        }catch{
            print(error)
        }
       
    }
    
   
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

  
}

