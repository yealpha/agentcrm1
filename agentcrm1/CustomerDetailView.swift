//
//  CustomerDetailView.swift
//  agentcrm1
//
//  Created by Max Qiu on 6/19/23.
//

import SwiftUI
import CoreData

struct CustomerDetailView: View {
    @Environment(\.managedObjectContext) private var viewContext // <-- 这里
    @ObservedObject var customer: Customer

    @State private var editedBirthday: Date
    @State private var editedCustomerID: Int32
    @State private var editedEmail: String
    @State private var editedEmergencyContact: String
    @State private var editedFirstContactTime: Date
    @State private var editedGender: String
    @State private var editedLifecycleStage: String
    @State private var editedName: String
    @State private var editedPhone: String
    @State private var editedPreferences: String
    @State private var editedSource: String
    @State private var editedStatus: String
    @State private var editedWechat: String
    @State private var editedHobby: String
    @State private var editedNotes: String

    init(customer: Customer) {
        self.customer = customer
        
    _editedBirthday = State(initialValue: customer.birthday ?? Date())
    _editedCustomerID = State(initialValue: customer.customerID)
    _editedEmail = State(initialValue: customer.email ?? "")
    _editedEmergencyContact = State(initialValue: customer.emergencyContact ?? "")
    _editedFirstContactTime = State(initialValue: customer.firstContactTime ?? Date())
    _editedGender = State(initialValue: customer.gender ?? "")
    _editedLifecycleStage = State(initialValue: customer.lifecycleStage ?? "")
    _editedName = State(initialValue: customer.name ?? "")
    _editedPhone = State(initialValue: customer.phone ?? "")
    _editedPreferences = State(initialValue: customer.preferences ?? "")
    _editedSource = State(initialValue: customer.source ?? "")
    _editedStatus = State(initialValue: customer.status ?? "")
    _editedWechat = State(initialValue: customer.wechat ?? "")
    _editedHobby = State(initialValue: customer.hobby ?? "")
    _editedNotes = State(initialValue: customer.notes ?? "")
        
   
        
      }

    // 其他代码...
    var body: some View {
        Form {
            Section {
                
                CustomTextField(title: "姓名", text: $editedName)
                CustomTextField(title: "性别", text: $editedGender)
                CustomTextField(title: "电子邮件", text: $editedEmail)
                CustomTextField(title: "电话", text: $editedPhone)
                DatePicker("初次接触时间", selection: $editedFirstContactTime, displayedComponents: .date)
                    .font(.headline)  // 使用大号字体
                    .padding()  // 添加内边距
                    .background(Color.yellow.opacity(0.2))  // 添加背景色
                    .cornerRadius(10)  // 添加圆角
                //CustomTextField(title: "客户ID", text: $editedCustomerID)
                CustomTextField(title: "偏好", text: $editedPreferences)
                CustomTextField(title: "来源", text: $editedSource)//小红书、广告、转介绍
                CustomTextField(title: "状态", text: $editedStatus)
                CustomTextField(title: "WeChat", text: $editedWechat)
                CustomTextField(title: "爱好", text: $editedHobby)
                DatePicker("生日", selection: $editedBirthday, displayedComponents: .date)
                    .font(.headline)  // 使用大号字体
                    .padding()  // 添加内边距
                    .background(Color.yellow.opacity(0.2))  // 添加背景色
                    .cornerRadius(10)  // 添加圆角
                CustomTextField(title: "客户所处周期阶段", text: $editedLifecycleStage)
                //lifecycleStage:线索用户、潜在客户、机会客户、成交客户。
                //CustomTextField(title: "紧急联络人", text: $editEmergencyContact)
                TextEditor(text: $editedNotes)
                    .font(.headline)
                    .padding()
                    .frame(height: 100) //设置高度为100
                    .background(Color.yellow.opacity(0.2))
                    .cornerRadius(10)

            }
            Section {
                Button(action: saveCustomer) {
                    Text("保存")
                        .font(.headline)
                        .foregroundColor(.white)  // 设置前景色为白色
                        .padding()
                        .background(Color.blue)  // 设置背景色为蓝色
                        .cornerRadius(10)  // 添加圆角
                }
            }
        }
    }

    private func saveCustomer() {
        //保存属性
        
        customer.birthday = editedBirthday
        customer.customerID = editedCustomerID
        customer.email = editedEmail
        customer.emergencyContact = editedEmergencyContact
        customer.firstContactTime = editedFirstContactTime
        customer.gender = editedGender
        customer.lifecycleStage = editedLifecycleStage
        customer.name = editedName
        customer.phone = editedPhone
        customer.preferences = editedPreferences
        customer.source = editedSource
        customer.status = editedStatus
        customer.wechat = editedWechat
        customer.hobby = editedHobby
        customer.notes = editedNotes
        
        do {
            try viewContext.save()
        } catch {
            let nsError = error as NSError
            fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
        }
    }
}

