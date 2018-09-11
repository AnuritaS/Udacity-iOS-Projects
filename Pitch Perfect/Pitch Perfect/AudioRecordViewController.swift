//
//  AudioRecordViewController.swift
//  Pitch Perfect
//
//  Created by Anurita Srivastava on 08/12/16.
//  Copyright © 2016 Anurita Srivastava. All rights reserved.
//

import UIKit
import AVFoundation

class AudioRecordViewController: UIViewController, AVAudioRecorderDelegate {
    
   var audioRecorder: AVAudioRecorder!
    
    @IBOutlet weak var recordButton: UIButton!
    @IBOutlet weak var stopRecordButton: UIButton!
    @IBOutlet weak var recordLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        stopRecordButton.isEnabled = false
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("viewWillAppear is called")
    }

    @IBAction func startRecord(_ sender: Any) {
        print("Record button pressed")
        recordLabel.text = "Recording..."
        recordButton.isEnabled = false
        stopRecordButton.isEnabled = true
        
        let dirPath = NSSearchPathForDirectoriesInDomains(.documentDirectory,.userDomainMask, true)[0] as String
        let recordingName = "recordedVoice.wav"
        let pathArray = [dirPath, recordingName]
        let filePath = URL(string: pathArray.joined(separator: "/"))
        
        let session = AVAudioSession.sharedInstance()
        try! session.setCategory(AVAudioSessionCategoryPlayAndRecord, with:AVAudioSessionCategoryOptions.defaultToSpeaker)
        
        try! audioRecorder = AVAudioRecorder(url: filePath!, settings: [:])
        audioRecorder.delegate = self
        audioRecorder.isMeteringEnabled = true
        audioRecorder.prepareToRecord()
        audioRecorder.record()
           }
   
    @IBAction func stopRecord(_ sender: Any) {
        print("Stop Record button pressed")
        recordLabel.text = "Tap to record!"
recordButton.isEnabled = true
        stopRecordButton.isEnabled = false
        audioRecorder.stop()
         let audioSession = AVAudioSession.sharedInstance()
        try! audioSession.setActive(false)
        
    }
    func audioRecorderDidFinishRecording(_ recorder: AVAudioRecorder, successfully flag: Bool) {
        if flag{
            performSegue(withIdentifier: "secondView", sender: audioRecorder.url)
        }
        else{
            print("Recording was not successful")
        }
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "secondView" {
        let VoicesVC = segue.destination as! VoiceViewController
            let recordedAudioURL = sender as! URL
            VoicesVC.recordedAudioURL = recordedAudioURL
        }
    }
}

