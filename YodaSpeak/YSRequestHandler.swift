//
//  YSRequestHandler.swift
//  YodaSpeak
//
//  Created by Varindra Hart on 1/19/16.
//  Copyright © 2016 Varindra Hart. All rights reserved.
//

import UIKit
import Alamofire

class YSRequestHandler{

    private let MASHAPE_KEY  = "93YpnQrUUAmsh7nyIqmwZAUa25Cbp1mYrsijsna1QLgBroKUts"
    private let yodaEndpoint = "https://yoda.p.mashape.com/yoda?sentence="
    private var lastRequest : Alamofire.Request? = nil

    func getYodaSpeakForString(textInput :String, completion: (yodaSpeakString : String) -> Void) {

        invalidateAndCancelOldRequests()

        let urlString = yodaSpeakURLForString(textInput)

        lastRequest = Alamofire.request(.GET, urlString, parameters: nil , encoding: .JSON, headers: ["X-Mashape-Key":MASHAPE_KEY, "Accept":"text/plain"]).responseString{
            response in

            if response.result.isSuccess {
                completion(yodaSpeakString: response.result.value!)
            }
            else{
                completion(yodaSpeakString: "Thinking, Yoda is")
            }
        }
    }

    private func yodaSpeakURLForString(textInput : String) ->String {
        return yodaEndpoint+textInput.stringByReplacingOccurrencesOfString(" ", withString: "+").stringByAddingPercentEncodingWithAllowedCharacters(NSCharacterSet.URLQueryAllowedCharacterSet())!
    }

    private func invalidateAndCancelOldRequests(){
        if self.lastRequest != nil {
            self.lastRequest?.cancel()
            self.lastRequest?.resume()
        }
    }
}
