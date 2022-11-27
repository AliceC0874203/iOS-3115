//
//  UserObject.swift
//  Ex7
//
//  Created by Alice’z Poy on 2022-11-02.
//

import Foundation

protocol UserProtocol {
    var username: String { get set }
    var password: String { get set }
    var firstName: String { get set }
    var lastName: String { get set }
    var email: String { get set }
}

struct User: UserProtocol {
    var username: String
    var password: String
    var firstName: String
    var lastName: String
    var email: String
}
