//
//  AddFoodView.swift
//  SwiftApi
//
//  Created by dinh.nguyen.18 on 16/05/2023.
//

import Foundation
import SwiftUI

struct AddFoodView: View {
    @Environment(\.managedObjectContext) var managedObjContext
    @Environment(\.dismiss) var dismiss
    
    @State private var name = ""
    @State private var calories: Double = 0
    
    var body: some View {
        Form {
            Section() {
                TextField("Food name", text: $name)
                
                VStack {
                    Text("Calories: \(Int(calories))")
                    Slider(value: $calories, in: 0...1000, step: 10)
                }
                .padding()
                
                
                Button("Submit") {
                    UserInfoController().addFood(
                        name: name,
                        calories: calories,
                        context: managedObjContext)
                    dismiss()
                }
                .frame(maxWidth: .infinity)
            }
        }
    }
}

struct AddFoodView_Previews: PreviewProvider {
    static var previews: some View {
        AddFoodView()
    }
}
