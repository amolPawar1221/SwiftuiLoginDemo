//
//  ComplexUI.swift
//  LoginSignupProject
//
//  Created by Amol Pawar on 20/07/22.
//

import SwiftUI

struct ComplexUI: View {
    var body: some View {
        Home()
    }
}

struct ComplexUI_Previews: PreviewProvider {
    static var previews: some View {
        ComplexUI()
    }
}


struct Home: View {

    @State var color = 0
    @State var height: CGFloat = UIScreen.main.bounds.height
    @State var width: CGFloat = UIScreen.main.bounds.width

    @Environment(\.presentationMode) var isPresented


    var body: some View {
        VStack {
            ZStack(alignment: .top) {
                VStack {
                    Image(color == 0 ? "lamp1" : "lamp2")
                        .resizable()
                        .frame(height: 300)

                    HStack(spacing: 20) {
                        Button {
                            color = 0
                        } label: {
                            VStack(spacing: 8) {
                                ZStack {
                                    Circle()
                                        .fill(color == 1 ? Color.yellow : Color.clear)
                                        .frame(width: 20, height: 20)

                                    Circle()
                                        .stroke(color == 0 ? Color.white : Color.clear, lineWidth: 2)
                                        .frame(width: 30, height: 30)

                                }
                                Text("yellow")
                                    .foregroundColor(.white)
                                    .font(.caption)
                            }
                        }

                        Button {
                            color = 1
                        } label: {
                            VStack(spacing: 8) {
                                ZStack {
                                    Circle()
                                        .fill(Color.orange)
                                        .frame(width: 20, height: 20)

                                    Circle()
                                        .stroke(color == 1 ? Color.white : Color.clear, lineWidth: 2)
                                        .frame(width: 30, height: 30)

                                }
                                Text("orange")
                                    .foregroundColor(.white)
                                    .font(.caption)
                            }
                        }
                    }
                    .padding(.top, 15)
                    .padding(.bottom, 10)
                }
                HStack {
                    Button {
                        isPresented.wrappedValue.dismiss()
                    } label: {
                        Image("back")
                            .renderingMode(.original)
                            .padding()
                    }
                    .padding(.leading, 10)
                    .padding(.top, 20)


                    Spacer()

                    Button {

                    } label: {
                        Image("cart")
                            .renderingMode(.original)
                            .padding()
                    }
                    .padding(.horizontal, 10)
                    .padding(.vertical, height > 800 ? 15 : 10)
                    .background(.white)
                    .clipShape(CustomShape(corner: .bottomLeft, radii: height > 800 ? 35 : 30))
                }
            }
            .background(color == 0 ? Color.yellow : Color.orange)
            .clipShape(CustomShape(corner: .bottomLeft, radii: 55))

            ScrollView(height > 800 ? .init() : .vertical, showsIndicators: false) {
                VStack {
                    HStack {
                        Text("Melodi Lamp")
                            .font(.title)
                            .fontWeight(.bold)
                        Spacer()
                        Button {

                        } label: {
                            Image("heart")
                                .renderingMode(.original)
                                .padding()
                        }
                        .background(color == 0 ? Color.yellow : Color.orange)
                        .clipShape(Circle())
                    }
                    .padding(.horizontal, 35)
                    .padding(.top, 25)

                    Text("The lampshape provides directional lighting above the dining table and pleasent diffused light throught the room")
                        .multilineTextAlignment(.leading)
                        .foregroundColor(.gray)
                        .padding(.horizontal, 30)
                        .padding(.top, 20)

                    Spacer(minLength: 0)

                    HStack(spacing: 10) {

                        Button {

                        } label: {
                            VStack {
                                Image("mat1")
                                    .renderingMode(.original)

                                Text("22 CM")
                                    .fontWeight(.bold)
                                    .foregroundColor(.black)
                            }
                            .padding()
                        }.background(Color.black.opacity(0.06))
                            .cornerRadius(12)

                        Button {

                        } label: {
                            VStack {
                                Image("mat2")
                                    .renderingMode(.original)

                                Text("24 CM")
                                    .fontWeight(.bold)
                                    .foregroundColor(.black)
                            }
                            .padding()
                        }.background(Color.black.opacity(0.06))
                            .cornerRadius(12)

                        Button {

                        } label: {
                            VStack {
                                Image("mat3")
                                    .renderingMode(.original)

                                Text("26 CM")
                                    .fontWeight(.bold)
                                    .foregroundColor(.black)
                            }
                            .padding()
                        }
                        .background(Color.black.opacity(0.06))
                        .cornerRadius(12)

                        Button {

                        } label: {
                            VStack {
                                Image("mat4")
                                    .renderingMode(.original)

                                Text("1.6 M")
                                    .fontWeight(.bold)
                                    .foregroundColor(.black)
                            }
                            .padding()
                        }

                        .background(Color.black.opacity(0.06))
                        .cornerRadius(12)


                    }
                    .padding(.top, 20)
                    .padding(.bottom, 25)

                    Spacer(minLength: 0)
                }
            }

            HStack {
                Text("$12.99")
                    .foregroundColor(.black)
                    .font(.title)
                    .fontWeight(.bold)
                    .padding(.leading, 35)
                    .padding(.bottom, 25)

                Spacer()

                Button {

                } label: {
                    Text("Add to Cart")
                        .foregroundColor(.black)
                        .padding(.vertical, 20)
                        .padding(.horizontal, 35)
                }
                .background(color == 0 ? Color.yellow : Color.orange)
                .clipShape(CustomShape(corner: .topLeft, radii: 55))
            }
        }
        .ignoresSafeArea()
        .statusBar(hidden: true)
    }

}

struct CustomShape: Shape {

    var corner: UIRectCorner
    var radii: CGFloat

    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corner, cornerRadii: CGSize(width: radii, height: radii))
        return Path(path.cgPath)
    }
}
