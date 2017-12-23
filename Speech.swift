//
//  Responses.swift
//  Outloud
//
//  Created by Oliver Frost on 27/05/2016.
//  Copyright © 2016 Oliver Frost. All rights reserved.
//

import Foundation
import UIKit

// Colours
let backgroundColour = GMColor.yellow200Color()
let textColour = GMColor.grey800Color()
let darktextColour = GMColor.grey800Color()
let normalTextColour = GMColor.whiteColor()


// Speech Handling
var rate: Float!
var pitch: Float!
var volume: Float!
var voice: String!
var character: Int!
var speaking: Bool?

func setSpeech(_ newRate: Float, newPitch: Float, newVol: Float, newVoice: String) {
    rate = newRate
    pitch = newPitch
    volume = newVol
    voice = newVoice
    speaking = true
    
}

func saveCharacter(_ newCharacter: Int) {
    defaults.set(newCharacter, forKey: "character")
}

func muteSwitch() {
    speaking = false
}


// MARK: MENU RESPONSES

let voices = ["👨🏻  Straight Dave",  "👩🏼  Sarcastic Sam", "👸🏻  Cheesy Cheryl", "👱🏽  Confused Fred", "👩🏽  Elegant Eleanor", "👵🏻  Evil Eddie", ]
let speechVoices = [Voices.dave.setSpeechVoice, Voices.sarcastic.setSpeechVoice, Voices.positive.setSpeechVoice, Voices.foggy.setSpeechVoice, Voices.african.setSpeechVoice, Voices.cranky.setSpeechVoice]
var Responses: Bool = true


enum Voices : Int {
    case sarcastic, dave, irish, african, chirpy, cranky, aussie, negative, positive, foggy, mute;
    
    func setSpeechVoice() {
        switch (self) {
        
        case .sarcastic:
            saveCharacter(Voices.sarcastic.rawValue)
            
            setSpeech(0.25, newPitch: 1.1, newVol: 1.0, newVoice: "com.apple.ttsbundle.Samantha-compact")
        
        case .dave:
            saveCharacter(Voices.dave.rawValue)
            
            setSpeech(0.2, newPitch: 0.9, newVol: 1.0, newVoice: "com.apple.ttsbundle.Daniel-compact")

        case .chirpy:
            saveCharacter(Voices.chirpy.rawValue)
            
            setSpeech(0.525, newPitch: 1.5, newVol: 1.0, newVoice: "en-GB")
            
        case .foggy:
            saveCharacter(Voices.foggy.rawValue)
            
            setSpeech(0.30, newPitch: 0.9, newVol: 1.0, newVoice: "com.apple.ttsbundle.Moira-compact")
        
            
        case .cranky:
            saveCharacter(Voices.cranky.rawValue)
            
            setSpeech(0.3, newPitch: 0.2, newVol: 1.0, newVoice: "com.apple.ttsbundle.Karen-compact")

            
        case .negative:
            saveCharacter(Voices.negative.rawValue)
            
            setSpeech(0.355, newPitch: 1.0, newVol: 1.0, newVoice: "en-US")
            
            
        case .aussie:
            saveCharacter(Voices.aussie.rawValue)
            
            setSpeech(0.5, newPitch: 1.0, newVol: 1.0, newVoice: "en-AU")

        
        case .irish:
            saveCharacter(Voices.irish.rawValue)
            
            setSpeech(0.5, newPitch: 1.4, newVol: 1.0, newVoice: "en-IE")

        
        case .african:
            saveCharacter(Voices.african.rawValue)
            
            setSpeech(0.4, newPitch: 1.15, newVol: 1.0, newVoice: "en-ZA")
            
        case .positive:
            saveCharacter(Voices.positive.rawValue)
            
            setSpeech(0.5, newPitch: 1.5, newVol: 1.0, newVoice: "en-US")

        case .mute:
            saveCharacter(Voices.mute.rawValue)
            muteSwitch()
        }
    }
}

// MARK: CHARACTER RESPONSES

func loadDefaultSpeech() {
    Voices.sarcastic.setSpeechVoice()
    
   // character = defaults.value(forKey: "character") as! Int
  //  Voices.init(rawValue: character)?.setSpeechVoice()
}

extension Array {
    func randomItem() -> Element {
        let index = Int(arc4random_uniform(UInt32(self.count)))
        return self[index]
    }
}
