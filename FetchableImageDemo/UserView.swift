//
//  UserView.swift
//  FetchableImageDemo
//
//  Created by Gabriel Theodoropoulos.
//  Copyright © 2020 AppCoda. All rights reserved.
//

import SwiftUI

struct UserView: View {
    var contact: Contact
    
    var body: some View {
        VStack {
            getImage()
                .frame(minHeight: 300, maxHeight: 300)
                .background(Color.yellow)
                .clipShape(Circle())
            
            Text(contact.name ?? "Contact Name")
                .font(.title)
        }
    }
    
    
    func getImage() -> Image {
        if let avatar = contact.avatar {
            return Image(avatar, scale: 1.0, label: Text(""))
        } else {
            return Image("unknown")
        }
    }
}

struct UserView_Previews: PreviewProvider {
    static var previews: some View {
        UserView(contact: Contact())
    }
}
