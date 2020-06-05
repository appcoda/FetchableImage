//
//  ContactDetailsView.swift
//  FetchableImageDemo
//
//  Created by Gabriel Theodoropoulos.
//  Copyright © 2020 AppCoda. All rights reserved.
//

import SwiftUI

struct ContactDetailsView: View {
    @State var contact: Contact
    
    @EnvironmentObject var contactList: ContactListModel
    
    var body: some View {
        VStack {
            UserView(contact: contact)
            
            Spacer()
                .frame(height: 60)
            
            Button(contact.avatar != nil ? "Delete Avatar" : "Fetch Avatar") {
                if self.contact.avatar != nil {
                    self.contact.avatar = nil
                    self.contactList.deleteAvatar(for: self.contact)
                } else {
                    self.contactList.fetchAvatar(for: self.contact) { (fetchedAvatar) in
                        guard let avatar = fetchedAvatar else { return }
                        self.contact.avatar = avatar
                    }
                }
            }
            .frame(maxHeight: 40)
            .padding([.leading, .trailing], 20)
            .foregroundColor(.white)
            .background(contact.avatar != nil ? Color.red : Color.blue)
            .font(.headline)
            .cornerRadius(20)
        }
        .navigationBarTitle(Text("Contact Details"), displayMode: .inline)
    }
}

struct ContactDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        ContactDetailsView(contact: Contact())
    }
}
