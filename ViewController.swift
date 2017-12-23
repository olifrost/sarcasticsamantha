//
//  ViewController.swift
//  TrollBot
//
//  Created by Oliver Frost on 28/06/2016.
//  Copyright © 2016 Oli and Josie. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController, AVSpeechSynthesizerDelegate, UITextFieldDelegate {
    @IBOutlet weak var emoji: UIImageView!
    
    let speechSynthesizer = AVSpeechSynthesizer()
    var Response: String?
    var Feedback: String?
    var Phrase: String?
   
    @IBOutlet weak var CommentsSwitch: UISwitch!

    @IBOutlet weak var currentVoice: UILabel!

    @IBAction func Troll(_ sender: AnyObject) {
        //setRandomResponse()
        speakWords()
    }
    
    @IBOutlet weak var button4: UIButton!
    @IBOutlet weak var button3: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var trollButton: UIButton!
    

    
    @IBAction func Sarcastic(_ sender: AnyObject) {
        speechSynthesizer.stopSpeaking(at: .immediate)
        emoji.image = UIImage(named:"sam")
        Voices.sarcastic.setSpeechVoice()
        speak("Sarcastic Samantha")
    }

    @IBAction func Drunk(_ sender: AnyObject) {
        speechSynthesizer.stopSpeaking(at: .immediate)
        emoji.image = UIImage(named:"kyle")
        Voices.dave.setSpeechVoice()
        speak("Condescending Kyle")
        
    }
    
    @IBOutlet weak var UIButton: UIButton!
    @IBAction func Mean(_ sender: Any) {
        speechSynthesizer.stopSpeaking(at: .immediate)
        emoji.image = UIImage(named:"moira")
        Voices.foggy.setSpeechVoice()
        speak("Mean Moira")
        
    }
    
    @IBAction func Cranky(_ sender: AnyObject) {
        speechSynthesizer.stopSpeaking(at: .immediate)
        emoji.image = UIImage(named:"karen")
        Voices.cranky.setSpeechVoice()
        speak("Cranky Karen")
        
    }

    @IBOutlet weak var textField: UITextField!

    @IBAction func textEdited(_ sender: Any) {
        speakWords()
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        speakWords()
        textField.resignFirstResponder()
        return true
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(ViewController.dismissKeyboard))
        
        //Uncomment the line below if you want the tap not not interfere and cancel other interactions.
        //tap.cancelsTouchesInView = false
        
        view.addGestureRecognizer(tap)
        
        textField.delegate = self
        
        loadSpeech()
        

        //trollButton.layer.cornerRadius = 5
        //trollButton.layer.borderWidth = 1
        
        
        speechSynthesizer.delegate = self
        


        //self.view.backgroundColor = backgroundColour
        
        
        let image = UIImage(named: "bubble")?.withRenderingMode(.alwaysTemplate)
        UIButton.setImage(image, for: .normal)
        
        self.view.tintColor = textColour
        
        
    }
    
    func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }
    
    var Responses = [String]()
    
    
    func loadSpeech() {
        Responses = ["Did your mum like that one?",
                         "That's exciting. Like my tax return.",
                         "What an incredible idea",
                         "Cool. Very cool.",
                         "That's going to go down a storm",
                         "Oh I'm so blown away right now",
                         "Oh how very interesting",
                         "Wow. Very exciting",
                         "I'm just dying to hear more",
                         "Special. Really special",
                         "And you wonder why they don't pay you more",
                         "Fun. Like a trip to the dentist",
                         "What a gift to the human race",
                         "Careful, you’ll break the internet with that one",
                         "Quick. Stop the press.",
                         "Wow, so catchy.",
                         "Great idea. You should sell your house",
                         "Genius. Just genius.",
                         "Oh I'm definitely going to tell my mates about this.",
                         "You're going to set the world on fire"]
    }
    
    func setRandomResponse() {

        
        speechSynthesizer.stopSpeaking(at: .immediate)
        
        if Responses.count < 2 {
            loadSpeech()
        }
        
        let index = Int(arc4random_uniform(UInt32(Responses.count)))
        Feedback = Responses[index]
        Responses.remove(at: index)

  
        
    }
    
    func speakWords() {
        
        speechSynthesizer.stopSpeaking(at: .immediate)
        
        
        Response = textField.text
        
        if Response != "" {
            setRandomResponse()
            Phrase = Response! + ". " + Feedback!
            speak(Phrase!)
            
        }
        

        
    }
    
    func speak(_ Words: String) {
        let speechUtterance = AVSpeechUtterance(string: Words)
        speechUtterance.rate = rate
        speechUtterance.pitchMultiplier = pitch
        speechUtterance.volume = volume
        speechUtterance.voice = AVSpeechSynthesisVoice(identifier: voice)
        speechSynthesizer.speak(speechUtterance)
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
