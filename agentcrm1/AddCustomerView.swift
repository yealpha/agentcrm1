//
//  AddCustomerView.swift
//  agentcrm1
//
//  Created by Max Qiu on 6/19/23.
//

import SwiftUI

struct AddCustomerView: View {
    @Environment(\.managedObjectContext) private var viewContext

    @State private var birthday = Date()
    @State private var customerID: Int32? = nil
    @State private var email = ""
    @State private var emergencyContact = ""
    @State private var firstContactTime = Date()
    @State private var gender = ""
    @State private var lifecycleStage = ""
    @State private var name = ""
    @State private var phone = ""
    @State private var preferences = ""
    @State private var source = ""
    @State private var status = ""
    @State private var wechat = ""
    @State private var hobby = ""
    @State private var notes = ""
    

    var onDismiss: (() -> Void)? = nil

    var body: some View {
        NavigationView {
            Form {
                Section {
                    
                    CustomTextField(title: "姓名", text: $name)
                    CustomTextField(title: "性别", text: $gender)
                    CustomTextField(title: "电子邮件", text: $email)
                    CustomTextField(title: "电话", text: $phone)
                    DatePicker("初次接触时间", selection: $firstContactTime, displayedComponents: .date)
                    //CustomTextField(title: "客户ID", text: $customerID)
                    CustomTextField(title: "偏好", text: $preferences)
                    CustomTextField(title: "来源", text: $source)//小红书、广告、转介绍
                    CustomTextField(title: "状态", text: $status)
                    CustomTextField(title: "WeChat", text: $wechat)
                    CustomTextField(title: "爱好", text: $hobby)
                    DatePicker("生日", selection: $birthday, displayedComponents: .date)
                    CustomTextField(title: "客户所处周期阶段", text: $lifecycleStage)
                    //lifecycleStage:线索用户、潜在客户、机会客户、成交客户。
                    //CustomTextField(title: "紧急联络人", text: $emergencyContact)
                    CustomTextField(title: "备注", text: $notes)
                }

                Section {
                    Button(action: addCustomer) {
                        Text("增加客户")
                                .font(.headline)
                                .foregroundColor(.white)  // 设置前景色为白色
                                .padding()
                                .background(Color.blue)  // 设置背景色为蓝色
                                .cornerRadius(10)  // 添加圆角
                    }
                }
            }
            .navigationTitle("增加新客户")
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("取消") {
                        onDismiss?()
                    }
                }
            }
        }
    }

    private func addCustomer() {
        let newCustomer = Customer(context: viewContext)
        
        newCustomer.birthday = birthday
        newCustomer.customerID = customerID ??  0
        newCustomer.email = email
        newCustomer.emergencyContact = emergencyContact
        newCustomer.firstContactTime = firstContactTime
        newCustomer.gender = gender
        newCustomer.lifecycleStage = lifecycleStage
        newCustomer.name = name
        newCustomer.phone = phone
        newCustomer.preferences = preferences
        newCustomer.source = source
        newCustomer.status = status
        newCustomer.wechat = wechat
        newCustomer.hobby = hobby
        newCustomer.notes = notes
        


        do {
            try viewContext.save()
            onDismiss?()
        } catch {
            let nsError = error as NSError
            print("Unresolved error \(nsError), \(nsError.userInfo)")
        }
    }
}
struct CustomTextField: View {
    var title: String
    @Binding var text: String

    var body: some View {
        TextField(title, text: $text)
            .font(.headline)
            .padding()
            .background(Color.yellow.opacity(0.2))
            .cornerRadius(10)
    }
}
