//: [Previous](@previous)
/*:
 ## Functions

 A function is a set of statements grouped together to perform a task. Functions can take in zero or many parameters and the function can also return a value or return nothing. Below you can see the different structures of a function of how you can write them.
 */
/*:
 - Callout(Structure): This function structure does not include any parameters and does not return anything
 
 - Declare the `func` keyword
 - The name of the function `'sayHello'`
 - Open and close parentheses
 - Open and close braces
*/
func sayHello(){
    print("Hello")
}
/*:
 - Callout(Structure): This function takes in a single parameter and does not return any values
 
 - Declare the `func` keyword
 - The name of the function `'sayHello'`
 - **Open and close parentheses with a parameter called 'toPerson' of type `String`**
 - Open and close braces
 */
func sayHello(toPerson: String){
    print("Hello \(toPerson)")
}
/*:
 - Callout(Structure): This function takes in a single parameter and returns a value of type `String`
 
 - Declare the `func` keyword
 - The name of the function `'sayHello'`
 - Open and close parentheses with a parameter called 'toPerson' of type `String`
 - A return value of type `String` represented by the `->`
 - Open and close braces
 */
func sayHello(toPerson: String) -> String{
    return "Hello \(toPerson)"
}
/*:
 - Experiment:
 Try calling all of the functions above. They all have the same function name, but the compiler doesn't complain. Can you think of why this might be?
 */

sayHello()
//sayHello(toPerson: "Mike") // compiler complains about the ambiguity of the method call
//sayHello(toPerson: "Mike") // compiler complains about the ambiguity of the method call
// the compiler does differentiate between the 3 methods since they are all different, I assume this is because none of them are being overridden

/*:
 - Experiment:
 Try creating your own function that accepts two parameters of any type you choose. Have the function print out the two parameters and test your function.
 */

func driveCar(carName: String, age: Int){
    print("Driving a \(carName) that is \(age) year(s) old.")
}
driveCar(carName: "Civic", age: 5)

/*:
 - Callout(Challenge):
 Create four separate functions to add, subtract, multiple, and divide with two parameters given to it and returns a number result. Try testing each one afterwards.
 
 */

func add(first: Int, second: Int) -> Int {
    let answer = first + second
    return answer
}
func subtract(first: Int, second: Int) -> Int {
    let answer = first - second
    return answer
}
func multiply(first: Int, second: Int) -> Int {
    let answer = first * second
    return answer
}
func divide(first: Int, second: Int) -> Int {
    let answer = first / second
    return answer
}

print(add(first: 4, second: 5))
print(subtract(first: 7, second: 2))
print(multiply(first: 3, second: 8))
print(divide(first: 20, second: 2))
/*:
 - Callout(Challenge):
 Create your own 'reverse' function that takes in an array of Int, reverses the order of the array, and returns the newly reversed array of Int. The array class has its own 'reverse' method, but do not use it for this challenge.
 */

let normalArray = [1, 2, 3, 4, 5, 6]

func reverseArray(_ array: [Int]) -> [Int] {
    var reversedArray: [Int] = []
    for i in 0..<array.count {
        reversedArray.insert(array[i], at: 0)
    }
    return reversedArray
}
print(reverseArray(normalArray))

/*:
 ## Closures
 
 Closures are also a set of statements grouped together but the closure can be stored and passed around and executed somewhere else.
 
 - Note:
 A closure in Swift is similar to blocks in Objective-C
 */
/*:
 For example, the UIViewController has a 'dismiss' method.
 
 `func dismiss(animated flag: Bool, completion: (() -> Void)? = nil)`
 
 The 'completion' part of it is the completion handler which is a closure. It will execute that block of code when the dismiss action has completed.
 */
/*:
 - Callout(Structure): This is storing a closure into a variable called 'sayHelloClosure'.
 
 - Start with the open braces
 - The first '()' indicates it takes no parameters
 - The -> represents what a type it will return
 - The second '()' indicates it does not return any value
 - The 'in' keyword separates the type declaration from the body
 - Close braces
 */
var sayHelloClosure = { () -> () in
    print("Hello from closure")
}
/*:
 - Callout(Structure): This is storing a closure into a variable called 'sayHelloClosureToPerson'.
 
 - Start with the open braces
 - The first '()' indicates it takes one parameter 'name'
 - The -> represents what a type it will return
 - The second '()' indicates it does not return any value
 - The 'in' keyword separates the type declaration from the body
 - Close braces
 */
var sayHelloClosureToPerson = { (name: String) -> () in
    print("Hello \(name)")
}
/*:
 - Callout(Structure): This is storing a closure into a variable called 'sayHelloClosureWithReturn'.
 
 - Start with the open braces
 - The first '()' indicates it takes one parameter 'name'
 - The -> represents what a type it will return
 - The `'String'` after the arrow indicates it returns a `String` type
 - The 'in' keyword separates the type declaration from the body
 - Close braces
 */
var sayHelloClosureWithReturn = { (name: String) -> String in
    return "Hello \(name)"
}
/*:
 - Experiment:
 Try calling all of the closures above. What do you notice that is different from calling a function?
 */

sayHelloClosure()
sayHelloClosureToPerson("Mike")
print(sayHelloClosureWithReturn("Mike"))
// the method does not automatically complete and the inputs are assumed to be used without the input names

/*:
 - Experiment:
 Try creating your own closure that accepts two parameters of any type you choose. Have the closure print out the two parameters and test your closure.
 */

var testClosure = { (name: String, age: Int) -> () in
    print("Your name is \(name) and you are \(age) year(s) old.")
}

testClosure("Mike", 29)

/*:
 - Experiment:
 Declare a variable with an explicit closure type: `(String) -> (String)`. This closure type says it takes one parameter of type String and returns a variable of type String.
 */

var stringClosure = { (input: String) -> (String) in
    let suffix = ", blah blah blah"
    let change = input + suffix
    return change
}

print(stringClosure("this is my string"))
/*:
 - Callout(Challenge):
 Create a closure with at least two parameters of your choice and decide whether or not it returns anything. Then create a function that takes in your closure as a parameter and one additional parameter of your choice.
 */
//: [Next](@next)

var addition = { (number1: Int, number2: Int) -> (Int) in
    return number1 + number2
}

func moreAddition (result: ((Int, Int) -> Int), other: Int) -> (Int){
    let firstAddition = addition(2,3)
    let secondAddition = firstAddition + other
    return secondAddition
}


