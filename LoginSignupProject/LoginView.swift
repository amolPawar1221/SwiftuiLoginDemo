//
//  LoginView.swift
//  LoginSignupProject
//
//  Created by Amol Pawar on 18/07/22.
//

import SwiftUI

struct LoginView: View {
    @State var userId: String = ""
    @State var show = false

    var drowOR: some View {
        return HStack(spacing: 8) {
            Rectangle()
                .frame(height: 1)
                .background(Color.gray)
            Text("or")
                .foregroundColor(.gray)
                .font(.title2)
            Rectangle()
                .frame(height: 1)
                .background(Color.gray)
        }
    }

    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(spacing: 0) {
                VStack {
                    Arc(yOffset: 0.2)
                        .fill(Color.blue)
                        .frame(height: UIScreen.main.bounds.height * 0.55)
                        .overlay(
                            HStack {
                                Text("Welcome \n Back")
                                    .foregroundColor(.white)
                                    .font(.title)
                                    .fontWeight(.bold)
                                    .multilineTextAlignment(.leading)
                                    .padding(.horizontal, 20)
                                Spacer()
                            }).ignoresSafeArea(.all, edges: .top)
                        .offset(y: -30)
                }


                VStack {
                    HStack {
                        Image(systemName: "heart.fill")
                            .foregroundColor(.blue)
                            .font(.headline)

                        TextField("Enter User ID", text: $userId)
                            .frame(maxWidth: .infinity)
                            .frame(height: 50)
                            .offset(x: 10, y: 0)

                        Image(systemName: "checkmark")
                            .foregroundColor(.blue)
                            .font(.headline)
                    }.overlay(VStack{Divider().background(Color.blue).offset(x: 0, y: 25)})

                    HStack {
                        Image(systemName: "lock")
                            .foregroundColor(.blue)
                            .font(.headline)

                        TextField("Enter Password", text: $userId)
                            .frame(maxWidth: .infinity)
                            .frame(height: 50)
                            .offset(x: 10, y: 0)

                        Image(systemName: "eye")
                            .foregroundColor(.blue)
                            .font(.headline)
                    }.overlay(VStack{Divider().background(Color.blue).offset(x: 0, y: 25)})

                    HStack {
                        Spacer()
                        Button {
                            print("Forgot password clicked")
                        } label: {
                            Text("Forgot passwored?")
                                .font(.headline)
                                .fontWeight(.bold)
                        }
                    }.padding(.top, 10)

                    VStack {
                        Button {
                            show.toggle()
                        } label: {
                            Text("Log in".uppercased())
                                .font(.title3)
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                                .frame(height: 50)
                                .frame(maxWidth: .infinity)
                                .background(Color.blue)
                                .cornerRadius(10)
                                .shadow(radius: 10)
                        }
                        .fullScreenCover(isPresented: $show) {
                            ComplexUI()
                        }

                        drowOR

                        Button {

                        } label: {
                            Text("Sign up".uppercased())
                                .font(.title3)
                                .fontWeight(.bold)
                                .foregroundColor(.gray)
                                .frame(maxWidth: .infinity)
                                .frame(height: 50)
                                .background(Color.white)
                                .cornerRadius(10)
                                .border(.gray, width: 2)
                                .shadow(radius: 5)
                        }

                    }.padding(.top, 10)
                }
                .padding(20)
                .background(Color.white)
            }
        }.ignoresSafeArea(.all, edges: .top)
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}

struct Arc: Shape {

    var yOffset: CGFloat = 0.25


    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: .zero)
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))

        let controlpoint1 = CGPoint(x: rect.maxX * 0.25, y: rect.maxY - (rect.maxY * yOffset))
        print("controlpoint1", controlpoint1)
        print(rect.minX)
        print(rect.minY)
        let controlpoint2 = CGPoint(x: rect.maxX * 0.75, y: rect.maxY + (rect.maxY * yOffset))
        print("controlpoint2",controlpoint2)
        path.addCurve(to: CGPoint(x: rect.minX, y: rect.maxY), control1: controlpoint2, control2: controlpoint1)
        path.closeSubpath()
        return path
    }
}
