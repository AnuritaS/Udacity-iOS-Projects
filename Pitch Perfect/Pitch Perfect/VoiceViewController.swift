//
//  VoiceViewController.swift
//  Pitch Perfect
//
//  Created by Anurita Srivastava on 18/12/16.
//  Copyright © 2016 Anurita Srivastava. All rights reserved.
//

import UIKit
import AVFoundation

class VoiceViewController: UIViewController {
    
    @IBOutlet weak var snailButton: UIButton!
    @IBOutlet weak var chipmunkButton: UIButton!
    @IBOutlet weak var rabbitButton: UIButton!
    @IBOutlet weak var vaderButton: UIButton!
    @IBOutlet weak var echoButton: UIButton!
    @IBOutlet weak var reverbButton: UIButton!
    @IBOutlet weak var stopButton: UIButton!
    
    var recordedAudioURL:URL!
    var audioFile:AVAudioFile!
    var audioEngine:AVAudioEngine!
    var audioPlayerNode: AVAudioPlayerNode!
    var stopTimer: Timer!
    
    enum ButtonType: Int {
        case slow = 0, fast, vader, chipmunk, echo, reverb
    }
    
    
    @IBAction func playSoundForButton(_ sender: UIButton) {
        print("Play Sound Button Pressed")
        switch(ButtonType(rawValue: sender.tag)!){
        case .slow :
            playSound(rate :0.3)
        case .fast :
                playSound(rate: 2.5)
        case .vader :
            playSound(pitch: -1100)
        case .chipmunk :
                    playSound(pitch: 1200)
        case .echo :
            playSound(echo: true)
        case .reverb:
            playSound(reverb :true)
        }
        configureUI(.playing)
    }
    @IBAction func stopButtonPressed(_ sender: AnyObject) {
        print("Stop Audio Button Pressed")
        stopAudio()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
 setupAudio()
    }

    override func viewWillAppear(_ animated: Bool) {
        configureUI(.notPlaying)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
