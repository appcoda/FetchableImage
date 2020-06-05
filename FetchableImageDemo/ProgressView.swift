//
//  ProgressView.swift
//  FetchableImageDemo
//
//  Created by Gabriel Theodoropoulos.
//  Copyright © 2020 AppCoda. All rights reserved.
//

import SwiftUI

struct ProgressView: View {
    var progress: Double
    
    var body: some View {
        VStack {
            Spacer()
            GeometryReader { geometry in
                ZStack(alignment: .leading) {
                    RoundedRectangle(cornerRadius: 10)
                        .frame(width: nil, height: 20, alignment: .center)
                        .foregroundColor(.gray)
                        .background(Color.clear)
                    .padding(.bottom, 8.0)
                    
                    RoundedRectangle(cornerRadius: 10)
                        .frame(width: (CGFloat(self.progress) * geometry.size.width) / 100,
                               height: 20, alignment: .center)
                        .foregroundColor(.blue)
                        .background(Color.clear)
                        .padding(.bottom, 8.0)
                        
                }
            }
        }
    }
    
    
    private func calculateWidth() {
        
    }
}

struct ProgressView_Previews: PreviewProvider {
    static var previews: some View {
        ProgressView(progress: 40)
    }
}
