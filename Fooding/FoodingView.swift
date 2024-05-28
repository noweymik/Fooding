//
//  FoodingView.swift
//  Fooding
//
//  Created by yewoni on 5/21/24.
//
//

import SwiftUI

struct FoodingView: View {
    @State var selectedButton: String = "메인메뉴"
    @State private var isCartPresented: Bool = false // 장바구니 모달 표시용
    @State var cartMenus: [(menu: Menu, count: Int)] = []
    @State var sum: Int = 0
    
    var body: some View {
        VStack {
            HStack {
                Spacer()
                // 장바구니 버튼
                Button(action: {
                    isCartPresented.toggle()         // true, false 반대로
                }) {
                    Image(systemName: "cart")
                        .foregroundColor(.black)
                        .font(.title)
                }
                .padding()
                .sheet(isPresented: $isCartPresented) {
                    CartView(isCartPresented: $isCartPresented, cartMenus: $cartMenus, sum: $sum)
                }
            }
            HStack(spacing: 0) {
                // 메인메뉴, 사이드, 음료, 추가메뉴를 고를 수 있는 메뉴뷰
                MenuView(selectedButton: $selectedButton)
                    .padding(.leading, -40)
                    .padding(.top, -100)
                
                // divider
                Rectangle()
                    .frame(width: 0.5)
                    .foregroundColor(.gray)
                    .padding(.vertical)
                    .padding(.leading, 30)
                    .padding(.trailing, 40)
                    .padding(.top, -50)
                
                // 왼쪽 버튼에 해당하는 메뉴 아이템을 보여주는 뷰
                MenuItemView(selectedButton: $selectedButton, cartMenus: $cartMenus, sum: $sum)
                    .padding(.top, -40)
            }
        }
    }
}

func calculateSum(cartMenus: [(menu: Menu, count: Int)]) -> Int {
    var sum = 0
    for item in cartMenus {
        sum += item.menu.price * item.count
    }
    return sum
}


struct CartView: View {
    @Binding var isCartPresented: Bool
    @Binding var cartMenus: [(menu: Menu, count: Int)]
    @Binding var sum: Int
    
    
    var body: some View {
                
        VStack {
            Text("장바구니")
                .font(.largeTitle)
                .padding()
            
            List {
                ForEach(cartMenus.indices, id: \.self) { index in
                    HStack {
                        Text(cartMenus[index].menu.name)
                        Spacer()
                        
                        // 빼기 버튼
                        Button(action: {
                            print("minus button")
                            if cartMenus[index].count > 0 {
                                cartMenus[index].count -= 1
                                sum = calculateSum(cartMenus: cartMenus)
                            }
                            // 만약 count == 0이 됐다면 cartMenu[index] delete
                            if cartMenus[index].count == 0 {
                                cartMenus.remove(at: index)
                            }
                        }) {
                            Image(systemName: "minus.circle")
                        }
                        .buttonStyle(.plain)
                        
                        // 음식 개수
                        Text("\(cartMenus[index].count)개")
                        
                        // 추가하기 버튼
                        Button(action: {
                            print("plus button")
                            cartMenus[index].count += 1
                            sum = calculateSum(cartMenus: cartMenus)
                        }) {
                            Image(systemName: "plus.circle")
                        }
                        .buttonStyle(.plain)

                    }
                }
            }
            
            Spacer()
            Text("총합 : \(sum)")
                .font(.title)
            HStack {
                Button(action: {
                    isCartPresented = false
                }) {
                    Text("닫기")
                        .font(.title)
                        .padding()
                        .background(Color.gray)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                
                Button(action: {
                    // 주문하면~~~~?
                    print("주문하기")
                    
                }) {
                    Text("주문하기")
                        .font(.title)
                        .padding()
                        .background(Color.red)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
            }

        }
        .padding()
    }
}
