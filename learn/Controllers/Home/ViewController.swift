//
//  ViewController.swift
//  learn
//
//  Created by sunliheng on 2021/10/22.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var vTitle: UILabel!
    @IBOutlet weak var vButton: UIButton!
    @IBOutlet weak var vInput: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        vTitle.text = "ABC"
        let bob = Dog(name:"Bob", age: 10, height: 3)
        bob.eat(thing: "bone")
        let height = bob.howHeight()
        print ("Height: \(height)")
        
        print("weight: \(bob.weight ?? 1)")
        
        if let child = bob.firstChild() {
            print("First Child Name: \(child.name)")
            print("First child Age: \(child.age)")
            
        }
        
        
        
        // Do any additional setup after loading the view.
    }

    @IBAction func tapButton() {
        vTitle.text = "hello world"
    }
    
    @IBAction func textChange() {
        vTitle.text = vInput.text
        
    }
}


class Dog {
    var name: String
    var age: Int
    var height: Double
    var weight: Double?
    var children: [Dog] = []
    
    init(name:String, age: Int, height: Double) {
        self.name = name
        self.age = age
        self.height = 3
    }
    func eat(thing:String) {
        print("\(self.name) eating \(self.age)")
    }
    func howHeight() -> Double {
        return self.height
    }
    
    func addChild(dog: Dog) {
        children.append(dog)

    
    }
    func firstChild() -> Dog? {
        return children.first
    }
}

