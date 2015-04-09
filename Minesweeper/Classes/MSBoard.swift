//
//  MSBoard.swift
//  Minesweeper
//
//  Created by Edu Caselles on 08/04/2015.
//  Copyright (c) 2015 Edu Caselles. All rights reserved.
//

import Foundation

// MARK: BoardSize
struct BoardSize {
    var width = 0
    var height = 0
    
    init(width: Int, height: Int)
    {
        self.width = width
        self.height = height
    }
}

// MARK: MSBoard
class MSBoard: NSObject {
    var tiles: [[String]]
    var dimensions: BoardSize
    var hintTiles: [[String]] {
        var result = [[String]]()
        for row in 0..<self.dimensions.height {
            result.append([String]())
            for column in 0..<self.dimensions.width {
                let hintNumber = self.hintNumberForRow(row, andColumn:column)
                result[row].append(hintNumber)
            }
        }
        
        return result
    }
    
    init(width: Int, height: Int, values: String)
    {
        let dimensions = BoardSize(width: width, height: height)
        self.dimensions = dimensions
        self.tiles = [[String]]()
        
        if height == 0 || width == 0 {
            return
        }
        
        var lines = values.componentsSeparatedByString("\n")
        if lines.last == "" {
            lines.removeLast()
        }
        
        if lines.count != height {
            return
        }
        
        var tiles = [[String]]()
        for line in lines {
            let components = line.componentsSeparatedByString(" ")
            if components.count != width {
                return
            }
            tiles.append(components)
        }
        
        self.tiles = tiles
    }
    
    private func hintNumberForRow(row: Int, andColumn column: Int) -> String
    {
        if self.tiles[row][column] == "*" {
            return "*"
        }
        
        let upperRow = max(row - 1, 0);
        let lowerRow = min(row + 1, self.dimensions.height - 1);
        let leftColumn = max(column - 1, 0);
        let rightColumn = min(column + 1, self.dimensions.width - 1);
        
        var hintNumber = 0;
        for var i = upperRow; i <= lowerRow; ++i {
            for var j = leftColumn; j <= rightColumn; ++j {
                if self.tiles[i][j] == "*" {
                    hintNumber++
                }
            }
        }
        
        return String(hintNumber)
    }
}
