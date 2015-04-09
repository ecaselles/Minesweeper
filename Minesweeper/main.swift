//
//  main.swift
//  Minesweeper
//
//  Created by Edu Caselles on 08/04/2015.
//  Copyright (c) 2015 Edu Caselles. All rights reserved.
//

import Foundation

println("Enter the dimensions of the field (M N):")

var fileHandle = NSFileHandle.fileHandleWithStandardInput()

var input = NSString(data: NSFileHandle.fileHandleWithStandardInput().availableData, encoding:NSUTF8StringEncoding) as String

let items = input.stringByReplacingOccurrencesOfString("\n", withString: "").componentsSeparatedByString(" ")
let width = items[0].toInt()!
let height = items[1].toInt()!

println("Enter the field:")

var values = String()
for line in 1...height {
    input = NSString(data: NSFileHandle.fileHandleWithStandardInput().availableData, encoding:NSUTF8StringEncoding) as String
    values += input
}

println()

let board = MSBoard(width: width, height: height, values: values)

println("Field:")
let field = board.hintTiles
for row in 0..<board.dimensions.height {
    for column in 0..<board.dimensions.width {
        print(field[row][column] + " ")
    }
    print("\n")
}







