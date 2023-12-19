//
//  OrderView.swift
//  HotelProject
//
//  Created by Артем Соловьев on 19.12.2023.
//

import SwiftUI

struct OrderView: View {
    
    @Environment(\.dismiss) var dismiss
    
    @State private var phoneText = ""
    @State private var emailText = ""
    
    @State private var countOfCellTourist = 1
    
    @StateObject var viewModel = OrderViewModel()
    
    @State var idValidField: [Bool] = []
    
    private func endEditing() {
        UIApplication.shared.endEditing()
    }
    
    var body: some View {
        ZStack {
            Color.backgroundGrayColor.ignoresSafeArea(edges: .bottom)
            
            ScrollView {
                VStack {
                    VStack(alignment: .leading, spacing: 8) {
                        HStack {
                            RatingView(ratingText: "\(viewModel.orderPage.horating ?? 0) \(viewModel.orderPage.rating_name ?? "")")
                            
                            Spacer()
                        }
                        
                        Text(viewModel.orderPage.hotel_name ?? "")
                            .font(.system(size: 22))
                            .fontWeight(.medium)
                        
                        Text(viewModel.orderPage.hotel_adress ?? "")
                            .font(.system(size: 14))
                            .fontWeight(.medium)
                            .foregroundStyle(Color.bluePrimary)
                    }
                    .padding(.horizontal, 16)
                    .padding(.vertical, 16)
                }
                .background(.white)
                .cornerRadius(15)
                .padding(.vertical, 8)
                
                VStack {
                    VStack(alignment: .leading, spacing: 16) {
                        HStack {
                            HStack {
                                Text("Вылет из")
                                    .font(.system(size: 16))
                                    .fontWeight(.regular)
                                    .foregroundStyle(Color.blueGray)
                                
                                Spacer()
                            }
                            .frame(width: 150)
                            
                            Text(viewModel.orderPage.departure ?? "")
                                .font(.system(size: 16))
                                .fontWeight(.regular)
                            
                            Spacer()
                        }
                        
                        HStack {
                            HStack {
                                Text("Страна, город")
                                    .font(.system(size: 16))
                                    .fontWeight(.regular)
                                    .foregroundStyle(Color.blueGray)
                                
                                Spacer()
                            }
                            .frame(width: 150)
                            
                            Text(viewModel.orderPage.arrival_country ?? "")
                                .font(.system(size: 16))
                                .fontWeight(.regular)
                            
                            Spacer()
                        }
                        
                        HStack {
                            HStack {
                                Text("Даты")
                                    .font(.system(size: 16))
                                    .fontWeight(.regular)
                                    .foregroundStyle(Color.blueGray)
                                
                                Spacer()
                            }
                            .frame(width: 150)
                            
                            Text("\(viewModel.orderPage.tour_date_start ?? "") - \(viewModel.orderPage.tour_date_stop ?? "")")
                                .font(.system(size: 16))
                                .fontWeight(.regular)
                            
                            Spacer()
                        }
                        
                        HStack {
                            HStack {
                                Text("Кол-во ночей")
                                    .font(.system(size: 16))
                                    .fontWeight(.regular)
                                    .foregroundStyle(Color.blueGray)
                                
                                Spacer()
                            }
                            .frame(width: 150)
                            
                            Text("\(viewModel.orderPage.number_of_nights ?? 0)")
                                .font(.system(size: 16))
                                .fontWeight(.regular)
                            
                            Spacer()
                        }
                        
                        HStack {
                            HStack {
                                Text("Отель")
                                    .font(.system(size: 16))
                                    .fontWeight(.regular)
                                    .foregroundStyle(Color.blueGray)
                                
                                Spacer()
                            }
                            .frame(width: 150)
                            
                            Text(viewModel.orderPage.hotel_name ?? "")
                                .font(.system(size: 16))
                                .fontWeight(.regular)
                            
                            Spacer()
                        }
                        
                        HStack {
                            HStack {
                                Text("Номер")
                                    .font(.system(size: 16))
                                    .fontWeight(.regular)
                                    .foregroundStyle(Color.blueGray)
                                
                                Spacer()
                            }
                            .frame(width: 150)
                            
                            Text(viewModel.orderPage.room ?? "")
                                .font(.system(size: 16))
                                .fontWeight(.regular)
                            
                            Spacer()
                        }
                        
                        HStack {
                            HStack {
                                Text("Питание")
                                    .font(.system(size: 16))
                                    .fontWeight(.regular)
                                    .foregroundStyle(Color.blueGray)
                                
                                Spacer()
                            }
                            .frame(width: 150)
                            
                            Text(viewModel.orderPage.nutrition ?? "")
                                .font(.system(size: 16))
                                .fontWeight(.regular)
                            
                            Spacer()
                        }
                    }
                    .padding(.horizontal, 16)
                    .padding(.vertical, 16)
                }
                .background(.white)
                .cornerRadius(15)
                
                VStack {
                    VStack(spacing: 20) {
                        HStack {
                            Text("Информация о покупателе")
                                .font(.system(size: 22))
                                .fontWeight(.medium)
                            
                            Spacer()
                        }
                        
                        VStack(alignment: .leading, spacing: 8) {
                            FloatingTextFieldView(placeHolder: "Номер телефона", text: phoneText) { bool in
//                                idValidField.insert(bool, at: 0)
                            }
                                .keyboardType(.phonePad)
                                .submitLabel(.done)
                            FloatingTextFieldView(placeHolder: "Почта", text: emailText, isPhone: false) { bool in
//                                idValidField.insert(bool, at: 1)
                            }
                            
                            Text("Эти данные никому не передаются. После оплаты мы вышли чек на указанный вами номер и почту")
                                .font(.system(size: 14))
                                .fontWeight(.regular)
                                .foregroundStyle(Color.blueGray)
                        }
                    }
                    .padding(.horizontal, 16)
                    .padding(.vertical, 16)
                }
                .background(.white)
                .cornerRadius(15)
                
                ForEach(0..<countOfCellTourist, id: \.self) { item in
                    TouristCell(count: item, validField: $idValidField)
                }
                
                if countOfCellTourist != 4 {
                    VStack {
                        VStack {
                            HStack {
                                Text("Добавить туриста")
                                    .font(.system(size: 22))
                                    .fontWeight(.medium)
                    
                                Spacer()
                                
                                Button {
                                    withAnimation(.bouncy) {
                                        if countOfCellTourist != 4 {
                                            countOfCellTourist += 1
                                        }
                                    }
                                } label: {
                                    VStack {
                                        Image(systemName: "plus")
                                            .foregroundStyle(Color.white)
                                    }
                                    .padding(.vertical, 10)
                                    .padding(.horizontal, 10)
                                    .background(Color.bluePrimary)
                                    .cornerRadius(6)
                                }
                            }
                        }
                        .padding(.horizontal, 16)
                        .padding(.vertical, 16)
                    }
                    .background(.white)
                    .cornerRadius(15)
                }
                
                VStack {
                    VStack(spacing: 16) {
                        HStack {
                            Text("Тур")
                                .font(.system(size: 16))
                                .fontWeight(.regular)
                                .foregroundStyle(Color.blueGray)
                            
                            Spacer()
                            
                            Text("\(viewModel.orderPage.tour_price ?? 0) ₽")
                                .font(.system(size: 16))
                                .fontWeight(.regular)
                        }
                        
                        HStack {
                            Text("Топливный сбор")
                                .font(.system(size: 16))
                                .fontWeight(.regular)
                                .foregroundStyle(Color.blueGray)
                            
                            Spacer()
                            
                            Text("\(viewModel.orderPage.fuel_charge ?? 0) ₽")
                                .font(.system(size: 16))
                                .fontWeight(.regular)
                        }
                        
                        HStack {
                            Text("Сервисный сбор")
                                .font(.system(size: 16))
                                .fontWeight(.regular)
                                .foregroundStyle(Color.blueGray)
                            
                            Spacer()
                            
                            Text("\(viewModel.orderPage.service_charge ?? 0) ₽")
                                .font(.system(size: 16))
                                .fontWeight(.regular)
                        }
                        
                        HStack {
                            Text("К оплате")
                                .font(.system(size: 16))
                                .fontWeight(.regular)
                                .foregroundStyle(Color.blueGray)
                            
                            Spacer()
                            
                            Text("\((viewModel.orderPage.service_charge ?? 0) + (viewModel.orderPage.fuel_charge ?? 0) + (viewModel.orderPage.tour_price ?? 0)) ₽")
                                .font(.system(size: 16))
                                .fontWeight(.regular)
                                .foregroundStyle(Color.bluePrimary)
                        }
                    }
                    .padding(.horizontal, 16)
                    .padding(.vertical, 16)
                }
                .background(.white)
                .cornerRadius(15)
            }
            .scrollIndicators(.hidden)
        }
        .navigationTitle("Бронирование")
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden()
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                Button(action: {
                    dismiss()
                }, label: {
                    Image(systemName: "chevron.left")
                        .foregroundStyle(.black)
                })
            }
            
