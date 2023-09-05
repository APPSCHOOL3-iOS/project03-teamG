//
//  EmailView.swift
//  NikeShoes
//
//  Created by 이희찬 on 2023/09/05.
//

import SwiftUI

struct EmailView: View {
    @Environment(\.presentationMode) var presentationMode
    
    var title: String
    
    @State private var newEmail: String = ""
    @State private var confirmEmail: String = ""
    
    var body: some View {
        VStack{
            
            Divider()
            
            Text("Your current account email address is:")
                .font(.subheadline)
                .foregroundColor(.gray)
                .padding(.top)
            
            Text("lhchan4010\("@")gmail.com")
                .padding(1)
            
            VStack {
                TextField("New Email", text: $newEmail)
                    .padding(15)
                    .background(Color.white)
                    .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.black, lineWidth: 0.5))
                    .padding(.top)
                TextField("ConfirmEmail", text: $confirmEmail)
                    .padding(15)
                    .background(Color.white)
                    .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.black, lineWidth: 0.5))
                    .padding(.top, 7)
            }
            .padding()
            
            CustomButton(
                background: Color.gray,
                foregroundColor: Color.black.opacity(0.5),
                title: "Done"
            ) {
                // mark: email update logic ----------------
                self.presentationMode.wrappedValue.dismiss()
            }
            
            Spacer()
            
        }
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button(action: {
                    self.presentationMode.wrappedValue.dismiss()
                }) {
                    Image(systemName: "chevron.left")
                }
                .foregroundColor(.black)
            }
        }
        .navigationBarTitle(title, displayMode: .inline)
        .navigationBarBackButtonHidden()
    }
}

struct EmailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack{
            EmailView(title: "Email")
        }
    }
}
