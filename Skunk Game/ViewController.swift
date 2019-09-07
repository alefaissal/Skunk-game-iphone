//
//  ViewController.swift
//  Skunk Game
//
//  Created by Alexandre Ricardo Faissal on 2019-01-16.
//  Copyright © 2019 Alexandre Ricardo Faissal. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    // name of the player
    var playerOne = "Player One"
    
    //decison of the player to stay or withdraw
    var playerStay = true
    
    //if 2 or 3 dices game
    var numberOfDices = 2
    
    //to know which round is going on
    var actualRound = 1
    var compRound = 1
    
    //value for dices between 1 and 6
    var diceOne = 0
    var diceTwo = 0
    var diceThree = 0
    
    //random number for comp decision, if <= 3 withdraw, if > 3 stay on game
    var compDecision = 1
    
    var roundValuePlayer = 0
    var roundValueComp = 0
    
    //points of each round for the player S, K, U, N K
    var pRound = [0,0,0,0,0]
        
    
    
    //points of each round for the computer S, K, U, N K
    var cRound = [0,0,0,0,0]
    
    
    //total points for comp and player all rounds together
    var totalComp: Int = 0
    var totalPlayer: Int = 0
    
    //decision if comp stay of withdraw
    var compStay  = true;
    
    //decision if the round still going or if both players withdraw
    var roundSStillGoing  = true;
    var roundKStillGoing  = true;
    var roundUStillGoing  = true;
    var roundNStillGoing  = true;
    var roundK2StillGoing = true;
    //output of the system
    var answer = ""
    
    @IBOutlet weak var firstDiceImage: UIImageView!
    
    @IBOutlet weak var secondDiceImage: UIImageView!
    
    @IBOutlet weak var thirdDiceImage: UIImageView!
    @IBOutlet weak var playerLabel: UILabel!
    @IBOutlet weak var pRoundZero: UILabel!
    @IBOutlet weak var pRoundOne: UILabel!
    @IBOutlet weak var pRoundTwo: UILabel!
    @IBOutlet weak var pRoundThree: UILabel!
    @IBOutlet weak var pRoundFour: UILabel!
    @IBOutlet weak var pTotal: UILabel!
    @IBOutlet weak var cRoundoZero: UILabel!
    @IBOutlet weak var cRoundOne: UILabel!
    @IBOutlet weak var cRoundTwo: UILabel!
    @IBOutlet weak var cRoundThree: UILabel!
    @IBOutlet weak var cRoundFour: UILabel!
    @IBOutlet weak var cTotal: UILabel!
    @IBOutlet weak var answerLabel: UILabel!
    @IBAction func threeDiceSwitch(_ sender: UISwitch) {
        
        // Added the reset function, just to mak sure the game don't change in the middle.
        
        if sender.isOn {
            numberOfDices = 3
            resetGame()
        }else{
            numberOfDices = 2
            resetGame()
        }
        
    }
    func resetGame() -> Void {
        actualRound = 1;
        pRound = [0,0,0,0,0]
        cRound = [0,0,0,0,0]
        
        firstDiceImage.image = UIImage(named: "table")
        secondDiceImage.image = UIImage(named: "table")
        thirdDiceImage.image = UIImage(named: "table")
        
        totalComp            = 0;
        totalPlayer          = 0;
        
        compStay             = true;
        playerStay           = true;
        
        roundSStillGoing     = true;
        roundKStillGoing     = true;
        roundUStillGoing     = true;
        roundNStillGoing     = true;
        roundK2StillGoing    = true;
        
        roundValueComp       = 0;
        roundValuePlayer     = 0
        roundLabels()
        answerLabel.text = "You reset the Game"
    }
    
   
    @IBAction func resetButton(_ sender: UIButton) {
    
    //playerOne = "Player One";
        resetGame()
        
    }
    
    
   
    //make dice three apears only when the switch for 3 dices is selected
    func diceThreeApearance() -> Void {
        if diceThree == 1 {
            thirdDiceImage.image = UIImage(named: "Dice1")
        }
        else if diceThree == 2 {
            thirdDiceImage.image = UIImage(named: "Dice2")
        }
        else if diceThree == 3 {
            thirdDiceImage.image = UIImage(named: "Dice3")
        }
        else if diceThree == 4 {
            thirdDiceImage.image = UIImage(named: "Dice4")
        }
        else if diceThree == 5 {
            thirdDiceImage.image = UIImage(named: "Dice5")
        }
        else if diceThree == 6 {
            thirdDiceImage.image = UIImage(named: "Dice6")
        }
    }
    func diceOneAndTwoApearance() -> Void{
        if diceOne == 1 {
            firstDiceImage.image = UIImage(named: "Dice1")
        }
        else if diceOne == 2 {
            firstDiceImage.image = UIImage(named: "Dice2")
        }
        else if diceOne == 3 {
            firstDiceImage.image = UIImage(named: "Dice3")
        }
        else if diceOne == 4 {
            firstDiceImage.image = UIImage(named: "Dice4")
        }
        else if diceOne == 5 {
            firstDiceImage.image = UIImage(named: "Dice5")
        }
        else if diceOne == 6 {
            firstDiceImage.image = UIImage(named: "Dice6")
        }
        
        if diceTwo == 1 {
            secondDiceImage.image = UIImage(named: "Dice1")
        }
        else if diceTwo == 2 {
            secondDiceImage.image = UIImage(named: "Dice2")
        }
        else if diceTwo == 3 {
            secondDiceImage.image = UIImage(named: "Dice3")
        }
        else if diceTwo == 4 {
            secondDiceImage.image = UIImage(named: "Dice4")
        }
        else  if diceTwo == 5 {
            secondDiceImage.image = UIImage(named: "Dice5")
        }
        else if diceTwo == 6 {
            secondDiceImage.image = UIImage(named: "Dice6")
        }
        
    }
    
    /**
     * create the random value for each dice: 1, 2 and 3;
     */
    func rollDice() {
        diceOne         = Int.random(in: 1 ... 6)
        diceTwo         = Int.random(in: 1 ... 6)
        diceThree       = Int.random(in: 1 ... 6)
        compDecision    = Int.random(in: 1 ... 6)
        //diceOne      = Int(arc4random_uniform(5))
        //diceTwo      = Int(arc4random_uniform(5))
        //diceThree    = Int(arc4random_uniform(5))
        //compDecision = Int(arc4random_uniform(5))
    
        var i = actualRound - 1
        
        //if both stay, doesn't count the one's.
        if((compStay == true) && (playerStay == true)) {
            if(numberOfDices == 2) {
                if((diceOne == 1) || (diceTwo == 1)) {
                    // do nothing and keep playing
    
                }else if((diceOne == 1 ) && (diceTwo == 1)) {
                    // do nothing and keep playing
                    
                }else {
                    roundValueComp = diceOne + diceTwo;
                    roundValuePlayer = diceOne + diceTwo;
                }
    
            }
    
            if(numberOfDices == 3) {
                if((diceOne == 1) || (diceTwo == 1) || (diceThree == 1)) {
                    // do nothing and keep playing
                }else  if(((diceOne == 1 ) && (diceTwo == 1)) || ((diceOne == 1 ) && (diceThree == 1)) || ((diceThree == 1 ) && (diceTwo == 1)))  {
                    // do nothing and keep playing
    
                }else if(((diceOne == diceTwo)) && (diceThree == diceTwo)) {
                    roundValueComp = 100;
    
                }else {
                    roundValueComp = diceOne + diceTwo + diceThree;
                    roundValuePlayer = diceOne + diceTwo + diceThree;
                }
                diceThreeApearance()
            }
        }
    
        if((compStay == true) && (playerStay != true)) {
            roundValuePlayer = 0;
   
            if(numberOfDices == 2) {
                if((diceOne == 1) || (diceTwo == 1)) {
                    cRound[i] = 0
                    compStay = false;
                    //playerStay = false;
                    roundValueComp = 0;
                    //actualRound = actualRound + 1
                   
    
                }else if((diceOne == 1 ) && (diceTwo == 1)) {
                    //cRound[i] = 0
                    cRound = [0,0,0,0,0]
                    compStay = false;
                    //playerStay = false;
                    roundValueComp = 0;
                    //actualRound = actualRound + 1
                   
                }else {
                    roundValueComp = diceOne + diceTwo;
                }
    
            }
    
            if(numberOfDices == 3) {
                if((diceOne == 1) || (diceTwo == 1) || (diceThree == 1)) {
                    cRound[i] = 0
                    compStay = false;
                    //playerStay = false;
                    roundValueComp = 0;
                    //actualRound = actualRound + 1
                    
                }else  if(((diceOne == 1 ) && (diceTwo == 1)) || ((diceOne == 1 ) && (diceThree == 1)) || ((diceThree == 1 ) && (diceTwo == 1))) {
                    //cRound[i] = 0
                    cRound = [0,0,0,0,0]
                    compStay = false;
                    //playerStay = false;
                    roundValueComp = 0;
                    //actualRound = actualRound + 1
                    
                }else if((diceOne == diceTwo) && (diceOne == diceThree)){
                    roundValueComp = 100;
    
                }else {
                    roundValueComp = diceOne + diceTwo + diceThree;
                }
                diceThreeApearance()
            }
        }
    
        if((compStay != true) && (playerStay == true)) {
            roundValueComp = 0;
            if(numberOfDices == 2) {
                compRound = actualRound - 1;
                if((diceOne == 1) || (diceTwo == 1)) {
                    pRound[i] = 0
                    compStay = false;
                    playerStay = false;
                    roundValuePlayer = 0;
                    
                    //actualRound = actualRound + 1
                   
                }else if((diceOne == 1 ) && (diceTwo == 1)) {
                    //pRound[i] = 0
                    pRound = [0,0,0,0,0]
                    compStay = false;
                    playerStay = false;
                    roundValuePlayer = 0;
                    //actualRound = actualRound + 1
                   
                   
                }else {
                    roundValuePlayer = diceOne + diceTwo;
                }
            }
    
            if(numberOfDices == 3) {
                compRound = actualRound - 1
                if((diceOne == 1) || (diceTwo == 1) || (diceThree == 1)) {
                    pRound[i] = 0
                    compStay = false;
                    playerStay = false;
                    roundValuePlayer = 0;
                    //actualRound = actualRound + 1
                   
                }else if(((diceOne == 1 ) && (diceTwo == 1)) || ((diceOne == 1 ) && (diceThree == 1)) || ((diceThree == 1 ) && (diceTwo == 1))) {
                    //pRound[i] = 0
                    pRound = [0,0,0,0,0]
                    compStay = false;
                    playerStay = false;
                    roundValuePlayer = 0;
                    //actualRound = actualRound + 1
                   
                }else if((diceOne == diceTwo) && (diceOne == diceThree)){
                    roundValuePlayer = 100;
                }else {
                    roundValuePlayer = diceOne + diceTwo + diceThree;
                }
                diceThreeApearance()
            }
        }
        
        diceOneAndTwoApearance()
        
        roundLabels()
    }
    
    /**
     * function to decide the decision of the comp to stay or withdraw game
     */
    func funcCompDecision() {
        if ((playerStay == true) && (compStay == false)) {
            // do nothing
        } else if ((playerStay == false) && (compStay == false)) {
            compStay = true
        } else {
            if (compDecision <= 4){
                compStay = true
            }else{
                compStay = false
            }
        }
    }
    
    func wichRoundIsIt() {
    if((roundSStillGoing == true) && (roundKStillGoing == true) && (roundUStillGoing == true) &&
    (roundNStillGoing == true) && (roundK2StillGoing == true)) {
        if((compStay == false) && (playerStay == false)){
            roundSStillGoing = false;
            actualRound      = 2;
            compRound        = actualRound;
            compStay         = true;
            playerStay       = true;
    }
    }else if((roundSStillGoing != true) && (roundKStillGoing == true) && (roundUStillGoing == true) &&
    (roundNStillGoing == true) && (roundK2StillGoing == true)) {
        if((compStay == false) && (playerStay == false)){
            roundKStillGoing = false;
            actualRound      = 3;
            compStay         = true;
            compRound        = actualRound;
            playerStay       = true;
    }
    }else if((roundSStillGoing != true) && (roundKStillGoing != true) && (roundUStillGoing == true) &&
    (roundNStillGoing == true) && (roundK2StillGoing == true)) {
        if((compStay == false) && (playerStay == false)){
            roundUStillGoing = false;
            actualRound      = 4;
            compStay         = true;
            compRound        = actualRound;
            playerStay       = true;
    }
    }else if((roundSStillGoing != true) && (roundKStillGoing != true) && (roundUStillGoing != true) &&
    (roundNStillGoing == true) && (roundK2StillGoing == true)) {
        if((compStay == false) && (playerStay == false)){
            roundNStillGoing = false;
            actualRound      = 5;
            compStay         = true;
            compRound        = actualRound;
            playerStay       = true;
    
    }
    }else if((roundSStillGoing != true) && (roundKStillGoing != true) && (roundUStillGoing != true) &&
    (roundNStillGoing != true) && (roundK2StillGoing == true)) {
        if((compStay == false) && (playerStay == false)){
            roundK2StillGoing = false;
            actualRound      = 6
    }
    }
    }
    
    
    
    func roundLabels() -> Void {
        pRoundZero.text      = String(pRound[0])
        pRoundOne.text       = String(pRound[1])
        pRoundTwo.text       = String(pRound[2])
        pRoundThree.text     = String(pRound[3])
        pRoundFour.text      = String(pRound[4])
        cRoundoZero.text     = String(cRound[0])
        cRoundOne.text       = String(cRound[1])
        cRoundTwo.text       = String(cRound[2])
        cRoundThree.text     = String(cRound[3])
        cRoundFour.text      = String(cRound[4])
        totalPlayer          = pRound[0] + pRound[1] + pRound[2] + pRound[3] + pRound[4]
        totalComp            = cRound[0] + cRound[1] + cRound[2] + cRound[3] + cRound[4]
        cTotal.text          = String(totalComp)
        pTotal.text          = String(totalPlayer)
        
        
       
        if ((actualRound >= 1) && (actualRound < 6)) {
            if ((playerStay == true) && (compStay == false)){
                answer = "Computer is not playing this round"
            }else if ((playerStay == true) && (compStay == true)){
                if(compDecision <= 4){
                    answer = "Computer is staying for next round"
                }else{
                    answer = "Computer is withdrawing for next round"
                }
            }else if((playerStay == false) && (compStay == false)){
                    answer = "You withdraw this round"
            }
       
       }else{
            if(totalComp > totalPlayer) {
                answer = "You lost!"
            }else if (totalComp < totalPlayer) {
                answer = "You Won!"
            }else {
                answer = "It's a tie!"
            }
       }
    
        
      answerLabel.text = answer
    }
    
    
   
    
    
    
    
    @IBAction func rollButton(_ sender: UIButton) {
        if ((actualRound >= 1) && (actualRound < 6)) {
            wichRoundIsIt()
            //playerStay = true
            funcCompDecision()
            rollDice();
            if(compStay == true){
                pRound[actualRound - 1]  = pRound[actualRound - 1] + roundValuePlayer;
                cRound[actualRound - 1]  = cRound[actualRound - 1] + roundValueComp;
                
            }else{
                pRound[actualRound - 1]  = pRound[actualRound - 1] + roundValuePlayer;
                
            }
            //rollDice()
            //funcCompDecision()
            wichRoundIsIt()
            roundLabels()
        }else{
            roundLabels()
        }
    }
    
    @IBAction func withdrawButton(_ sender: UIButton) {
        
        playerStay = false
        if(compStay == false){
            //actualRound = actualRound + 1
            if(actualRound == 5){
                if(totalComp > totalPlayer) {
                    answer = "You lost!"
                }else if (totalComp < totalPlayer) {
                    answer = "You Won!"
                }else {
                    answer = "It's a tie!"
                }
                answerLabel.text = answer
            }
            
            
        }else {
            funcCompDecision()
            
            wichRoundIsIt()
            rollDice()
            if((actualRound >= 1) && (actualRound < 6)) {
                //pRound[actualRound - 1]  = pRound[actualRound - 1] + roundValuePlayer;
                cRound[actualRound - 1]  = cRound[actualRound - 1] + roundValueComp;
                while(compStay == true){
                    wichRoundIsIt();
                    rollDice();
                    funcCompDecision();
                    cRound[actualRound - 1]  = cRound[actualRound - 1] + roundValueComp
                    
                    roundLabels()
                }
                actualRound = actualRound + 1
            }
            roundLabels()
        }
        
        
        
    }
}

    

