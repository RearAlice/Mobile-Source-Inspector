//
//  ContentView.swift
//  Mobile Source Inspector
//
//  Created by Apple on 2023/03/18.
//

import Foundation
import SwiftUI

struct CrashLog: Identifiable {
    let id = UUID()
    let name: String
    let contents: String
}

struct ContentView: View {
    @State private var logs: [CrashLog] = []

    var body: some View {
        NavigationView {
            List(logs) { log in
                NavigationLink(destination: CrashLogDetailsView(log: log)) {
                    Text(log.name)
                }
            }
            .navigationBarTitle("Crash Logs")
            .onAppear(perform: {
                loadCrashLogs()
            })
        }
    }
    
    private func loadCrashLogs() {
        do {
            let logsDirectory = try FileManager.default.url(for: .libraryDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
                .appendingPathComponent("Logs/CrashReporter")
            let fileManager = FileManager.default
            let files = try fileManager.contentsOfDirectory(atPath: logsDirectory.path)
            for fileName in files {
                let fileUrl = logsDirectory.appendingPathComponent(fileName)
                let log = CrashLog(name: fileName, contents: try String(contentsOf: fileUrl))
                logs.append(log)
            }
        } catch {
            print("Error loading crash logs: \(error.localizedDescription)")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
