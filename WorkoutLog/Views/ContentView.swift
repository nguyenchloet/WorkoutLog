//
//  ContentView.swift
//  WorkoutLog
//
//  Created by Chloe on 3/31/23.
//

import SwiftUI

struct ContentView: View {
    //@State var selectedPage: Pages = .todaysWorkout
    @State private var username = ""
    
    var body: some View {
        NavigationView {
            ZStack {
                Color(red: 1, green: 1, blue: 1)
                    .ignoresSafeArea()
                Group {
                    VStack {
                        Text("Workout Log")
                            .font(.title)
                            .fontWeight(.semibold)
                        Spacer()
                        if app.currentUser == nil {
                            LoginView(username: $username)
                        } else {
                            //Text("Welcome!")
                            NavBar(username: username)
                        }
                        Spacer()
                    }
                    
                }
                .navigationBarTitle(username, displayMode: .inline)
                .navigationBarItems(trailing: app.currentUser != nil ? Button(action: logout) { Text("Log Out")} : nil )
            }
        }
    }
    private func logout() {
        app.currentUser?.logOut() { _ in
            DispatchQueue.main.async {
                username = ""
            }
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
