//
//  BoardSpec.swift
//  Minesweeper
//
//  Created by Edu Caselles on 08/04/2015.
//  Copyright (c) 2015 Edu Caselles. All rights reserved.
//

import XCTest

class MSBoardSpec: XCTestCase {
    
    // MARK: Creation
    
    func testBoardCreationWithNoSize() {
        let board = MSBoard(width: 0, height: 0, values: "")
        XCTAssert(board.dimensions.width == 0, "Test width is 0")
        XCTAssert(board.dimensions.height == 0, "Test height is 0")
        
        XCTAssert(board.tiles.isEmpty, "Test tiles with no size")
    }

    func testBoardCreationNoValues() {
        let board = MSBoard(width: 2, height: 2, values: "")
        
        XCTAssert(board.tiles.isEmpty, "Test tiles with no values")
    }
    
    func testBoardCreationWrongWidth() {
        let board = MSBoard(width: 1, height: 2, values: "* .\n. .")
        XCTAssert(board.tiles.isEmpty, "Test tiles with wrong width")
    }
    
    func testBoardCreationWrongHeight() {
        let board = MSBoard(width: 2, height: 1, values: "* .\n. .")
        XCTAssert(board.tiles.isEmpty, "Test tiles with wrong height")
    }
    
    func testBoardCreationSuccessfully() {
        let board = MSBoard(width: 2, height: 3, values: "* .\n. .\n. *")
        XCTAssert(board.dimensions.width == 2, "Test width is 2")
        XCTAssert(board.dimensions.height == 3, "Test height is 3")
        
        let expected = [
            ["*", "."],
            [".", "."],
            [".", "*"]]
        XCTAssert(board.tiles == expected, "Test tiles load successfully")
    }
    
    // MARK: Hint Numbers
    
    func testBoardHintNumbersNoMines() {
        let board = MSBoard(width: 2, height: 2, values: ". .\n. .")
        let expected = [
            ["0", "0"],
            ["0", "0"]]
        XCTAssert(board.hintTiles == expected, "Test hint numbers with no mines")
    }
    
    func testBoardHintNumbersOneMine() {
        let board = MSBoard(width: 2, height: 2, values: ". *\n. .")
        let expected = [
            ["1", "*"],
            ["1", "1"]]
        XCTAssert(board.hintTiles == expected, "Test hint numbers with 1 mine")
    }

    func testBoardHintNumbersTwoMines() {
        let board = MSBoard(width: 2, height: 2, values: ". *\n* .")
        let expected = [
            ["2", "*"],
            ["*", "2"]]
        XCTAssert(board.hintTiles == expected, "Test hint numbers with 2 mines")
    }
    
    func testBoardHintNumbersAllMines() {
        let board = MSBoard(width: 2, height: 2, values: "* *\n* *")
        let expected = [
            ["*", "*"],
            ["*", "*"]]
        XCTAssert(board.hintTiles == expected, "Test hint numbers with all mines")
    }
}
