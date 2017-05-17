//
//  ViewController.swift
//  RomanToBase10
//
//  Created by Vignan Kumar on 4/20/17.
//  Copyright © 2017 Vignan Kumar. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var tokens = ["M", "CM", "D", "CD", "CCC", "CC", "C", "XC", "L", "XL", "XXX", "XX", "X", "IX", "V", "IV", "III", "II", "I"]
    var values = [1000, 900, 500, 400, 300, 200, 100, 90, 50, 40, 30, 20, 10, 9, 5, 4, 3, 2, 1]
    var invalid = ["CMCM", "CMD", "CMCD", "CMC", "DD", "DCD", "CDCD", "CDC", "CCCC", "XCXC", "XCL", "XCXL", "XCX", "LL", "LXL", "XLXL", "XLX", "XXXX", "IXIX", "IXV", "IXIV", "IXI", "IVIV", "IVI", "IIII", "VV", "VIV"]
    var replace = ["MDCCC", "MCD", "MIII", "M", "M", "CM", "DCCC", "D", "CD", "CLXXX", "CXL", "CIII", "C", "C", "XC", "LXXX", "L", "XL", "XVIII", "XIV", "XIII", "X", "VIII", "V", "IV", "X", "IX"]
    var validCharacters = ["I","V","X","L","C","D","M"]
    var validInput = true
    
    enum MyError : Error {
        case RuntimeError(String)
    }
    
    @IBOutlet weak var romanNumberTF: UITextField!
    @IBOutlet weak var base10LBL: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func convertToBase10(_ sender: Any) {
        validInput = true
        base10LBL.text = (conversion(romanNumber: romanNumberTF.text!.uppercased())) == 0 ? "Error" : "\(conversion(romanNumber: romanNumberTF.text!.uppercased()))"
    }
    
    func getNextToken(romanNumber:String, position:Int ) throws -> Int {
        for i in 0 ..< invalid.count {
            if let range = romanNumber.range(of: invalid[i]) {
                if romanNumber.distance(from: romanNumber.startIndex, to: (range.lowerBound)) == position {
                    //Error
                    validInput = false
                }
            }
        }
        for i in 0 ..< tokens.count {
            if let range = romanNumber.range(of: tokens[i]) {
                if romanNumber.distance(from: romanNumber.startIndex, to: (range.lowerBound)) == position {
                    return i
                }
            }
        }
        return 1
    }
    
    func conversion(romanNumber:String) -> Int {
        var replacedString = romanNumber.uppercased()
        
        for i in 0..<replacedString.characters.count {
            if validCharacters.contains("\(replacedString.charAt(index: i))") && validInput {
                
            } else {
                validInput = false
            }
        }
        
        var pos = 0
        var val = 0
        var t1 = -1
        
        if validInput {
            while pos < replacedString.characters.count {
                do {
                    let t = try self.getNextToken(romanNumber: replacedString, position: pos)
                    if t1 != -1 {
                        if self.values[t1] < self.values[t] {
                            //Error
                            throw MyError.RuntimeError("Error")
                        }
                    }
                    pos += self.tokens[t].characters.count
                    val += self.values[t]
                    t1 = t
                }
                catch MyError.RuntimeError(let errorMessage) {
                    print(errorMessage)
                    val = 0
                    break
                } catch {
                    break
                }
            }
        }
        return val
    }
}

extension String {
    func charAt(index: Int) -> Character {
        return [Character](characters)[index]
    }
}
