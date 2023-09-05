//
//  ProfileContentLabel.swift
//  NikeShoes
//
//  Created by 김성준 on 2023/09/05.
//

import SwiftUI

enum ProfileContentViewType {
    case inBoxView
    case memberReward
}

struct ProfileContentLabel: View {
    var title: String
    var subTitle: String
    var profileContentViewType: ProfileContentViewType
    
    var body: some View {
        NavigationStack{
            NavigationLink {
                switch profileContentViewType {
                case .inBoxView:
                    InboxView()
                case .memberReward:
                    MemberRewardView()
                }
            } label: {
                VStack(alignment: .leading){
                    Text(title)
                        .bold()
                        .font(.system(size: 16))
                        .foregroundColor(.primary)
                    Text(subTitle)
                        .font(.system(size: 12))
                        .foregroundColor(.gray)
                }
            }
        }
        .padding(.vertical, 20)
    }
}

struct ProfileContentLabel_Previews: PreviewProvider {
    static var previews: some View {
        ProfileContentLabel(title: "멤버 리워드", subTitle: "1개 사용 가능", profileContentViewType: .inBoxView)
    }
}
