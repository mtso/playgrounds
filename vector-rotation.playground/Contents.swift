//: Playground - noun: a place where people can play

var str = "Hello, playground"

let maxRows = 8
let maxCols = 8

func clearGrid(grid: inout [[Character]]) {
    grid = Array(repeating: Array(repeating: "·", count: maxCols), count: maxRows)
}

func printBoat(boat: [(x: Int, y: Int)], onGrid: inout [[Character]]) {
    clearGrid(grid: &onGrid)
    
    for pos in boat {
        onGrid[pos.y][pos.x] = "x"
    }
    
    for row in grid {
        for (index, col) in row.enumerated() {
            let terminator = index + 1 == maxCols ? "" : " "
            print(col, terminator: terminator)
        }
        print("")
    }
}

func rotateLine(ofPoints points: inout [(x: Int, y: Int)]) {
    
    // Rotate the points around the midpoint
    
    let pivotIndex = points.count / 2
    let pivot = points[pivotIndex]

    for index in 0..<points.count {
        
        let rotatedX = -(points[index].y - pivot.y) + pivot.x
        let rotatedY =  (points[index].x - pivot.x) + pivot.y

        points[index] = (rotatedX, rotatedY)
    }
    
    // Make sure line is within grid boundary
    
    var lx = 0, ly = 0, mx = 0, my = 0
    
    for point in points {
        
        if point.x < lx {
            lx = point.x
        }
        if point.x - maxCols > mx {
            mx = point.x - maxCols
        }
        if point.y < ly {
            ly = point.y
        }
        if point.y - maxRows > my {
            my = point.y - maxRows
        }
    }
    
    for index in 0..<points.count {
        points[index].x -= lx + mx
        points[index].y -= ly + my
    }
}

var grid: [[Character]] = Array(repeating: Array(repeating: ".", count: maxCols), count: maxRows)

//var boat: [(x: Int, y: Int)] = [(2, 3), (3, 3), (4, 3)]
//var boat: [(x: Int, y: Int)] = [(2, 3), (3, 3), (4, 3), (5, 3), (6, 3)]
//var boat: [(x: Int, y: Int)] = [(2, 1), (3, 1), (4, 1), (5, 1), (6, 1)]
//var boat: [(x: Int, y: Int)] = [(1, 1), (2, 1), (3, 1), (4, 1), (5, 1), (6, 1), (7, 1)]
//var boat: [(x: Int, y: Int)] = [(4, 1), (4, 2), (4, 3), (4, 4), (4, 5)]
var boat: [(x: Int, y: Int)] = [(0, 1), (0, 2), (0, 3), (0, 4), (0, 5)]

print(boat)
printBoat(boat: boat, onGrid: &grid)

rotateLine(ofPoints: &boat)
print("")

print(boat)
printBoat(boat: boat, onGrid: &grid)
