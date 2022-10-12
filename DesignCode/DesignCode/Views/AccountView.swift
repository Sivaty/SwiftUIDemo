//
//  AccountView.swift
//  DesignCode
//
//  Created by Link on 2022/7/24.
//

import SwiftUI

struct AccountView: View {
    @State var isDeleted = false
    @State var isPinned = false
    @State var address: Address = Address(id: 1, country: "Canada")
    @Environment(\.presentationMode) var presentationMode
    @Environment(\.dismiss) var dismiss
    @AppStorage("isLogged") var isLogged = false
    @ObservedObject var userModel = UserModel()
    
    func fetchAddress() async {
        do {
            let url = URL(string: "https://random-data-api.com/api/v2/addresses")!
            let (data, _) = try await URLSession.shared.data(from: url)
            address = try JSONDecoder().decode(Address.self, from: data)
        } catch  {
            address = Address(id: 1, country: "Error fetch")
        }
        
    }
    
    var body: some View {
        NavigationView {
            List {
                profile
                
                menu
                
                links
                
                users
                
                Button {
                    isLogged = false
                    dismiss()
                } label: {
                    Text("Sign out")
                }
                .tint(.red)
            }
            .task {
                await fetchAddress()
                await userModel.fetchUsers()
            }
            .refreshable {
                await fetchAddress()
                await userModel.fetchUsers()
            }
            .listStyle(.insetGrouped)
            .navigationTitle("Account")
            .navigationBarItems(trailing: Button {
                presentationMode.wrappedValue.dismiss()
            } label: {
                Text("Done").bold()
            })
        }
    }
    
    var profile: some View {
        VStack(spacing: 8) {
            Image(systemName: "person.crop.circle.fill.badge.checkmark")
                .symbolVariant(.circle.fill)
                .font(.system(size: 32))
                .symbolRenderingMode(.palette)
                .foregroundStyle(.blue, .blue.opacity(0.3))
                .padding()
                .background(Circle().fill(.ultraThinMaterial))
                .background(
                    HexagonView()
                        .offset(x: -50, y: -100)
                )
                .background {
                    BlobView()
                        .offset(x: 200, y: 0)
                        .scaleEffect(0.6)
                }
            Text("Link Seng")
                .font(.title.weight(.semibold))
            HStack {
                Image(systemName: "location")
                    .imageScale(.small)
                    .foregroundColor(.secondary)
                Text(address.country)
                    .foregroundColor(.secondary)
            }
        }
        .frame(maxWidth: .infinity)
        .padding()
        
    }
    
    var menu: some View {
        Section {
            NavigationLink(destination: HomeView()) {
                Label("Settings", systemImage: "gear")
            }
            NavigationLink {
                HomeView()
            } label: {
                Label("Billing", systemImage: "creditcard")
            }

            Label("Help", systemImage: "questionmark")
                .imageScale(.small)
        }
        .accentColor(.primary)
//                    .listRowSeparatorTint(.blue)
//                    .listRowSeparator(.hidden)
    }
    
    var links: some View {
        Section {
            if !isDeleted {
                Link(destination: URL(string: "https://baidu.com")!) {
                    HStack {
                        Label("Baidu", systemImage: "house")
                        Spacer()
                        Image(systemName: "link")
                            .foregroundColor(.secondary)
                    }
                }
                .swipeActions(edge: .trailing, allowsFullSwipe: true) {
                    Button {
                        isDeleted = true
                    } label: {
                        Label("Delete", systemImage: "trash")
                    }
                    .tint(.red)
                    
                    Button {
                        isPinned.toggle()
                    } label: {
                        if isPinned {
                            Label("Unpin", systemImage: "pin.slash")
                        } else {
                            Label("Pin", systemImage: "pin")
                        }
                    }
                    .tint(isPinned ? .gray : .yellow)
                }
            }
            
            Link(destination: URL(string: "https://qq.com")!) {
                HStack {
                    Label("QQ", systemImage: "tv")
                    Spacer()
                    Image(systemName: "link")
                        .foregroundColor(.secondary)
                }
            }
        }
        .accentColor(.primary)
    }
    
    var users: some View {
        Section("Users") {
            ForEach(userModel.users) { user in
                HStack {
                    AsyncImage(url: URL(string: user.avatar)) { image in
                        image.resizable()
                            .aspectRatio(contentMode: .fit)
                    } placeholder: {
                        ProgressView()
                    }
                    .frame(width: 32, height: 32)
                    VStack(alignment: .leading, spacing: 4) {
                        Text(user.username)
                        Text(user.email)
                            .font(.caption)
                            .foregroundColor(.secondary)
                    }
                }
            }
        }

    }
}

struct AccountView_Previews: PreviewProvider {
    static var previews: some View {
        AccountView()
            .previewInterfaceOrientation(.portrait)
    }
}
