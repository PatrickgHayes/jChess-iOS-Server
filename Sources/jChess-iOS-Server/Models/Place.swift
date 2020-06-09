//
//  Place.swift
//  jchess
//
//  Created by Aaron Graham on 5/27/20.
//  Copyright © 2020 Jchess Inc. All rights reserved.
//

import Foundation

class Place : Command
{
    var chess_board : ChessBoard
    var piece : Character
    var tile : ChessTile

    init(chessBoard: ChessBoard, piece: Character, tile: ChessTile)
    {
        self.chess_board = chessBoard;
        self.piece = piece;
        self.tile = tile;
    }

    func execute()
    {
        //char original_piece = chess_board.getTilePiece(tile);

        chess_board.setTilePiece(chessTile: tile, piece: piece);

        //addToUndoLog(original_piece);
    }

    /*private void addToUndoLog(char original_piece)
    {
        UndoPlace undo_place = new UndoPlace(chess_board, original_piece, tile);
        chess_board.undoLog.push(undo_place);
    }*/
}
