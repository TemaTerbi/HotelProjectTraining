//
//  CustomTextField.swift
//  HotelProject
//
//  Created by Артем Соловьев on 19.12.2023.
//

import SwiftUI
import InputMask
import iPhoneNumberField

struct FloatingTextFieldView : View {
    var placeHolder : String? = nil
    var placeHolderPhone : String? = nil
    
    @State var text : String
    
    @State var isEditing: Bool = false
    @State private var edges = EdgeInsets(top: 0, leading: 16, bottom: 0, trailing: 0)
    @State private var fontSize: CGFloat = 17
    @State private var color: Color = .backgroundGrayColor
    
    var isPhone: Bool = true
    
    private enum Field : Int, Hashable {
        case fieldName
    }
    
    @FocusState private var focusField : Field?
    
    var checkValidate: ((Bool) -> Void)?
    
    private func validate() -> Bool {
        
        if isPhone && text.count != 16 {
            color = .redPrimary.opacity(0.15)
            return false
        } else {
            if text.count < 3 {
                color = .redPrimary.opacity(0.15)
                return false
            } else {
                color = .backgroundGrayColor
                return true
            }
        }
    }
    
    var body: some View {
        ZStack(alignment : .leading) {
            HStack {
                if isPhone {
                    iPhoneNumberField(" ", text: $text, isEditing: $isEditing)
                        .flagHidden(true)
                        .prefixHidden(false)
                        .maximumDigits(10)
                        .onEditingBegan { _ in
                            DispatchQueue.main.async {
                                isEditing = true
                                if isEditing {
                                    text = "+7"
                                    edges = EdgeInsets(top: 0, leading: 16, bottom: 32, trailing: 0)
                                    fontSize = 12
                                }
                                else {
                                    text = ""
                                    edges = EdgeInsets(top: 0, leading: 16, bottom: 0, trailing: 0)
                                    fontSize = 17
                                }
                            }
                        }
                        .onEditingEnded {_ in 
                            isEditing = false
                            
                            checkValidate?(validate())
                        }
                } else {
                    TextField("", text: $text) { status in
                        DispatchQueue.main.async {
                            isEditing = status
                            if isEditing {
                                edges = EdgeInsets(top: 0, leading: 16, bottom: 32, trailing: 0)
                                fontSize = 12
                            } else {
                                checkValidate?(validate())
                            }
                        }
                    }
                    .focused($focusField, equals: .fieldName)
                }
            }
            .padding()
            .padding(.top, 8)
            .background(color)
            .cornerRadius(10)
            
            Text(placeHolder ?? "")
                .font(.system(size: fontSize))
                .fontWeight(.regular)
                .foregroundColor(Color.blueGray)
                .padding(edges)
                .animation(Animation.easeInOut(duration: 0.4), value: edges)
                .onTapGesture {
                    self.focusField = .fieldName
                }
            
        }
        .onAppear {
            checkValidate?(false)
        }
    }
}

#Preview {
    FloatingTextFieldView(placeHolder: "test", text: "", checkValidate: {_ in})
}

extension UIApplication {
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}

