//
//  ShopLocationView.swift
//  NikeShoes
//
//  Created by 안지영 on 2023/09/05.
//

import SwiftUI

struct StoreView: View {
    
    @ObservedObject var storeModel = StoreModel()
    
    var body: some View {
        NavigationStack {
            List {
                
                Text("추천 매장")
                    .font(.system(size: 20))
                    .listRowSeparator(.hidden)
                
                ForEach(storeModel.stores) { store in
                    NavigationLink {
                        StoreDetailView(store: store)
                    } label: {
                        StoreItemView(store: store)
                    }

                }
                .listRowSeparator(.hidden)
            }
            .listStyle(.plain)
            .navigationTitle("나이키 매장 찾기")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct StoreView_Previews: PreviewProvider {
    static var previews: some View {
        StoreView()
    }
}
