//
//  ViewController.swift
//  HonestGame
//
//  Created by liu ya yun on 2022/5/16.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var storyLabel: UILabel!
    @IBOutlet weak var storyImage: UIImageView!
    @IBOutlet weak var resetButton: UIButton!
    @IBOutlet weak var choice1Button: UIButton!
    @IBOutlet weak var choice2Button: UIButton!
    
    let stories = [
        Story(title: "Failed exam，What would you do？", choice1: "Secretly change grades.", choice1Destination: 1, choice2: "Not going home，Go to playground.", choice2Destination: 2),
        Story(title: "Mom see Transcript，Praise for good score.", choice1: "Keep lying.", choice1Destination: 3, choice2: "Tell mom the truth, you change grades.", choice2Destination: 4),
        Story(title: "Have fun at the playground，See a man lose money.", choice1: "Pick money for man.", choice1Destination: 5, choice2: "Steal money.", choice2Destination: 6),
        Story(title: "Teacher calling，Mom know the truth，Beat me hard.", choice1: nil, choice1Destination: 0, choice2: nil, choice2Destination: 0),
        Story(title: "Mom is sad and crying，Tell me not to do it again.", choice1: nil, choice1Destination: 0, choice2: nil, choice2Destination: 0),
        Story(title: "The man is my Neighbor，Take me home，He tell my mom i did a good job today，Mom cooks a big meal for me.", choice1: nil, choice1Destination: 0, choice2: nil, choice2Destination: 0),
        Story(title: "People see me stealing money，I under the lash", choice1: nil, choice1Destination: 0, choice2: nil, choice2Destination: 0)
    ]
    
    var storyNumber = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        choice1Button.applyDesign()
        choice2Button.applyDesign()
        resetButton.applyDesign()
        startButtonData()
        upTextData()
    }
    
    
    @IBAction func buttonPressed(_ sender: AnyObject) {
        let useAnswer = sender.currentTitle!
        
        let storyArray = stories[storyNumber]
        if storyArray.choice1 != nil && storyArray.choice2 != nil{
            if useAnswer == storyArray.choice1 {
                if 3 == storyArray.choice1Destination{
                    resetButtonData()
                    storyNumber = 3
                    storyImage.image = UIImage(named: "4")
                }else if 5 == storyArray.choice1Destination{
                    resetButtonData()
                    storyNumber = 5
                    storyImage.image = UIImage(named: "6")
                    
                }else{
                    storyNumber = storyArray.choice1Destination!
                }
                
            }else if useAnswer == storyArray.choice2{
                if 4 == storyArray.choice2Destination{
                    resetButtonData()
                    storyNumber = 4
                    storyImage.image = UIImage(named: "5")
                }else if 6 == storyArray.choice2Destination{
                    resetButtonData()
                    storyNumber = 6
                    storyImage.image = UIImage(named: "7")
                }else{
                    storyNumber = storyArray.choice2Destination!
                }
            }
            
        }
        
        if storyArray.choice1 == nil && storyArray.choice2 == nil {
            startButtonData()
            storyNumber = 0
        }
        
        
        upTextData()
    }
    
    
    func upTextData(){
        storyLabel.text = stories[storyNumber].title
        choice1Button.setTitle(stories[storyNumber].choice1, for: .normal)
        choice2Button.setTitle(stories[storyNumber].choice2, for: .normal)
     
    }
    
    func resetButtonData() {
        storyImage.alpha = 1
        choice1Button.alpha = 0.0
        choice2Button.alpha = 0.0
        resetButton.alpha = 1
    }
    
    func startButtonData() {
        choice1Button.alpha = 1
        choice2Button.alpha = 1
        resetButton.alpha = 0.0
        storyImage.alpha = 0.0
    }
 
}

extension UIButton {
    func applyDesign() {
        self.layer.cornerRadius = self.frame.height / 2
        // Smooth corners
        self.layer.shadowColor = UIColor.darkGray.cgColor
        self.layer.shadowRadius = 10
        self.layer.shadowOpacity = 1
        self.layer.shadowOffset = CGSize(width: 0, height: 0)
    }
}

