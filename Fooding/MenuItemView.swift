//
//  MainMenuView.swift
//  Fooding
//
//  Created by hannah on 5/17/24.
//

import SwiftUI

struct MenuItemView: View {
    @Binding var selectedButton: String
    @Binding var cartMenus: [(menu: Menu, count: Int)]
    @Binding var sum: Int
    
    // 왼쪽 버튼에 따른 Data 가져오기
    var menuItems: [Menu] {
        switch selectedButton {
        case "사이드":
            return SideMenuData.menu
        case "음료":
            return DrinkData.menu
        case "추가메뉴":
            return AddMenuData.menu
        default:
            return MainMenuData.menu
        }
    }
    
    let columns = [
        GridItem(.fixed(250)),
        GridItem(.fixed(250)),
        GridItem(.fixed(250))
    ]
    
    @State private var selectedItem: Menu?
    @State private var isShowingModal = false
    
    var body: some View {
        LazyVGrid(columns: columns, spacing: 20) {
            ForEach(menuItems) { item in
                VStack {
                    // 음식 사진
                    Image(item.imageName)
                        .resizable()
                        .frame(width: 210, height: 150)
                        .aspectRatio(contentMode: .fill)
                        .clipped()
                    // 음식 이름
                    Text(item.name)
                        .font(.title2)
                        .bold()
                    
                    HStack {
                        // 물음표 버튼
                        Button(action: {
                            selectedItem = item
                            isShowingModal.toggle()
                        }) {
                            Image(systemName: "questionmark")
                                .padding(10)
                                .background(Circle().fill(Color.gray))
                                .foregroundColor(.white)
                        }
                        .frame(width: 15, height: 15)
                        
                        Spacer()
                        
                        // 가격
                        Text("\(item.price)원")
                            .font(.headline)
                        
                        Spacer()
                        
                        // 장바구니에 추가하기 버튼
                        Button(action: {
                            if let index = cartMenus.firstIndex(where: { $0.menu.id == item.id }) {
                                // 기존 장바구니에 있는 경우 count만 +1
                                cartMenus[index].count += 1
                            } else {
                                // 기존 장바구니에 없을 경우 추가
                                cartMenus.append((menu: item, count: 1))
                            }
                            // 장바구니에 보여줄 총합도 다시 계산하기
                            sum = calculateSum(cartMenus: cartMenus)
                        }) {
                            Image(systemName: "plus")
                                .padding(10)
                                .background(Circle().fill(Color.gray))
                                .foregroundColor(.white)
                        }
                        .frame(width: 15, height: 15)
                    }
                    .frame(width: 180)
                }
                .padding()
                .frame(width: 250, height: 250)
                .background(Color(.systemGray6))
                .cornerRadius(10)
            }
        }
        .padding()
        .sheet(item: $selectedItem) { item in
            MenuDescriptionView(menuItem: item)
        }
    }
}

// 물음표 버튼을 눌렀을 때 정보 보여주는 모달 뷰
struct MenuDescriptionView: View {
    var menuItem: Menu
    
    var body: some View {
        VStack {
            Spacer()
            Text(menuItem.name)
                .font(.largeTitle)
                .bold()
                .padding()

            Image(menuItem.imageName)
                .resizable()
                .frame(width: 350, height: 300)
                .aspectRatio(contentMode: .fill)
                .clipped()
                .padding(.top, 20)
                .padding(.bottom, 20)
            
            Text(menuItem.description)
                .font(.title)
                .padding()
                .frame(width: 600)
            Spacer()
        }
    }
}
