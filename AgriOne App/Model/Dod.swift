//
//  Dod.swift
//  AgriOne-iOS
//
//  Created by Yasith Thathsara Senarathne on 2/20/20.
//  Copyright © 2020 Yasith Thathsara Senarathne. All rights reserved.
//

import Foundation

struct Dod{
    var id:String?
    var date:String?
}

func getDodList()->[Dod]{
    var dodList:[Dod] = []
    dodList.append(Dod.init(id: "1", date: "2020-02-19"))
    dodList.append(Dod.init(id: "2", date: "2020-02-18"))
    dodList.append(Dod.init(id: "3", date: "2020-02-17"))
    dodList.append(Dod.init(id: "4", date: "2020-02-16"))
    dodList.append(Dod.init(id: "5", date: "2020-02-15"))
    dodList.append(Dod.init(id: "6", date: "2020-02-14"))
    dodList.append(Dod.init(id: "7", date: "2020-02-13"))
    dodList.append(Dod.init(id: "8", date: "2020-02-12"))
    dodList.append(Dod.init(id: "9", date: "2020-02-11"))
    dodList.append(Dod.init(id: "10", date: "2020-02-10"))
    
    return dodList
}
