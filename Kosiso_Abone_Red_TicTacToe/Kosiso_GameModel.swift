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
                return true
            }
        }
        
        if(noOfMovesPlayed == 9){
            return true
        }

        return false
    }
    
}
