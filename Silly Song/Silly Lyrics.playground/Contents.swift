//: Playground - noun: a place where people can play

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
