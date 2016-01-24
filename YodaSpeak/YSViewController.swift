//
//  ViewController.swift
//  YodaSpeak
//
//  Created by Varindra Hart on 1/18/16.
//  Copyright © 2016 Varindra Hart. All rights reserved.
//

import UIKit
import Alamofire

class YSViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var userTextInputField: UITextField!
    @IBOutlet weak var yodaResponseContainer: UIView!
    @IBOutlet weak var yodaTextView: UITextView!

    let yodaRequestHandler = YSRequestHandler.init()

    override func viewDidLoad() {
        super.viewDidLoad()

        self.userTextInputField.delegate = self
    }

// MARK:- TextFieldDelegate

    func textFieldShouldReturn(textField: UITextField) -> Bool {
        if isTextValid(textField.text){
            self.yodaResponseContainer.alpha = 0.0
            convertToYodaSpeak(textField.text!)
        }
        self.view.endEditing(true)
        return true
    }


// MARK:- Text Handling
    func isTextValid(text:String?) -> Bool {

        guard text != nil else {
            return false
        }

        let charSet = NSCharacterSet.whitespaceAndNewlineCharacterSet()

        return text!.stringByTrimmingCharactersInSet(charSet).characters.count > 0
    }


    func convertToYodaSpeak(text: String) {
        yodaRequestHandler.getYodaSpeakForString(text) { (yodaSpeakString: String) in

            self.yodaTextView.text = yodaSpeakString
            self.animateResponseViewAlpha()
        }

    }

    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.view.endEditing(true)
    }

// MARK: - Fade In Animation
    func animateResponseViewAlpha() {

        UIView.animateWithDuration(0.5, animations: { () -> Void in
            self.yodaResponseContainer.alpha = 1.0
            }, completion: nil)

    }

}

