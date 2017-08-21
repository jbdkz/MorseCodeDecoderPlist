//
//  ViewController.swift
//  MorseCodeDecoder
//
//  Created by John Diczhazy on 8/14/17.
//  Copyright © 2017 JohnDiczhazy. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var txtInput: UITextView!
    
    @IBOutlet weak var txtOutput: UITextView!
    
    //Create array of dictionaries
    let encodeArray = [["Char" : "A", "Code" : ".-"],
                  ["Char" : "B", "Code" : "-..."],
                  ["Char" : "C", "Code" : "-.-."],
                  ["Char" : "D", "Code" : "-.."],
                  ["Char" : "E", "Code" : "."],
                  ["Char" : "F", "Code" : "..-."],
                  ["Char" : "G", "Code" : "--."],
                  ["Char" : "H", "Code" : "...."],
                  ["Char" : "I", "Code" : ".."],
                  ["Char" : "J", "Code" : ".---"],
                  ["Char" : "K", "Code" : "-.-"],
                  ["Char" : "L", "Code" : ".-.."],
                  ["Char" : "M", "Code" : "--"],
                  ["Char" : "N", "Code" : "-."],
                  ["Char" : "O", "Code" : "---"],
                  ["Char" : "P", "Code" : ".--."],
                  ["Char" : "Q", "Code" : "--.-"],
                  ["Char" : "R", "Code" : ".-."],
                  ["Char" : "S", "Code" : "..."],
                  ["Char" : "T", "Code" : "-"],
                  ["Char" : "U", "Code" : "..-"],
                  ["Char" : "V", "Code" : "...-"],
                  ["Char" : "W", "Code" : ".--"],
                  ["Char" : "X", "Code" : "-..-"],
                  ["Char" : "Y", "Code" : "-.--"],
                  ["Char" : "Z", "Code" : "--.."],
                  ["Char" : "1", "Code" : ".----"],
                  ["Char" : "2", "Code" : "..---"],
                  ["Char" : "3", "Code" : "...--"],
                  ["Char" : "4", "Code" : "....-"],
                  ["Char" : "5", "Code" : "....."],
                  ["Char" : "6", "Code" : "-...."],
                  ["Char" : "7", "Code" : "--..."],
                  ["Char" : "8", "Code" : "---.."],
                  ["Char" : "9", "Code" : "----."],
                  ["Char" : "0", "Code" : "-----"],
                  ["Char" : "*", "Code" : " "],
                  ["Char" : " ", "Code" : "*"]]

    
    @IBAction func btnEncode(_ sender: Any) {
        var strOutput : String = ""
        
        //Check for null input
        if txtInput.text != "" {
        
        //Convert string to all Uppercase
        let strInput = txtInput.text.uppercased()
        
        //Display uppercase string in Input textbox.
        txtInput.text = strInput
        
        //Replace space in string with *
        let strInput1 = strInput.replacingOccurrences(of: " ", with: "*")
        
        //Convert string to characters
        let charInput = strInput1.characters
        
        //Create character array
        let charArray = Array(charInput)
            
            //For each character in charArray
            for char in charArray{
                
                //Look for match in encodes array, if match add to strOutput
                for dict in encodeArray {
                   if dict["Char"] == "\(char)"{
                    strOutput = strOutput + (dict["Code"]!) + " "
                    
                    //Print strOutput in txtOutput textbox
                    txtOutput.text = strOutput
                  }
                }
              }
        }else{
            let alertController = UIAlertController(title: "Alert", message: "Please enter text in the Input textbox", preferredStyle: .alert)
            
            let defaultAction = UIAlertAction(title: "OK", style: .default, handler: nil)
            alertController.addAction(defaultAction)
            
            present(alertController, animated: true, completion: nil)

          }
     }

    @IBAction func btnDecode(_ sender: Any) {
        
        var strOutput : String = ""
        
        //Check for null input
        if txtInput.text != "" {
            
            
            let strInput = txtInput.text
            
            // Replace spaces between morse code words with " 8 "
            let strInput1 = strInput?.replacingOccurrences(of: "   ", with: " * ")
            
            //Create code array
            let codeArray = strInput1?.components(separatedBy: " ")
            
            //For each code in codeArray
            for code in codeArray!{
                
                //Look for match in encodes array, if match add to strOutput
                for dict in encodeArray {
                    if dict["Code"] == "\(code)"{
                        strOutput = strOutput + (dict["Char"]!)
                        
                        //Print strOutput in txtOutput textbox
                        txtOutput.text = strOutput
                    }
                }
            }
        }else{
            let alertController = UIAlertController(title: "Alert", message: "Please enter code in the Input textbox", preferredStyle: .alert)
            
            let defaultAction = UIAlertAction(title: "OK", style: .default, handler: nil)
            alertController.addAction(defaultAction)
            
            present(alertController, animated: true, completion: nil)
            
        }
    }
 
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

