//
//  ContentView.swift
//  LoginSignupProject
//
//  Created by Amol Pawar on 18/07/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            Color.blue.ignoresSafeArea()

            VStack(alignment: .leading, spacing: 10) {

                Spacer()

                Text("Water Delivery")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .multilineTextAlignment(.leading)

                Text("We deliver water at any point of the earth in 30 minutes")
                    .font(.headline)
                    .fontWeight(.bold)
                    .foregroundColor(.white.opacity(0.6))
                    .multilineTextAlignment(.leading)

                VStack(spacing: 20) {
                }.frame(width: 40, height: 40)

                VStack(spacing: 20) {
                    Button {

                    } label: {
                        Text("Log IN")
                            .foregroundColor(.blue)
                            .font(.title3)
                            .fontWeight(.bold)
                            .frame(maxWidth: .infinity, maxHeight: 50)
                            .border(Color(.displayP3, white: 1, opacity: 0.5), width: 4)
                            .background(Color.white)
                            .cornerRadius(10)
                    }

                    Button {

                    } label: {
                        Text("Sign up")
                            .foregroundColor(.white)
                            .font(.title3)
                            .fontWeight(.bold)
                            .frame(maxWidth: .infinity, maxHeight: 50)
                            .border(Color(.displayP3, white: 1, opacity: 0.5), width: 4)
                            .cornerRadius(10)
                    }
                }

            }.padding(20)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
