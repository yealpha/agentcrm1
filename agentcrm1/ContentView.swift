//
//  ContentView.swift
//  agentcrm1
//
//  Created by Max Qiu on 6/19/23.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @Environment(\.managedObjectContext) private var viewContext

    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Customer.name, ascending: true)],
        animation: .default)
    private var customers: FetchedResults<Customer>
    @State private var showingDeleteAlert = false
    @State private var indexSetToDelete: IndexSet?
    @State private var showingAddCustomer = false

    // 网格布局
    var gridLayout: [GridItem] = Array(repeating: .init(.flexible()), count: 2)

    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: gridLayout, spacing: 20) {
                    ForEach(customers) { customer in
                        NavigationLink(destination: CustomerDetailView(customer: customer)) {
                            VStack {
                                Text(customer.name ?? "")
                                    .font(.headline)
                                    .padding()
                                    .background(Color.white)
                                    .cornerRadius(10)
                                    .shadow(radius: 10)  // 添加阴影
                            }
                        }
                    }
                }
                .padding(.horizontal)
            }
#if os(iOS)
.navigationBarTitle("客户管理", displayMode: .large)
#else
//.navigationBarTitle("客户管理")
#endif
            .toolbar {
#if os(iOS)
                ToolbarItem(placement: .navigationBarTrailing) {
                    EditButton()
                }
#endif
                ToolbarItem {
                    Button(action: {
                        showingAddCustomer = true
                    }) {
                        Label("增加客户", systemImage: "plus")
                    }
                }
            }
        }
        .sheet(isPresented: $showingAddCustomer) {
            AddCustomerView { showingAddCustomer = false }
                .environment(\.managedObjectContext, viewContext)
        }
        .alert(isPresented: $showingDeleteAlert) {
            Alert(title: Text("删除客户"),
                  message: Text("你确定要删除这个客户吗？"),
                  primaryButton: .destructive(Text("删除")) {
                      deleteItems(offsets: indexSetToDelete!)
                  },
                  secondaryButton: .cancel())
        }
    }

    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            offsets.map { customers[$0] }.forEach(viewContext.delete)

            do {
                try viewContext.save()
            } catch {
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }
    private func deleteWithConfirmation(offsets: IndexSet) {
        showingDeleteAlert = true
        indexSetToDelete = offsets
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}


