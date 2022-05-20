//
//  SbSAvailabilityChecks.swift
//  SwiftbySyndell
//
//  Created by Kairo Sumida on 20/05/22.
//

import SwiftUI

func checkAvailability() -> String{
    if #available(iOS 14, *) {
        return ">14"
    } else {
        return "<14"
    }
}
struct SbSAvailabilityChecks: View {
    var body: some View {
        
        Text(checkAvailability())
    }
}

struct SbSAvailabilityChecks_Previews: PreviewProvider {
    static var previews: some View {
        SbSAvailabilityChecks()
    }
}