            ToolbarItem(placement: .bottomBar) {
                NavigationLink {
                    DoneOrderView()
                } label: {
                    VStack {
                        Text("Оплатить \((viewModel.orderPage.service_charge ?? 0) + (viewModel.orderPage.fuel_charge ?? 0) + (viewModel.orderPage.tour_price ?? 0)) ₽")
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
        .onAppear {
            viewModel.getOrderPage()
        }
        .onTapGesture {
            self.endEditing()
        }
    }
}

#Preview {
    OrderView()
}

struct TouristCell: View {
    
    var count: Int
    
    @State private var infoHidden = true
    
    @State private var phoneText = ""
    @State private var emailText = ""
    
    @Binding var validField: [Bool]
    
    var body: some View {
        VStack {
            VStack {
                HStack {
                    switch count {
                    case 0:
                        Text("Первый турист")
                            .font(.system(size: 22))
                            .fontWeight(.medium)
                    case 1:
                        Text("Второй турист")
                            .font(.system(size: 22))
                            .fontWeight(.medium)
                    case 2:
                        Text("Третий турист")
                            .font(.system(size: 22))
                            .fontWeight(.medium)
                    case 3:
                        Text("Четвертый турист")
                            .font(.system(size: 22))
                            .fontWeight(.medium)
                    default:
                        Text("Первый турист")
                            .font(.system(size: 22))
                            .fontWeight(.medium)
                    }
        
                    Spacer()
                    
                    VStack {
                        Image(systemName: infoHidden ? "chevron.down" : "chevron.up")
                            .foregroundStyle(Color.bluePrimary)
                    }
                    .padding(.vertical, 12)
                    .padding(.horizontal, 10)
                    .background(Color.bluePrimary.opacity(0.10))
                    .cornerRadius(6)
                    .onTapGesture {
                        withAnimation(.bouncy) {
                            infoHidden.toggle()
                        }
                    }
                }
                
                if !infoHidden {
                    VStack(alignment: .leading, spacing: 8) {
                        FloatingTextFieldView(placeHolder: "Имя", text: phoneText, isPhone: false) { isValid in
//                            validField.insert(isValid, at: count + 1)
                        }
                        FloatingTextFieldView(placeHolder: "Фамилия", text: emailText, isPhone: false) { isValid in
//                            validField.insert(isValid, at: count + 1)
                        }
                        FloatingTextFieldView(placeHolder: "Дата рождения", text: emailText, isPhone: false) { isValid in
//                            validField.insert(isValid, at: count + 1)
                        }
                        FloatingTextFieldView(placeHolder: "Гражданство", text: emailText, isPhone: false) { isValid in
//                            validField.insert(isValid, at: count + 1)
                        }
                        FloatingTextFieldView(placeHolder: "Номер загранпаспорта", text: emailText, isPhone: false) { isValid in
//                            validField.insert(isValid, at: count + 1)
                        }
                        FloatingTextFieldView(placeHolder: "Срок действия загранпаспорта", text: emailText, isPhone: false) { isValid in
//                            validField.insert(isValid, at: count + 1)
                        }
                    }
                }
            }
            .padding(.horizontal, 16)
            .padding(.vertical, 16)
        }
        .background(.white)
        .cornerRadius(15)
    }
}
