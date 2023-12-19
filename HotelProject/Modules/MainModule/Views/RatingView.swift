//
//  RatingView.swift
//  HotelProject
//
//  Created by Артем Соловьев on 19.12.2023.
//

import SwiftUI

struct RatingView: View {
    
    var ratingText: String
    
    var body: some View {
        HStack(spacing: 4) {
            Image(systemName: "star.fill")
                .foregroundStyle(Color.darkYellowCustom)
            
            Text(ratingText)
                .font(.system(size: 16))
                .fontWeight(.medium)
                .foregroundStyle(Color.darkYellowCustom)
        }
        .padding(.horizontal, 10)
        .padding(.vertical, 5)
        .background(Color.lightYellowCustom.opacity(0.2))
        .cornerRadius(5)
    }
}

#Preview {
    RatingView(ratingText: "5 Execellent")
}
