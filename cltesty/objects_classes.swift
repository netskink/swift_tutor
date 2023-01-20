//
//  objects_classes.swift
//  cltesty
//
//  Created by John F. Davis on 12/14/22.
//

import Foundation

// use 'class' followed by the class's name to create a class.
//
// A property declaration is written like a constant or variable.
//

class Shape {
    
    // Every property needs a value assigned—either in its declaration
    // (as with numberOfSides) or in the initializer (as with name).
    var numberOfSides = 0
    var name: String
    
    // Use deinit to create a deinitializer if you
    // need to perform cleanup before it is deallocated.
    init(name:  String) {
        // it uses self to distinguish the property from the parameter.
        self.name = name
    }
    
    func simpleDescription() -> String {
        return "A shape with \(numberOfSides) sides."
    }
    func specifyNumberOfSides(numSides: Int) {
        numberOfSides = numSides
    }
}


class Square: Shape {
    var sideLength: Double
    
    init(sideLength: Double, name: String) {
        self.sideLength = sideLength
        super.init(name: name)
        numberOfSides = 4
    }
    
    func area() -> Double {
        return sideLength * sideLength
    }
    
    override func simpleDescription() -> String {
        return "A square with sides of length \(sideLength)."
    }
}



class Circle: Shape {
    var radius: Double
    
    init(radius: Double, name: String) {
        self.radius = radius
        super.init(name: name)
        numberOfSides = 0
    }
    
    func area() -> Double {
        return Double.pi * radius * radius
    }
    
    override func simpleDescription() -> String {
        return "A circle with radius \(radius) and area \(area())."
    }
}


class EquilateralTriangle: Shape {
    var sideLength: Double = 0.0
    
    init(sideLength: Double, name: String) {
        self.sideLength = sideLength
        super.init(name: name)
        numberOfSides = 3
    }
    
    // can have getter/setter for simple properites.
    // newValue must be part of api.
    // "In the setter for perimeter, the new value has the implicit
    // name newValue. You can provide an explicit name in parentheses after set."
    var perimeter: Double {
        get {
            return 3.0 * sideLength
        }
        set {
            sideLength = newValue / 3.0
        }
    }
    
    func area() -> Double {
        return 0.5 * sideLength * 3 // needs to be height
    }
    
    override func simpleDescription() -> String {
        return "An equilateral triangle with sides of length \(sideLength)."
    }
}




















func obj_class_one() {
    print("--------")
    
    let shape = Shape(name: "square")
    shape.numberOfSides = 4
    let shapeDescription = shape.simpleDescription()
    
    print(shapeDescription)
}

func obj_class_two() {
    print("--------")
    
    let shape = Square(sideLength: 4, name: "square")
    let shapeDescription = shape.simpleDescription()
    
    print(shapeDescription)
}

func obj_class_three() {
    print("--------")
    
    let shape = Circle(radius: 4.0, name: "square")
    let shapeDescription = shape.simpleDescription()
    
    print(shapeDescription)
}

func obj_class_four() {
    print("--------")
    
    let triangle = EquilateralTriangle(sideLength: 4.0, name: "a triangle")
    let shapeDescription = triangle.simpleDescription()
    print (triangle.perimeter)  // this is sidelenght * 3
    triangle.perimeter = 9.9  // this sets new value for permiter but does not modify side length
    print (triangle.perimeter)

    print(shapeDescription)
}




// If you don’t need to compute the property but still need to provide code
// that’s run before and after setting a new value, use willSet and didSet.
//
// The code you provide is run any time the value changes outside of an
// initializer.
//
// For example, the class below ensures that the side length of
// its triangle is always the same as the side length of its square.

class TriangleAndSquare {
    var triangle: EquilateralTriangle {
        willSet {
            square.sideLength = newValue.sideLength
        }
    }
    var square: Square {
        willSet {
            triangle.sideLength = newValue.sideLength
        }
    }
    init(size: Double, name: String) {
        square = Square(sideLength: size, name: name)
        triangle = EquilateralTriangle(sideLength: size, name: name)
    }
}

func obj_class_five() {
    print("--------")
    
    let triangleAndSquare = TriangleAndSquare(size: 4.0, name: "test shape")
    print (triangleAndSquare.triangle.sideLength)
    print (triangleAndSquare.square.sideLength)
    triangleAndSquare.square = Square(sideLength: 50.0, name: "large square")
    print (triangleAndSquare.triangle.sideLength)
    print (triangleAndSquare.square.sideLength)
}

// When working with optional values, you can write ? before operations like methods,
// properties, and subscripting. If the value before the ? is nil, everything after
// the ? is ignored and the value of the whole expression is nil. Otherwise, the
// optional value is unwrapped, and everything after the ? acts on the unwrapped
// value. In both cases, the value of the whole expression is an optional value.
func obj_class_six() {
    print("--------")

    
    let optionalSquare: Square? = Square(sideLength: 2.5, name: "optional square")
    print(optionalSquare?.simpleDescription())
    let sideLength = optionalSquare?.sideLength
    print(sideLength)

    
}
