//
//  MenuData.swift
//  Fooding
//
//  Created by yewoni on 5/21/24.
//

import SwiftUI

// 메뉴 정보를 담을 구조체
struct Menu: Identifiable {
    var id = UUID()
    var name: String!
    var price: Int
    var imageName: String
    var description: String
}

struct MainMenuData {
    static let menu = [
        Menu(name: "남부시장식 콩나물국밥", price: 8000, imageName: "food1", description: "뚝배기를 가스불에 끓이지 않고 밥 콩나물 신선 야채다짐(청양고추파마늘)을 담은 뚝배기에 솥단지 속 끓고있는 육수를 국자로 떠 담아내는 방식\n펄펄 뜨겁지 않고, 적당히 뜨거운 국물온도"),
        Menu(name: "전통직화식 콩나물국밥", price: 8000, imageName: "food2", description: "뚝배기에 밥 콩나물 신선야채다짐(청양고추 제외) 육수를 담고 가스불에 펄펄 끓여 내는 일반적이고 전통적인 콩나물국밥\n식어가면서 구수하고 걸쭉한 맛\n'청양고추다짐'이 들어 가지 않아 거의 맵지 않음"),
        Menu(name: "매운탕식 콩나물국밥", price: 8000, imageName: "food3", description: "뚝배기에 밥 콩나물 들깨가루 고춧가루 신선야채다짐(청양고추 제외) 육수를 담고 가스불에 펄펄 끓여내는 방식\n들깨가루 고춧가루 등의 매운탕식 다대기가 내는 구수하고 얼큰한 맛"),
        Menu(name: "맑은탕식 콩나물국밥", price: 8000, imageName: "food4", description: "뚝배기에 밥 콩나물 신선야채다짐(소량의 청양고추 포함) 육수를 담아 가스불에 펄펄 끓인 것\n국밥 속에 계란이 풀어져 있지 않아 맑고 깔끔한 맛\n'쳥양고추다짐'이 소량 들어가 약간 매운 맛/ 남부시장식 보다는 덜 매운 맛"),
        Menu(name: "전주 비빔밥", price: 10000, imageName: "food5", description: "전주비빔밥에 들어간 재료 30여가지 \n주재료: 쌀·콩나물·황포묵·고추장·쇠고기육회(또는 쇠고기볶음)·접장·참기름·달걀 \n부재료: 깨소금·마늘·후추·시금치·고사리·송이버섯·\n표고버섯·숙주나물·무생채·애호박볶음·오이채·당근채·\n파·상추·부추·은행·밤채·실백·김 등"),
        Menu(name: "순두부찌개", price: 9000, imageName: "food6", description: "순두부나 일반모두부가 아닌 (주)대상에서 제조한 청정원의 '찌개용두부' 사용")
    ]
}

struct SideMenuData {
    static let menu = [
        Menu(name: "데친 큰오징어 한마리", price: 10000, imageName: "side1", description: ""),
        Menu(name: "오징어 튀김 한접시", price: 8000, imageName: "side2", description: ""),
        Menu(name: "편육 한접시", price: 9000, imageName: "side3", description: "")
    ]
}

struct DrinkData {
    static let menu = [
        Menu(name: "콜라", price: 2000, imageName: "drink1", description: ""),
        Menu(name: "사이다", price: 2000, imageName: "drink2", description: ""),
        Menu(name: "모주 1잔", price: 2000, imageName: "drink3", description: ""),
        Menu(name: "모주 1병", price: 9000, imageName: "drink4", description: ""),
    ]
}

struct AddMenuData {
    static let menu = [
        Menu(name: "오징어 사리", price: 2000, imageName: "add1", description: ""),
        Menu(name: "수란", price: 1000, imageName: "add2", description: ""),
        Menu(name: "공기밥", price: 1000, imageName: "add3", description: ""),
        Menu(name: "콩나물 추가", price: 1000, imageName: "add4", description: ""),
    ]
}

