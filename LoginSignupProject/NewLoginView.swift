//
//  NewLoginView.swift
//  LoginSignupProject
//
//  Created by Amol Pawar on 19/07/22.
//

import SwiftUI

struct NewLoginView: View {

    @State var username = ""
    @State var password = ""
    @State var rem = false
    @State var height: CGFloat = 0
    @State var isLogin = false

    var body: some View {

        ScrollView(UIScreen.main.bounds.height < 750 ? .vertical : (self.height == 0 ? .init() : .vertical), showsIndicators: false) {
            ZStack {
                //Color.black.opacity(0.03).ignoresSafeArea()

                VStack {
                    HStack(alignment: .top, spacing: 0) {
                        Image("logo")
                            .offset(x: 20, y: 20)
                        Image("logo1")

                    }

                    VStack(alignment: .leading) {
                        Text("Login")
                            .font(.title)
                            .bold()
                        Text("Username")
                            .fontWeight(.bold)
                            .padding(.top, 20)

                        VStack {
                            TextField("", text: $username)
                            Rectangle()
                                .fill(self.username == "" ? Color.black.opacity(0.08) : Color("Color1"))
                                .frame(height: 3)
                        }

                        Text("Password")
                            .fontWeight(.bold)
                            .padding(.top, 20)

                        VStack {
                            TextField("", text: $password)
                            Rectangle()
                                .fill(self.password == "" ? Color.black.opacity(0.08) : Color("Color1"))
                                .frame(height: 3)
                        }

                        HStack {
                            Spacer()
                            Button {

                            } label: {
                                Text("Forget Password")
                                    .fontWeight(.bold)
                                    .foregroundColor(Color("Color1"))
                            }
                        }
                        .padding(.top)
                        .padding(.bottom, 10)
                    }
                    .foregroundColor(Color.black.opacity(0.7))
                    .padding()
                    .background(.white)
                    .overlay(Rectangle()
                                .stroke(Color.black.opacity(0.3), lineWidth: 1)
                                .shadow(radius: 4))
                    .padding(.horizontal)
                    .padding(.top, -80)

                    HStack {
                        Button {
                            self.rem.toggle()
                        } label: {
                            HStack(spacing: 10) {
                                ZStack {
                                    Circle()
                                        .stroke(LinearGradient(gradient: .init(colors: [Color("Color"),Color("Color1")]), startPoint: .top, endPoint: .bottom), lineWidth: 2)
                                        .frame(width: 20, height: 20)
                                    if self.rem {
                                        Circle()
                                            .fill(Color("Color1"))
                                            .frame(width: 10, height: 10)
                                    }
                                }

                                Text("Remember me")
                                    .fontWeight(.bold)
                                    .foregroundColor(Color.black.opacity(0.7))
                            }
                        }

                        Spacer()

                        Button {
                            isLogin = true
                        } label: {
                            Text("Sign in")
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                                .padding(.vertical)
                                .padding(.horizontal, 35)
                                .background(LinearGradient(gradient: .init(colors: [Color("Color"),Color("Color1")]), startPoint: .leading, endPoint: .trailing))
                                .cornerRadius(5)
                        }
                    }
                    .padding(.top)
                    .padding(.horizontal)
                    .fullScreenCover(isPresented: $isLogin, content: {
                        LoginView()
                    })

                    HStack {
                        Rectangle()
                            .fill(Color.black.opacity(0.05))
                            .frame(width: 100, height: 5)

                        Text("Social Login")
                            .foregroundColor(Color.black.opacity(0.7))
                            .fontWeight(.bold)

                        Rectangle()
                            .fill(Color.black.opacity(0.05))
                            .frame(width: 100, height: 5)
                    }
                    .padding(.top)

                    HStack(spacing: 20){

                        Button(action: {

                        }) {

                            Image("google")
                                .resizable()
                                .foregroundColor(.white)
                                .frame(width: 35, height: 35)
                                .padding(8)
                                .background(Color.red)
                                .clipShape(Circle())

                        }

                        Button(action: {

                        }) {

                            Image("twitter")
                                .resizable()
                                .foregroundColor(.white)
                                .frame(width: 35, height: 35)
                                .padding(8)
                                .background(Color("Color1"))
                                .clipShape(Circle())

                        }

                        Button(action: {

                        }) {

                            Image("fb")
                                .renderingMode(.original)
                            // sice were not adding padding so size is 48...
                                .resizable()
                                .frame(width: 48, height: 48)

                        }
                    }
                    .padding(.top)

                    HStack{

                        Text("New User?")
                            .foregroundColor(Color.black.opacity(0.7))
                            .fontWeight(.bold)

                        Button(action: {

                        }) {

                            Text("SignUp")
                                .foregroundColor(Color("Color1"))
                                .fontWeight(.bold)
                        }
                    }
                    .padding(.top,20)
                    .padding(.bottom)

                    Spacer()
                }
                .padding(.top, (UIApplication.shared.connectedScenes.first as? UIWindowScene)?.windows.first?.safeAreaInsets.top ?? 0)
                .padding(.bottom, (UIApplication.shared.connectedScenes.first as? UIWindowScene)?.windows.first?.safeAreaInsets.bottom ?? 0)
            }
        }
        .padding(.bottom, self.height)
        .background(Color.black.opacity(0.03).ignoresSafeArea())
        .edgesIgnoringSafeArea(.all)
        .onAppear {

            NotificationCenter.default.addObserver(forName: UIResponder.keyboardDidShowNotification, object: nil, queue: .main) { (not) in
                let data = not.userInfo![UIResponder.keyboardFrameEndUserInfoKey] as! NSValue
                let height = data.cgRectValue.height - ((UIApplication.shared.connectedScenes.first as? UIWindowScene)?.windows.first?.safeAreaInsets.bottom ?? 0.0)
                    self.height = height
                // removing outside safeaera height...
                print(height)
            }

            NotificationCenter.default.addObserver(forName: UIResponder.keyboardDidHideNotification, object: nil, queue: .main) { (_) in
                print("hidden")
                withAnimation {
                    self.height = 0
                }
            }
        }
    }
}

struct NewLoginView_Previews: PreviewProvider {
    static var previews: some View {
        NewLoginView()
    }
}
