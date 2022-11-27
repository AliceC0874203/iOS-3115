//
//  AnimalProtocol.swift
//  Ex5
//
//  Created by Alice’z Poy on 2022-11-02.
//

import Foundation

protocol AnimalProtocol {
    var breed: String? { get set }
    var animalName: String { get set }
    var gadgetName: String? { get set }
    var continent: String { get set }
    var number: Int? { get set }
    var price: Double? { get set }
    
    func label()
    func run()
    func bark()
}

extension AnimalProtocol {
    func label() {
        print("""
        Hello
        My name is \(gadgetName ?? "")
        I am a \(animalName) and I live in \(continent)
        There is only \(number ?? 0) individual of my species left on earth
        Buy me for \(price ?? 0) dollars and contribute in saving me
        """)
    }
    
    func run() {
        
    }
    
    func bark(){
        
    }
}
