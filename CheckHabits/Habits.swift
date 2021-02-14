//
//  Habits.swift
//  CheckHabits
//
//  Created by PATRICIA S SIQUEIRA on 14/02/21.
//

import Foundation

struct Habit: Codable, Identifiable {
    
    var id = UUID()
    var type: String
    var notes: String
    var title: String
    var description: String
    
}

class Habits: ObservableObject {
    @Published var items = [Habit]() {
        didSet {
            let encoder = JSONEncoder()
            if let encoded = try? encoder.encode(items) {
                UserDefaults.standard.set(encoded, forKey: "habit")
            }
        }
    }
    init() {
        if let items = UserDefaults.standard.data(forKey: "habit") {
            let decoder = JSONDecoder()
            if let decoded = try? decoder.decode([Habit].self, from: items) {
                self.items = decoded
                return
            }
        }
        
        self.items = []
    }
    
}
