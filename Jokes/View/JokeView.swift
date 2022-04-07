//
//  JokeView.swift
//  Jokes
//
//  Created by Mark Wike on 06/04/2022.
//Baskerville-Bold

import SwiftUI

struct JokeView: View {
    @ObservedObject var jokedataController = JokeDataController()
    
    var body: some View {
        ZStack{
            Color.pink.ignoresSafeArea()
        
        VStack{
            if jokedataController.jokeInfo?.type == "single" {
                //Text(jokedataController.jokeInfo?.joke ?? "joke")
                Text(jokedataController.jokeInfo?.joke ?? "joke")
                    .font(.custom("Baskerville-Bold", size: 30, relativeTo: .headline))
                    .frame(width: 300, height: 600, alignment: .center)
            }
            if jokedataController.jokeInfo?.type == "twopart" {
                Text(jokedataController.jokeInfo?.setup ?? "Test")
                  //  .font(.system(size: 40))
                    .font(.custom("Baskerville-Bold", size: 40, relativeTo: .headline))
                    .frame(width: 300, height: 300, alignment: .center)
                Spacer(minLength: 20)
                Text(jokedataController.jokeInfo?.delivery ?? "Test")
                    .font(.custom("Baskerville-Bold", size: 40, relativeTo: .headline))
                    .frame(width: 300, height: 300, alignment: .center)
                    .foregroundColor(Color.white)
                Spacer(minLength: 20)
            }
      
            

            Button(action: {
                jokedataController.fetch()
            }) {
                Text("Another Joke!")
                    .font(.custom("Baskerville-Bold", size: 40, relativeTo: .headline))
                    .foregroundColor(Color.orange)
            }
            
        }
        }
        .onAppear {
            jokedataController.fetch()
        }
     
    }
       
      
}






struct JokeView_Previews: PreviewProvider {
    static var previews: some View {
        JokeView()
    }
}
