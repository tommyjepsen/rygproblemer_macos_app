//
//  ContentView.swift
//  Rygproblemer
//
//  Created by Tommy Jepsen on 22/03/2021.
//

import SwiftUI
import Combine

struct ContentView: View {
    var item: NSStatusItem!
    var popover: NSPopover!
    var icon: String

    var body: some View {
        HStack {
            Button(action: {
                popover.performClose("")
            }) {
                Text("⚡️ Ret dig op!")
                    .fontWeight(.semibold)
                    .font(.body)
                    .padding(0)
            }

        }
        .padding(50)
    }

}

