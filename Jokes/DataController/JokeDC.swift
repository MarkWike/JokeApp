//
//  JokeDC.swift
//  Jokes
//
//  Created by Mark Wike on 06/04/2022.
//

import Foundation
import Combine

class JokeDataController: ObservableObject {

    @Published var jokeInfo: JokeInfo?
  //  var MatchId : Int
    var cancellable: Set<AnyCancellable> = []
    
    func fetch() {
        let url = URL(string: "https://v2.jokeapi.dev/joke/Any?safe-mode")
        URLSession.shared.dataTaskPublisher(for: url!)
            .map { $0.data }
            .decode(type: JokeInfo?.self, decoder: JSONDecoder())
            .receive(on: RunLoop.main)
            .sink { [weak self]  completion in
                print("Event \(completion) from \(String(describing: self))")
                if case .failure(let error) = completion {
                    print("There was an error, Error: \(error)")
                }
            } receiveValue: { [unowned self] data in
                jokeInfo = data
            }
            .store(in: &cancellable)
    }
   
}
