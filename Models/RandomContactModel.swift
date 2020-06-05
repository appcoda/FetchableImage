//
//  RandomContactModel.swift
//  FetchableImageDemo
//
//  Created by Gabriel Theodoropoulos.
//  Copyright © 2020 AppCoda. All rights reserved.
//

import SwiftUI

class RandomContactModel: ObservableObject, FetchableImage {
    
    @Published var contact = Contact()
    
    private var contacts = [Contact]()
    
    init() {
        loadContacts()
    }
    
    func pickRandomContact() {
        let random = Int.random(in: 0..<10)
        guard random < contacts.count else { return }
        contact = contacts[random]
        
        // print(localFileURL(for: contact.avatarURL))
        
        // let options = FetchableImageOptions(storeInCachesDirectory: true, allowLocalStorage: false, customFileName: nil)
        // let options = FetchableImageOptions(storeInCachesDirectory: false, allowLocalStorage: true, customFileName: nil)
        
        fetchImage(from: contact.avatarURL, options: nil) { (avatarData) in
            if let data = avatarData {
                DispatchQueue.main.async {
                    self.contact.avatar = UIImage(data: data)?.cgImage
                }
            }
        }
    }
    
    
    fileprivate func loadContacts() {
        guard let url = Bundle.main.url(forResource: "fakedata_small", withExtension: "json"), let data = try? Data(contentsOf: url) else {
            return
        }
        
        let decoder = JSONDecoder()
        guard let loadedContacts = try? decoder.decode([Contact].self, from: data) else { return }
        
        contacts = loadedContacts
    }
    
}
