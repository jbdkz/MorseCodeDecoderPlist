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
    
    //Create empty array of dictionaries
    var encodeArray = [String:String]()
    
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

            for char in charArray{
               
            //Look for match in encodes array, if match add to strOutput
            for (key, value) in encodeArray {
                   if key == "\(char)"{
               print(value)
                   strOutput = strOutput + (value) + " "
                    
                //Print strOutput in txtOutput textbox
                txtOutput.text = strOutput
                 }
                }
              }
        }else{
            //Print error message
            let alertController = UIAlertController(title: "Alert", message: "Please enter text in the Input textbox", preferredStyle: .alert)
           
            let defaultAction = UIAlertAction(title: "OK", style: .default, handler: nil)
           alertController.addAction(defaultAction)
            
        present(alertController, animated: true, completion: nil)
       }
    }

    @IBAction func btnDecode(_ sender: Any) {
        
        var strOutput: String = ""
        
              //Check for null input
              if txtInput.text != "" {
      
           
           let strInput = txtInput.text
            
          // Replace spaces between morse code words with " * "
          let strInput1 = strInput?.replacingOccurrences(of: "   ", with: " * ")
        
          //Create code array
          let codeArray = strInput1?.components(separatedBy: " ")
            
          //For each code in codeArray
          for code in codeArray!{
    
           //Look for match in encodes array, if match add to strOutput
              for (key,value) in encodeArray {
                 if value == "\(code)"{
                    strOutput = strOutput + (key)
                    
                    // Replace "*" between letters words with " "
                    let strOutput1 = strOutput.replacingOccurrences(of: "*", with: " ")
                    
                    //Print strOutput in txtOutput textbox
                    txtOutput.text = strOutput1
                   }
               }
           }
        }else{
            //print error message
            let alertController = UIAlertController(title: "Alert", message: "Please enter code in the Input textbox", preferredStyle: .alert)
            
            let defaultAction = UIAlertAction(title: "OK", style: .default, handler: nil)
            alertController.addAction(defaultAction)
            
            present(alertController, animated: true, completion: nil)
        }
    }
 
    override func viewDidLoad() {
        super.viewDidLoad()
        //Read plist, convert to array of dictionaries
        if let path = Bundle.main.path(forResource: "Encode", ofType: "plist") {
            encodeArray = (NSDictionary(contentsOfFile: path) as? [String: String])!
            
            //Print all rows in dictionary, for TESTING ONLY.
            //for row in encodeArray{
            //print (row)
            //}
      }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

