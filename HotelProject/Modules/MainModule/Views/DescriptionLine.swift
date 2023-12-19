//
//  DescriptionLine.swift
//  HotelProject
//
//  Created by Артем Соловьев on 19.12.2023.
//

import SwiftUI

struct DescriptionLine: View {
    
    var image: String
    var title: String
    var value: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            HStack(spacing: 12) {
                Image(image)
                
                VStack(alignment: .leading, spacing: 4) {
                    Text(title)
                        .font(.system(size: 16))
                        .fontWeight(.regular)
                    
                    Text(value)
                        .font(.system(size: 14))
                        .fontWeight(.regular)
                        .foregroundStyle(Color.blueGray)
                }
                
                Spacer()
                
                Image(systemName: "chevron.right")
            }
            
            Rectangle()
                .fill(Color.blueGray.opacity(0.15))
                .frame(height: 1)
                .padding(.leading, 38)
        }
    }
}

#Preview {
    DescriptionLine(image: "smileEmoji", title: "Test title", value: "Some value")
}
