//
//  ContentView.swift
//  navigableApp1
//
//  Created by Ananya Tandel on 9/14/23.
//

import SwiftUI
import CoreData

struct ContentView: View {
    // State properties - alert and modal sheet presentation.
        @State private var showAlert = false
        @State private var showSheet = false

    // home view
        var body: some View {
            NavigationView {
                // initiate tab view
                TabView {
                    // First Tab
                    NavigationLink(destination: FirstDetailView()) {
                        Text("First Tab View")
                    }
                    .tabItem {
                        Image(systemName: "1.circle")
                        Text("1st Tab")
                    }

                    // Second Tab
                    NavigationLink(destination: SecondDetailView()) {
                        Text("Second Tab View")
                    }
                    .tabItem {
                        Image(systemName: "2.circle")
                        Text("2nd Tab")
                    }
                }
                // Configure the navigation bar for the tab view.
                .navigationBarTitle("Navigable App")
                .navigationBarItems(
                    trailing: Button(action: {
                        self.showAlert = true
                    }) {
                        Image(systemName: "exclamationmark.circle")
                    }
                )
                // Initiate an alert
                .alert(isPresented: $showAlert) {
                    Alert(
                        title: Text("Alert"),
                        message: Text("This is an alert message."),
                        dismissButton: .default(Text("OK"))
                    )
                }
                // Present the modal sheet when showSheet is true.
                .sheet(isPresented: $showSheet) {
                    ModalView()
                }
            }
        }
    }

// detail view 1 - after tab view
    struct FirstDetailView: View {
        var body: some View {
            Text("First Detail View")
                .navigationBarTitle("First Detail", displayMode: .inline)
        }
    }

// detail view 2 - after tab view
    struct SecondDetailView: View {
        var body: some View {
            Text("Second Detail View")
                .navigationBarTitle("Second Detail", displayMode: .inline)
        }
    }

// modal view attempt
    struct ModalView: View {
        var body: some View {
            NavigationView {
                VStack {
                    Text("Modal View")
                }
                // Configure the nav bar
                .navigationBarTitle("Modal Sheet")
                .navigationBarItems(trailing: Button("Done") {
                    // Dismiss the modal sheet when pressing "Done"
                })
            }
        }
    }

    

// from stack overflow - was having trouble with the preview showing up
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
