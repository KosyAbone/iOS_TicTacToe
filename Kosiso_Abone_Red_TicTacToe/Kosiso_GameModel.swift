//
//  Kosiso_GameModel.swift
//  Kosiso_Abone_Red_TicTacToe
//
//  Created by KOSSY on 2023-06-30.
//

import Foundation

class Kosiso_GameModel {
    
    var whoseTurn = "X";
    var lastPlayed = "";
    var whoWon = "";
    var squareContents = Array(repeating: "", count: 10);
    var noOfMovesPlayed = 0
    
    var orderOfMoves = [Int]()
    
    let winningCombinations = [
        [1, 2, 3],
        [4, 5, 6],
        [7, 8, 9],
        [1, 4, 7],
        [2, 5, 8],
        [3, 6, 9],
        [1, 5, 9],
        [3, 5, 7]
    ]
    
    func playMove(tag: Int){
        orderOfMoves.append(tag)
        squareContents[tag] = whoseTurn;
        lastPlayed = whoseTurn;
        whoseTurn = whoseTurn == "X" ? "O" : "X"
        noOfMovesPlayed += 1;
    }
    
    func isGameFinished() -> Bool {
        if(noOfMovesPlayed < 5){
            return false
        }
      
        for winningCombo in winningCombinations{
            let index1 = winningCombo[0]
            let index2 = winningCombo[1]
            let index3 = winningCombo[2]
            
            if(squareContents[index1] == lastPlayed
               && squareContents[index2] == lastPlayed
               && squareContents[index3] == lastPlayed){
                
                whoWon = lastPlayed;
                saveGame();
                return true
            }
        }
        
        if(noOfMovesPlayed == 9){
            saveGame();
            return true
        }

        return false
    }
    
    func saveGame(){
        let numGamesPlayed = UserDefaults.standard.integer(forKey: Constants.NUM_GAMES)
        let gameNumber = numGamesPlayed + 1
        
        UserDefaults.standard.set(whoWon, forKey: Constants.WHO_WON + String(gameNumber))
        
        UserDefaults.standard.set(Date(), forKey: Constants.DATE_TIME + String(gameNumber))
        
        UserDefaults.standard.set(orderOfMoves, forKey: Constants.ORDER_OF_MOVES + String(gameNumber))
        
        UserDefaults.standard.set(gameNumber, forKey: Constants.NUM_GAMES)
        
        print("game saved")
        
//        print(UserDefaults.standard.integer(forKey: Constants.NUM_GAMES))
//        print(UserDefaults.standard.string(forKey: Constants.WHO_WON)!)
//        print(UserDefaults.standard.object(forKey: Constants.DATE_TIME)!)
//        print(UserDefaults.standard.array(forKey: Constants.ORDER_OF_MOVES)!)
    }
    
}

struct Constants {
    static let NUM_GAMES = "numberOfGamesPlayed"
    static let WHO_WON = "whoWon"
    static let DATE_TIME = "dateTime"
    static let ORDER_OF_MOVES = "orderOfMoves"
}
