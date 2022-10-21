//
//  ContentView.swift
//  UselessFacts
//
//  Created by Cesario Nivar on 10/21/22.

import SwiftUI

struct ContentView: View {
    @ObservedObject var factModel = FactViewModel()
    
    var body: some View {
        ZStack {
            LinearGradient(colors: [.blue, .blue.opacity(0.4)], startPoint: .top, endPoint: .bottomTrailing)
                .ignoresSafeArea()
            
            VStack(spacing: 20) {
                Spacer()
                Image(systemName: "books.vertical.circle.fill")
                    .resizable()
                    .frame(width: 100, height: 100)
                
                Text("Useless Facts")
                    .font(.largeTitle).bold()
                    .foregroundColor(.white)
                
                
                Spacer()
                
                Text(factModel.fact)
                    .padding()
                    .font(.title)
                    .frame(height: 300)
                    .animation(.easeIn, value: factModel.fact)
                
                Spacer()
                
                Button {
                    withAnimation {
                        factModel.getFact()
                    }
                } label: {
                    Text("Get random fact")
                        .padding()
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .background(Capsule())
                }
                
                Spacer()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        ContentView().preferredColorScheme(.dark)
    }
}
