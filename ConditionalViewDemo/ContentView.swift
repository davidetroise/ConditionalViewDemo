//
//  ContentView.swift
//  ConditionalViewDemo
//
//  Created by Davide Troise with Swift 5.0
//  for the YouTube channel "Coding con Davide" https://bit.ly/3QJziJE
//

import SwiftUI

struct ContentView: View {
    let vegetables = ["lettuce", "tomato", "cucumber", "carrot", "pepper", "onion"]
    
    @State private var data = [String]()
    @State private var isListShowing: Bool = false
    
    var body: some View {
        NavigationStack {
            VStack {
                if isListShowing {
                    List(data, id: \.self) { item in
                        Text(item.capitalized)
                    }
                } else {
                    Text("no data")
                        .foregroundColor(.secondary)
                }
            }
            .navigationTitle("Vegetables")
        }
        .overlay(alignment: .topTrailing) {
            Button {
                isListShowing.toggle()
                
                if isListShowing {
                    data = vegetables
                } else {
                    data = [String]()
                }
            } label: {
                Image(systemName: isListShowing ? "xmark" : "arrow.clockwise")
                    .font(.title)
            }
            .padding()

        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
