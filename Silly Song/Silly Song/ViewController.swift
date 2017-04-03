//
//  ViewController.swift
//  Silly Song
//
//  Created by Anurita Srivastava on 08/12/16.
//  Copyright © 2016 Anurita Srivastava. All rights reserved.
//


import UIKit




class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        nameField.delegate = self
    }
    
    @IBOutlet weak var nameField: UITextField!
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBOutlet weak var lyricsView: UITextView!

    @IBAction func reset(_ sender: Any) {
        nameField.text = ""
        lyricsView.text = ""
        
    }
    
    @IBAction func displayLyrics(_ sender: Any) {
        lyricsView.text=lyricsName(bananaFanaTemplate, nameField.text!)
        print(lyricsView.text)
    }
}
extension ViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return false
    }
    
}
import UIKit
var cset:NSCharacterSet=NSCharacterSet(charactersIn: "AIOUEaeiouáíúóéäïüöëãõÁÚÉÍÓÜÏÖÄËÃÕ")
func lyricsName(_ template: String,_ name: String)-> String{
    var bananatemplate = template
    
    func shortNameFromName(_ name: String)->String{
        var sname=name
        for ch in sname.unicodeScalars{
            if !cset.characterIsMember(unichar(ch.value)){
                sname.remove(at: sname.startIndex)
            }
            else
            {break}
            
        }
        return sname.lowercased()
    }
    
    let shortname=shortNameFromName(name)
    
    bananatemplate=bananatemplate.replacingOccurrences(of: "<FULL_NAME>" , with: name).replacingOccurrences(of: "<SHORT_NAME>", with: shortname)
    
    return bananatemplate.capitalized
}

let bananaFanaTemplate = [
    " <FULL_NAME>, <FULL_NAME>, Bo B<SHORT_NAME>",
    "Banana Fana Fo F<SHORT_NAME>",
    "Me My Mo M<SHORT_NAME>",
    "<FULL_NAME>"].joined(separator: "\n")

