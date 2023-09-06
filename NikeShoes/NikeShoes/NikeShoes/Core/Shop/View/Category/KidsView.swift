//
//  KidsView.swift
//  NikeShoes
//
//  Created by 최소정 on 2023/09/06.
//

import SwiftUI

struct KidsView: View {
    var body: some View {
         LazyVStack {
             ForEach(0 ... 3, id: \.self) { _ in
                 VStack {
                     ZStack {
                         Rectangle()
                             .frame(width: .infinity, height: 120)
                         Text("키즈 카테고리")
                             .foregroundColor(Color.white)
                     }
                 }
             }
             
         }
     }
 }

struct KidsView_Previews: PreviewProvider {
    static var previews: some View {
        KidsView()
    }
}
