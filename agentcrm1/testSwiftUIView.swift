//
//  testSwiftUIView.swift
//  agentcrm1
//
//  Created by Max Qiu on 6/19/23.
//

import SwiftUI

struct SignUpForm2: View {
    @State var username = ""
    @State var email = ""

    var body: some View {
        NavigationView{
            Form {
                Text("中级水平做的用户注册界面").font(.headline)

                TextField("Username", text: $username)
                    .prefixedWithIcon(named: "person.circle.fill")
                TextField("Email", text: $email)
                    .prefixedWithIcon(named: "envelope.circle.fill")

                Button(
                    action: { print("here") },
                    label: { Text("提交") }
                )
            }.navigationBarTitle(Text("用户注册界面"))
        }
    }
}
