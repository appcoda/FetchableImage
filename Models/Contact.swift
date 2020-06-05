//
//  Contact.swift
//  FetchableImageDemo
//
//  Created by Gabriel Theodoropoulos.
//  Copyright © 2020 AppCoda. All rights reserved.
//

import SwiftUI

struct Contact: Decodable, Identifiable {
    var id: Int?
    var name: String?
    var avatarURL: String?
    
    var avatar: CGImage?
        
    enum CodingKeys: String, CodingKey {
        case id, name, avatarURL
    }
}
