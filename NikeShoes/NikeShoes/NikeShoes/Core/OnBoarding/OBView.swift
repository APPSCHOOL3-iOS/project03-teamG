//
//  OnBoarding.swift
//  NikeShoes
//
//  Created by 박형환 on 2023/09/05.
//

import SwiftUI



struct OBView: View {
    
    @State var screen: [OnBoardingScreen] = OnBoardingScreen.allCases
    
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        NavigationStack{
            VStack{
                OBContainerView(isButtonClicked: false, index: 0, questions: $screen)
                    .navigationBarBackButtonHidden(true)
            }//VStack
        }
    }
}

struct OBContainerView: View {
    
    @State var isButtonClicked: Bool = false
    @State var index: Int = 0
    
    let duration: Double = 0.5
    @Binding var screens: [OnBoardingScreen]
    
    var colummID: [String]
    
    init(isButtonClicked: Bool, index: Int, questions: Binding<[OnBoardingScreen]>) {
        self.isButtonClicked = isButtonClicked
        self.index = index
        self._screens = questions
        self.colummID = []
        
        for value in questions.wrappedValue {
            print(value.id)
            colummID.append("\(value.id)")
        }
    }
    
    var imageURL: String = "https://static.nike.com/a/images/f_auto/f9b5ee1b-ea2d-4389-b296-1303680aafdd/image.png"
    
    enum ScrollPosition: Hashable {
        case screen(id: String)
    }
    
    var body: some View {
        
        VStack {
            ZStack {
                
                if index != 1 && index != 0 {
                    AsyncImage(url: URL(string: imageURL)) { image in
                        image.resizable()
                    } placeholder: {
                        ProgressView()
                    }.ignoresSafeArea()
                    
                    Blur(style: .systemUltraThinMaterialDark)
                        .ignoresSafeArea()
                }else{
                    Color.black
                        .ignoresSafeArea()
                }
                
                VStack {
                    HStack {
                        if index != 1 && index != 0 {
                            ProgressView(value: Double(index),
                                         total: Double(7))
                            .background(.gray)
                            .tint(.white)
                            .cornerRadius(12)
                            .padding(.top,10)
                            .padding(.horizontal,80)
                        }
                    }
                    
                    switch index {
                    case 0:
                        OBLocationDescriptionView()
                            .transition(AnyTransition.opacity.animation(.easeInOut(duration: duration)))
                    case 1:
                        OBLanguageSelectionView()
                            .transition(AnyTransition.opacity.animation(.easeInOut(duration: duration)))
                    case 2:
                        OBStartView()
                            .transition(AnyTransition.opacity.animation(.easeInOut(duration: duration)))
                    case 3:
                        OBInterestSelectView()
                            .transition(AnyTransition.opacity.animation(.easeInOut(duration: duration)))
                    case 4:
                        OBShoesSizeSelectView()
                            .transition(AnyTransition.opacity.animation(.easeInOut(duration: duration)))
                    case 5:
                        OBAlarmView()
                            .transition(AnyTransition.opacity.animation(.easeInOut(duration: duration)))
                    case 6:
                        OBLocationView()
                            .transition(AnyTransition.opacity.animation(.easeInOut(duration: duration)))
                    default:
                        EmptyView()
                    }
                    
                    TempButton {
                       
                        if index == 6 {
                            index = 0
                        }else {
                            index += 1
                        }
                    }.padding(.bottom, 20)
                }
            }
        }
    }
}

struct OBView_Previews: PreviewProvider {
    static var previews: some View {
        OBView()
    }
}
