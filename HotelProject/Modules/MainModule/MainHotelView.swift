//
//  MainHotelView.swift
//  HotelProject
//
//  Created by Артем Соловьев on 18.12.2023.
//

import SwiftUI

struct MainHotelView: View {
    
    @State private var imageSelection = 0
    @StateObject private var viewModel = MainViewModel()
    
    init() {
        UIToolbar.appearance().barTintColor = UIColor.white
    }
    
    var body: some View {
        ZStack {
            Color.backgroundGrayColor.ignoresSafeArea(edges: .bottom)
            
            ScrollView {
                VStack(spacing: 8) {
                    VStack {
                        VStack(alignment: .leading, spacing: 16) {
                            TabView(selection: $imageSelection) {
                                ForEach(0..<viewModel.imageUrls.count, id: \.self) { items in
                                    Images(url: viewModel.imageUrls[items])
                                        .tag(items)
                                }
                            }
                            .tabViewStyle(.page(indexDisplayMode: .always))
                            .frame(height: 257)
                            
                            VStack(alignment: .leading, spacing: 8) {
                                RatingView(ratingText: viewModel.rating)
                                
                                Text(viewModel.hotelName)
                                    .font(.system(size: 22))
                                    .fontWeight(.medium)
                                
                                Text(viewModel.adress)
                                    .font(.system(size: 14))
                                    .fontWeight(.medium)
                                    .foregroundStyle(Color.bluePrimary)
                            }
                            
                            HStack(alignment: .firstTextBaseline, spacing: 8) {
                                Text(viewModel.price)
                                    .font(.system(size: 30))
                                    .fontWeight(.semibold)
                                
                                Text(viewModel.priceFor)
                                    .font(.system(size: 16))
                                    .fontWeight(.regular)
                                    .foregroundStyle(Color.blueGray)
                            }
                        }
                        .padding(.horizontal, 16)
                        .padding(.bottom, 16)
                        .padding(.top, 16)
                    }
                    .background(.white)
                    .cornerRadius(12, corners: [.bottomLeft, .bottomRight])
                    
                    VStack {
                        VStack(alignment: .leading, spacing: 16) {
                            HStack {
                                Text("Об отеле")
                                    .font(.system(size: 22))
                                    .fontWeight(.medium)
                                
                                Spacer()
                            }
                            
                            VStack(spacing: 8) {
                                WrappingHStack(horizontalSpacing: 8, verticalSpacing: 8) {
                                    ForEach(0..<viewModel.peculiarities.count, id: \.self) { items in
                                        OptionView(optionText: viewModel.peculiarities[items])
                                    }
                                }
                                
                                Text(viewModel.description)
                                    .font(.system(size: 16))
                                    .fontWeight(.regular)
                                    .multilineTextAlignment(.leading)
                            }
                            
                            VStack(spacing: 10) {
                                DescriptionLine(image: "smileEmoji", title: "Удобства", value: "Самое необходимое")
                                DescriptionLine(image: "xmarkDone", title: "Что включено", value: "Самое необходимое")
                                DescriptionLine(image: "xmark", title: "Что не включено", value: "Самое необходимое")
                            }
                            .padding(15)
                            .background(Color.lightGrayCustom)
                            .cornerRadius(15)
                        }
                        .padding(.horizontal, 16)
                        .padding(.vertical, 16)
                    }
                    .background(.white)
                    .cornerRadius(12)
                }
            }
            .scrollIndicators(.hidden)
        }
        .navigationTitle("Отель")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .bottomBar) {
                NavigationLink {
                    RoomsViewList(title: viewModel.hotelName)
                } label: {
                    VStack {
                        Text("К выбору номера")
                            .font(.system(size: 16))
                            .fontWeight(.medium)
                            .foregroundStyle(.white)
                            .padding(.horizontal, 105)
                    }
                    .frame(height: 48)
                    .background(Color.bluePrimary)
                    .cornerRadius(15)
                    .padding(.top, 15)
                }
            }
        }
        .toolbarBackground(.visible, for: .bottomBar)
        .navigationBarBackButtonHidden()
        .onAppear {
            viewModel.getFirstPage()
        }
    }
}

#Preview {
    MainHotelView()
}
