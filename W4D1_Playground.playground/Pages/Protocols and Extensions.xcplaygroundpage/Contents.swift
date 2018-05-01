//: [Previous](@previous)
/*:
 ## Protocols
 Protocols are a defined contract or blueprint that a class, struct or enum must follow.
 */
/*:
 Here we define a 'ShapeProtocol' where anything that conforms to it must provide a property of number of sides and a function called 'shapeDescription'
 */
protocol ShapeProtocol {
    var numberOfSides: Int { get set }
    func shapeDescription()
    func area() -> (Int)
    var color: String { get set }
    init(withColor: String)
}

/*:
 This 'Square' class conforms to the 'ShapeProtocol' and defines the number of sides for this shape and it has the shapeDescription method inside.
 */
class Square: ShapeProtocol {
    var numberOfSides: Int
    var lengthOfSide: Int
    var color = "Green"
    
    
    init(){
        self.numberOfSides = 4
        self.lengthOfSide = 10
    }
    
    func shapeDescription() {
        
        print("This is a square")
    }
    
    func area() -> Int {
        return self.lengthOfSide * self.lengthOfSide
    }
    
    required init(withColor: String) {
        self.numberOfSides = 4
        self.lengthOfSide = 10
        self.color = "Blue"
    }
}

/*:
 - Experiment:
 Add a new function in our 'ShapeProtocol' that should calculate the area of its shape. Make sure you implement it in our 'Square' class as well.
 */
// completed implementations
/*:
 - Experiment:
 Add a new property in our 'ShapeProtocol' of type String that indicates the colour of this shape.
 */
// completed and made all Square objects Green
/*:
 - Experiment:
 We can also declare a custom initializer within our 'ShapeProtocol' that any class must have present. Create an initializer that takes in a colour as a parameter.
 */
// completed and made all square objects initialized using the custom initializer Blue
/*:
 - Callout(Challenge):
 Define a person protocol with name, gender, age and add a custom initializer to set all the properties and a function to print a description of this person. Create a 'Student' class that conforms to this protocol and print the description of this student using its name.
 */
protocol Person{
    var name: String { get set }
    var gender: String { get set }
    var age: Int { get set }
    
    init(name: String, gender: String, age: Int)
}

class Student : Person {
    var name: String
    var gender: String
    var age: Int
    
    required init(name: String, gender: String, age: Int) {
        self.name = name
        self.gender = gender
        self.age = age
    }
    
    func description(){
        print("Student name is: \(name)")
    }
}

var student = Student(name: "Mike", gender: "Male", age: 29)
student.description()

/*:
 ## Extensions
 Extensions are a way to add additional functions to an existing class, struct or enum.
 \
 For example, I can extend the `'Double'` class to add a function I may use very often such as squaring a number. ie: 4*4 = 16
 
 - Note:
 Extensions are like categories from Objective-C. Unlike Objective-C categories, Swift extensions do not have names.
 */

// This is declaring an extension on the Double class
extension Double {
    
    // This 'square' function takes its own value and multiples it by itself, then returns the new value
    func square() -> Double {
        
        return self * self
    }
}

var myDoubleValue = 5.0
var mySquaredDoubleValue = myDoubleValue.square()

/*:
 - Experiment:
 Try adding the 'square' function to the `Float` type
 */
extension Float {
    
    func square() -> Float {
        
        return self * self
    }
}

var myFloatValue = 4.0
var mySquaredFloatValue = myFloatValue.square()

/*:
 We are going to add a few extensions to several classes that you could potentially use for your future projects to make things more convenient.
 */
/*:
 - Callout(Challenge):
 Create an extension on UIColor that converts hex represented colours to a UIColor to use. ex: #FFFFFF would give a UIColor of white (Hint: You can google the algorithm on how to convert hex values to a UIColor)
 */
import UIKit

extension UIColor {
    convenience init(hexString: String, alpha: CGFloat = 1.0) {
        let hexString: String = hexString.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
        let scanner = Scanner(string: hexString)
        if (hexString.hasPrefix("#")) {
            scanner.scanLocation = 1
        }
        var color: UInt32 = 0
        scanner.scanHexInt32(&color)
        let mask = 0x000000FF
        let r = Int(color >> 16) & mask
        let g = Int(color >> 8) & mask
        let b = Int(color) & mask
        let red   = CGFloat(r) / 255.0
        let green = CGFloat(g) / 255.0
        let blue  = CGFloat(b) / 255.0
        self.init(red:red, green:green, blue:blue, alpha:alpha)
    }
    func toHexString() -> String {
        var r:CGFloat = 0
        var g:CGFloat = 0
        var b:CGFloat = 0
        var a:CGFloat = 0
        getRed(&r, green: &g, blue: &b, alpha: &a)
        let rgb:Int = (Int)(r*255)<<16 | (Int)(g*255)<<8 | (Int)(b*255)<<0
        return String(format:"#%06x", rgb)
    }
}

let color = UIColor(hexString: "#a8de18")

/*:
 - Callout(Challenge):
 Create an extension on `String` called 'trim'. This will return a `String` that has the whitespace trimmed from the beginning and end. For example: "    hello there  " will return "hellothere"
 */

extension String {
    
    func trimWhiteSpace() -> String {
        let charcters = Array(self)
        var newString = ""
        for i in 0..<charcters.count {
            if charcters[i] != " "{
                newString.append(charcters[i])
            }
        }
        return newString
    }
}

let stringWithSpaces = "      hello     world      "
print(stringWithSpaces.trimWhiteSpace())

/*:
 - Callout(Challenge):
 Create an extension on String that checks if an email address has a valid format. You can make the rules as strict or as loose as you'd like. Rules can include verifying there are no spaces, there is a '@' present, etc.
 */

extension String {
    func checkEmail() -> Bool{
        let characters = Array(self)
        var isEmail = false
        for i in 0..<characters.count{
            if characters[i] == " "{
                isEmail = false
            }else if characters.index(of: "@")! < 1{
                isEmail = false
            }else if self.hasSuffix(".com"){
                    isEmail = true
                }
            }
        return isEmail
    }
}

let string = "irmike@gmail.com"
string.checkEmail()

/*:
 - Callout(Challenge):
 Create an extension on `Double` to add a function that converts the number of seconds into minutes and another function to hours. ex: Given 900 seconds, the minutes returned will be 15 minutes, and the hours returned would be 0.25 hours.
 */

extension Double {
    
    func convertSecondsToMinutes() -> Double{
        let minutes = self / 60
        return minutes
    }
    func convertSecondsToHours() -> Double{
        let hours = (self / 60) / 60
        return hours
    }
}

let seconds: Double = 900
seconds.convertSecondsToMinutes()
seconds.convertSecondsToHours()

//: [Next](@next)
