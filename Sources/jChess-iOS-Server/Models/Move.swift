//
//  Move.swift
//  jchess
//
//  Created by Aaron Graham on 5/26/20.
//  Copyright © 2020 Jchess Inc. All rights reserved.
//

import Foundation

class Move : Command{
    var chess_board : ChessBoard
    var old_tile : ChessTile
    var new_tile : ChessTile
    
    init(chessBoard: ChessBoard, oldTile: ChessTile, newTile: ChessTile) {
        self.chess_board = chessBoard
        self.old_tile = oldTile
        self.new_tile = newTile
    }
    
    func execute() {
        let old_piece = chess_board.getTilePiece(chessTile: old_tile);
        //let original_piece = chess_board.getTilePiece(chessTile: new_tile);

        chess_board.setTilePiece(chessTile: new_tile, piece: old_piece);
        chess_board.setTilePiece(chessTile: old_tile, piece: " ");

        //addToUndoLog(original_piece);
    }
}
