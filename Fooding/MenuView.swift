//
//  MenuView.swift
//  Fooding
//
//  Created by hannah on 5/17/24.
//

import SwiftUI

struct MenuView: View {
    @Binding var selectedButton: String
    
    var body: some View {
        VStack(alignment: .center, spacing: 16) {
            Image("logo")
                .imageScale(.large)
                .foregroundStyle(.tint)

            Image("FOODING")
            
            Divider()
                .frame(width: 180)
            
            Button(action: {
                selectedButton = "메인메뉴"
            }) {
                Text("메인메뉴")
                    .font(.system(size: 18, weight: .bold))
                    .frame(maxWidth: 100)
                    .padding()
                    .foregroundColor(selectedButton == "메인메뉴" ? .white : .black)
                    .background(selectedButton == "메인메뉴" ? Color.black : Color.gray.opacity(0.5))
                    .cornerRadius(10)
            }
            Button(action: {
                selectedButton = "사이드"
            }) {
                Text("사이드")
                    .font(.system(size: 18, weight: .bold))
                    .frame(maxWidth: 100)
                    .padding()
                    .foregroundColor(selectedButton == "사이드" ? .white : .black)
                    .background(selectedButton == "사이드" ? Color.black : Color.gray.opacity(0.5))
                    .cornerRadius(10)
            }
            Button(action: {
                selectedButton = "음료"
            }) {
                Text("음료")
                    .font(.system(size: 18, weight: .bold))
                    .frame(maxWidth: 100)
                    .padding()
                    .foregroundColor(selectedButton == "음료" ? .white : .black)
                    .background(selectedButton == "음료" ? Color.black : Color.gray.opacity(0.5))
                    .cornerRadius(10)
            }
            Button(action: {
                selectedButton = "추가메뉴"
            }) {
                Text("추가메뉴")
                    .font(.system(size: 18, weight: .bold))
                    .frame(maxWidth: 100)
                    .padding()
                    .foregroundColor(selectedButton == "추가메뉴" ? .white : .black)
                    .background(selectedButton == "추가메뉴" ? Color.black : Color.gray.opacity(0.5))
                    .cornerRadius(10)
            }
        }
        .padding()
    }
}
