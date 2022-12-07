//
//  HomeView.swift
//  CarRemote
//
//  Created by Hayk Hayrapetyan on 06.12.22.
//

import SwiftUI
import ActivityIndicatorView

struct HomeView: View {
//    @State var showLoadingIndicator = true
    private var spacing: CGFloat = 20
    
    var body: some View {
        NavigationView {
            VStack(spacing: 0) {
                GradientCarView()
                
                HStack() {
                    Spacer(minLength: spacing)
                    
                    HStack {
                        Spacer()
                        Button {
                            
                        } label: {
                            Image("lock")
                                .resizable()
                                .frame(width: 45, height: 45)
                        }
                        .frame(width: 64, height: 64)
                        .background(.black)
                        .clipShape(Circle())
                        Spacer()
                        Button {
                            
                        } label: {
                            Image("unlock")
                                .resizable()
                                .frame(width: 45, height: 45)
                        }
                        .disabled(true)
                        .frame(width: 64, height: 64)
                        .background(.black)
                        .clipShape(Circle())
                        Spacer()
                    }
                    .frame(maxWidth: .infinity, maxHeight: 96)
                    .background(Colors.buttonContainer)
                    .cornerRadius(4)
                    Spacer(minLength: spacing)
                    HStack {
//                        Button("1") {
//
//                        }
//                        .frame(width: 40, height: 40)
//                        .background(.red)
//                        .clipShape(Circle())
//
//                        Button("2") {
//
//                        }
//                        .frame(width: 40, height: 40)
//                        .background(.yellow)
                    }
                    .frame(maxWidth: .infinity, maxHeight: 96)
                    .background(Colors.buttonContainer)
                    .cornerRadius(4)
                    Spacer(minLength: spacing)
                }
                .padding(.top, 130)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
            .background(Colors.background, ignoresSafeAreaEdges: .bottom)
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    NavigationBarItemView()
                }
            }
            
//            ActivityIndicatorView(isVisible: $showLoadingIndicator, type: .growingArc(.green, lineWidth: 2))
            //                    .frame(width: 100, height: 100)
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .previewDevice(PreviewDevice(rawValue: "iPhone 14"))
            .previewDisplayName("iPhone 14 Pro")
    }
}
