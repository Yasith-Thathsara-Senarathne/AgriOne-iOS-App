//
//  Desiease.swift
//  AgriOne-iOS
//
//  Created by Yasith Thathsara Senarathne on 2/24/20.
//  Copyright © 2020 Yasith Thathsara Senarathne. All rights reserved.
//

import Foundation
import UIKit

struct DODesiease {
    var date:String!
    var averagePrecentage:Double!
    var desieaseList:[Desiease]!
}

struct Desiease {
    var image:String!
    var precentage:Double!
}


//func getDesiease()->[Desiease] {
//    var desiease:[Desiease] = []
//
//    desiease.append(.init(id: "1", image: #imageLiteral(resourceName: "Unknown-2"), precentage: 45))
//    desiease.append(.init(id: "2", image: #imageLiteral(resourceName: "Unknown-6"), precentage: 67))
//    desiease.append(.init(id: "3", image: #imageLiteral(resourceName: "Unknown"), precentage: 34))
//    desiease.append(.init(id: "4", image: #imageLiteral(resourceName: "Unknown-7"), precentage: 55))
//    desiease.append(.init(id: "5", image: #imageLiteral(resourceName: "Unknown-5"), precentage: 21))
//    desiease.append(.init(id: "6", image: #imageLiteral(resourceName: "Unknown"), precentage: 80))
//    desiease.append(.init(id: "7", image: #imageLiteral(resourceName: "Unknown-3"), precentage: 27))
//    desiease.append(.init(id: "8", image: #imageLiteral(resourceName: "Unknown-4"), precentage: 43))
//
//    return desiease
//}
//
//func getDesieaseList()->DODesiease {
//    return .init(id: "1", date: "2020-02-19", averagePrecentage: 79, desieaseList: getDesiease())
//}
