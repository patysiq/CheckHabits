//
//  HabitView.swift
//  CheckHabits
//
//  Created by PATRICIA S SIQUEIRA on 14/02/21.
//

import SwiftUI

struct HabitView: View {
    @Environment(\.presentationMode) var presentationMode

    @ObservedObject var habits: Habits
    static let types = ["Book", "Personal Notes", "Daily"]
    @State private var title = ""
    @State private var type = "Personal Notes"
    @State private var description = ""
    @State private var notes = ""
    
    var body: some View {
        NavigationView {
                Form {
                    TextField("Name", text: $title)
                        .keyboardType(.alphabet)
                    Picker("Type", selection: $type) {
                        ForEach(Self.types, id: \.self) {
                            Text($0)
                        }
                    }
                    TextField("Description", text: $description)
                        .keyboardType(.alphabet)
                    TextField("Notes", text: $notes)
                        .keyboardType(.alphabet)
                    
                }
                .navigationBarTitle("Add new expense")
                .navigationBarItems(trailing: Button("Save") {
                    _ = Habit(type: self.type, notes: self.notes, title: self.title, description: self.description)
                        self.presentationMode.wrappedValue.dismiss()
                })
        }
}
}
struct HabitView_Previews: PreviewProvider {
    static var previews: some View {
        HabitView(habits: Habits())
    }
}

