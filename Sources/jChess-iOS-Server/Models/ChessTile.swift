//
//  ChessTile.swift
//  jchess
//
//  Created by Patrick Hayes on 5/26/20.
//  Copyright © 2020 Jchess Inc. All rights reserved.
//

import Foundation

class ChessTile {
    
    enum ValidationError : Error {
        case outOfBounds
    }
    
    let chess_board_size = 8
    var row: Int
    var col: Int
    
    init(row: Int, col: Int) throws {
        self.row = row
        self.col = col
        
        if (row < 0 || row >= chess_board_size || col < 0 || col >= chess_board_size) {
            throw ValidationError.outOfBounds
        }
    }
    
}
