//
//  CrashLogDetailsView.swift
//  Mobile Source Inspector
//
//  Created by Apple on 2023/03/18.
//

import SwiftUI
import Foundation

struct CrashLogDetailsView: View {
    let log: CrashLog
    
    var body: some View {
        ScrollView {
            Text(log.contents)
                .padding()
        }
        .navigationBarTitle(log.name)
    }
}

struct CrashLogDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        CrashLogDetailsView(log: CrashLog(name: "Test Log", contents: "This is a test log."))
    }
}

