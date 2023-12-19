//
//  OptionView.swift
//  HotelProject
//
//  Created by Артем Соловьев on 19.12.2023.
//

import SwiftUI

struct OptionView: View {
    
    var optionText: String
    
    var body: some View {
        HStack(spacing: 4) {
            Text(optionText)
                .font(.system(size: 16))
                .fontWeight(.medium)
                .foregroundStyle(Color.blueGray)
        }
        .padding(.horizontal, 10)
        .padding(.vertical, 5)
        .background(Color.lightGrayCustom)
        .cornerRadius(5)
    }
}

#Preview {
    OptionView(optionText: "Test")
}
