//
//  GeometricEffectView.swift
//  LoginSignupProject
//
//  Created by Amol Pawar on 23/07/22.
//

import SwiftUI

struct GeometricEffectView: View {

    @State var isExpand: Bool = false
    @Namespace var profileAnimation
    @Namespace var imageNameSpace
    @Namespace var usernameNameSpace
    @Namespace var subTitleNameSpace

    var body: some View {
        VStack(alignment: .leading) {
            if isExpand {
                expandProfileView
            } else {
                profileView
            }

            ScrollView {
                LazyVStack {
                    ForEach(0..<10) { _ in
                        Rectangle()
                            .fill(Color.gray)
                            .frame(height: 200)
                            .cornerRadius(10)
                            .shadow(radius: 10)
                            .overlay(
                                Image(systemName: "play.fill")
                                    .font(.largeTitle)
                                    .foregroundColor(.white.opacity(0.6))
                                    .padding()
                                    .background(.white.opacity(0.2))
                                    .clipShape(Circle())
                            )
                            .padding()
                    }
                }
            }
        }
        .background(.black)
    }

    var profileImage: some View {
        Image(systemName: "heart.fill")
            .font(.largeTitle)
            .foregroundColor(.red)
            .padding()
            .background(.white)
            .clipShape(Circle())
            .onTapGesture {
                withAnimation(.spring()) {
                    isExpand.toggle()
                }
            }
    }

    var profileView: some View {
        HStack(spacing: 20) {
            profileImage
                .matchedGeometryEffect(id: imageNameSpace, in: profileAnimation)

            VStack() {
                Text("User Name")
                    .font(.title)
                    .bold()
                    .foregroundColor(.white)
                    .matchedGeometryEffect(id: usernameNameSpace, in: profileAnimation)

                Text("sr. iOS Developer")
                    .font(.subheadline)
                    .foregroundColor(.white)
                    .matchedGeometryEffect(id: subTitleNameSpace, in: profileAnimation)


            }
            Spacer()
        }
        .padding()
    }

    var expandProfileView: some View {
        VStack {
            profileImage
                .matchedGeometryEffect(id: imageNameSpace, in: profileAnimation)

            VStack {
                Text("User Name")
                    .font(.title)
                    .bold()
                    .foregroundColor(.white)
                    .matchedGeometryEffect(id: usernameNameSpace, in: profileAnimation)

                Text("sr. iOS Developer")
                    .font(.subheadline)
                    .foregroundColor(.white)
                    .matchedGeometryEffect(id: subTitleNameSpace, in: profileAnimation)

                Text("""
                     Rod Johnson , Juergen Hoeller , Keith Donald , Colin Sampaleanu , Rob Harrop , Thomas Risberg , Alef
                     Arendsen.
                    """)
                    .font(.body)
                    .foregroundColor(.white.opacity(0.7))
                    .padding()
                    .multilineTextAlignment(.center)
            }
            .padding()
        }
    }
}

struct GeometricEffectView_Previews: PreviewProvider {
    static var previews: some View {
        GeometricEffectView()
    }
}
