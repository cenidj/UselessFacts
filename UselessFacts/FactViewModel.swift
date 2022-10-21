//
//  FactViewModel.swift
//  UselessFacts
//
//  Created by Cesario Nivar on 10/21/22.
//

import Foundation


// Endopoint URL: https://uselessfacts.jsph.pl/random.json

final class FactViewModel: ObservableObject {
    @Published var fact: String = ""
    
    init() {
        getFact()
    }
    
    func getFact() {
        URLSession.shared.dataTask(with: URL(string: "https://uselessfacts.jsph.pl/random.json")!) { data, _ , _ in
            
            guard let data = data else {
                print("Data not exists...")
                return
            }
            
            self.fact = try! JSONDecoder().decode(Fact.self, from: data).text 
        }
        .resume()
    }
    
    
}
