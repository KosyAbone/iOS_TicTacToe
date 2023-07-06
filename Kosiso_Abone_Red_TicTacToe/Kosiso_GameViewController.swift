//
//  Kosiso_GameViewController.swift
//  Kosiso_Abone_Red_TicTacToe
//
//  Created by KOSSY on 2023-06-30.
//

import UIKit

class Kosiso_GameViewController: UIViewController {
    // MARK:- Class variables
    var theGameModel = Kosiso_GameModel()
    var gameFinished = false;

    // MARK:- Outlets
    @IBOutlet weak var gameStateLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    // MARK: - IBActions
    
    @IBAction func squareTouched(_ sender: UIButton) {
        
        if(sender.currentTitle == "X" || sender.currentTitle == "O" || gameFinished){
            return
        }
        sender.setTitle(theGameModel.whoseTurn, for: .normal)
        theGameModel.playMove(tag: sender.tag)
        
        if(theGameModel.isGameFinished()){
            let winner = theGameModel.whoWon
            
            if(winner.count > 0){
                gameStateLabel.text = winner + " Won!"
            } else{
                gameStateLabel.text = "Draw!"
            }
            gameFinished = true;
        }
        else {
            gameStateLabel.text = theGameModel.whoseTurn + "'s Turn"
        }
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
