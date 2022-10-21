//
//  ContentView.swift
//  UselessFacts
//
//  Created by Cesario Nivar on 10/21/22.
// Endopoint URL: https://uselessfacts.jsph.pl/random.json

import SwiftUI

struct Fact: Decodable {
    let id: String
    let text: String
}

struct ContentView: View {
    @State private var randomFact = ""
    
    var body: some View {
        ZStack {
            LinearGradient(colors: [.blue, .blue.opacity(0.3)], startPoint: .top, endPoint: .bottomTrailing)
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
                
                Text(randomFact)
                    .padding()
                    .font(.title)
                    .frame(height: 300)
                    .animation(.easeIn, value: randomFact)
                
                Spacer()
                
                Button {
                    withAnimation {
                        getFact()
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
            .onAppear {
                getFact()
            }
        }
    }
    
    func getFact() {
        URLSession.shared.dataTask(with: URL(string: "https://uselessfacts.jsph.pl/random.json")!) { data, _ , _ in
            
            guard let data = data else {
                print("Data not exists...")
                return
            }
            
            let fact = try? JSONDecoder().decode(Fact.self, from: data)
            randomFact = fact?.text ?? "Crocodiles and alligators are surprisingly fast on land.  Although they are rapid, they are not agile.  So, if being chased by one, run in a zigzag line to lose him or her."
        }
        .resume()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        ContentView().preferredColorScheme(.dark)
    }
}
