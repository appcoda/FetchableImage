//
//  RandomContactView.swift
//  FetchableImageDemo
//
//  Created by Gabriel Theodoropoulos.
//  Copyright © 2020 AppCoda. All rights reserved.
//

import SwiftUI

struct RandomContactView: View {
    @ObservedObject var randomDataModel = RandomContactModel()
    
    var body: some View {
        VStack {
            UserView(contact: randomDataModel.contact)
            
            Spacer()
                .frame(height: 100)
            
            Button("Random contact") {
                self.randomDataModel.pickRandomContact()
            }
            .frame(maxHeight: 40)
            .padding([.leading, .trailing], 20)
            .foregroundColor(.white)
            .background(Color.blue)
            .font(.headline)
            .cornerRadius(20)
        }
    }
}

struct RandomContactView_Previews: PreviewProvider {
    static var previews: some View {
        RandomContactView()
    }
}
