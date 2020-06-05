//
//  ContactListModel.swift
//  FetchableImageDemo
//
//  Created by Gabriel Theodoropoulos.
//  Copyright © 2020 AppCoda. All rights reserved.
//

import SwiftUI

class ContactListModel: ObservableObject, FetchableImage {
    
    @Published var contacts = [Contact]()
    
    @Published var progress: Double = 0.0
    
    @Published var isFetching = false
    
    
    init() {
        loadContacts()
    }
    
    
    private func loadContacts() {
        guard let url = Bundle.main.url(forResource: "fakedata", withExtension: "json"), let data = try? Data(contentsOf: url) else {
            return
        }
        
        let decoder = JSONDecoder()
        guard let loadedContacts = try? decoder.decode([Contact].self, from: data) else { return }
        
        contacts = loadedContacts
    }
    
    
    func fetchAvatars() {
        guard !isFetching else { return }
        isFetching = true
        progress = 0.0
        
        let allAvatarURLs = contacts.map { $0.avatarURL }
        
        fetchBatchImages(using: allAvatarURLs, options: nil, partialFetchHandler: { (imageData, index) in

            DispatchQueue.main.async {
                guard let data = imageData else { return }
                self.contacts[index].avatar = UIImage(data: data)?.cgImage

                self.progress = Double(((index + 1) * 100) / self.contacts.count)
            }

        }) {
            print("Finished fetching avatars!")

            DispatchQueue.main.asyncAfter(deadline: .now() + 0.4, execute: {
                self.isFetching = false
            })
        }
    }
    
    
    func deleteAvatar(for contact: Contact) {
        guard let index = contacts.firstIndex(where: { $0.id == contact.id }) else { return }

        if deleteImage(using: contacts[index].avatarURL, options: nil) {
            contacts[index].avatar = nil
        }
    }
    
    
    func fetchAvatar(for contact: Contact, completion: @escaping (_ avatar: CGImage?) -> Void) {
        guard let index = contacts.firstIndex(where: { $0.id == contact.id }) else { return }

        fetchImage(from: contacts[index].avatarURL) { (imageData) in
            DispatchQueue.main.async {
                guard let data = imageData else { return }
                self.contacts[index].avatar = UIImage(data: data)?.cgImage
                completion(self.contacts[index].avatar)
            }
        }
    }
    
    
    func deleteAllAvatars() {
        let allAvatarURLs = contacts.map { $0.avatarURL }
        deleteBatchImages(using: allAvatarURLs, options: nil)
        for (index, _) in contacts.enumerated() {
            contacts[index].avatar = nil
        }
    }
}
