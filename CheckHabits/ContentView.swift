//
//  ContentView.swift
//  CheckHabits
//
//  Created by PATRICIA S SIQUEIRA on 14/02/21.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var habits = Habits()
    @State private var showingAddHabits = false
    
    
    var body: some View {
        NavigationView {
                List {
                    ForEach(habits.items) { item in
                        HStack {
                            VStack(alignment: .leading) {
                                Text(item.title)
                                    .font(.headline)
                                Text(item.description)
                            }
                            Spacer()
                        }
                    }
                    .onDelete(perform: removeItems)
                }
            .navigationBarTitle("Check Habbits")
            .navigationBarItems(leading: EditButton(), trailing:
                                    Button(action: {
                                        self.showingAddHabits = true
                                    }) {
                                        Image(systemName: "plus")
                                    }
            )
        }
        .sheet(isPresented: $showingAddHabits) {
            HabitView(habits: self.habits)
        }

    }
    func removeItems(at offsets: IndexSet) {
        habits.items.remove(atOffsets: offsets)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
