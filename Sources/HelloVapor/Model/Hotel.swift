//
//  File.swift
//  HelloVapor
//
//  Created by ROHIT MISHRA on 21/09/25.
//

import Vapor

struct Hotel: Content {
    let sort: String?
    let search: String
    
    let error: String?
}
