//
//  MusicViewController.swift
//  Music
//
//  Created by Anurita Srivastava on 20/02/17.
//  Copyright © 2017 Anurita Srivastava. All rights reserved.
//

import UIKit
import AVFoundation

class MusicViewController: UIViewController {
    
    var player:AVAudioPlayer = AVAudioPlayer()
    
  
    @IBOutlet weak var play: UIBarButtonItem!
    @IBOutlet weak var pause: UIBarButtonItem!
    
   
    
    @IBOutlet weak var timeText: UITextField!
    var time = 0.0
    var timer : Timer!
    
    @IBOutlet weak var slider: UISlider!
    override func viewDidLoad() {
        super.viewDidLoad()
    }
          override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
     
        let audioPath = Bundle.main.path(forResource: "Harry Potter", ofType: "mp3")
        var error:NSError? = nil
        do {
            player = try AVAudioPlayer(contentsOf: NSURL(fileURLWithPath: audioPath!) as URL)
        }
        catch {
            print("Something bad happened. Try catching specific errors to narrow things down")
        }
   let asset = AVURLAsset(url: URL(fileURLWithPath: audioPath! ))
        self.time = CMTimeGetSeconds(asset.duration)/60.0
        slider.minimumValue = 0
        slider.maximumValue = 100
 timeText.text = String(format:"%0.2f",time)
        self.timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(countDown), userInfo: nil, repeats: true)

                  }
    
    func countDown(){
        if !play.isEnabled{
        timeText.text = String(format:"%0.2f",time)
    var normalizedTime = Float(player.currentTime * 100.0 / player.duration)
        slider.value = normalizedTime
            
        self.time -= 0.01
        
        if time == 0{
            timer.invalidate()
            timer = nil
        }
        }
                }
   
 
    @IBAction func play(_ sender: UIBarButtonItem) {
        player.play()
        sender.isEnabled = false
        pause.isEnabled = true
        
                    }
    
    
    @IBAction func stop(sender: UIBarButtonItem) {
        player.stop()
        print(player.currentTime)
        player.currentTime = 0
        play.isEnabled = true
              slider.value = 0
       
       
    }
    
    
    @IBAction func pause(sender: UIBarButtonItem) {
        
        player.pause()
        sender.isEnabled = false
        play.isEnabled = true
        
    
    }
    
}


