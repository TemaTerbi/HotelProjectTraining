//
//  Images.swift
//  HotelProject
//
//  Created by Артем Соловьев on 19.12.2023.
//

import SwiftUI
import Kingfisher

struct Images: View {
    
    var url: String
    
    var body: some View {
        VStack {
            KFImage.url(URL(string: url))
                .resizable()
                .fade(duration: 0.4)
                .cornerRadius(15)
        }
    }
}

#Preview {
    Images(url: "")
}
