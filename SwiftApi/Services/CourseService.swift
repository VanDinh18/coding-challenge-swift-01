//
//  CourseService.swift
//  SwiftApi
//
//  Created by dinh.nguyen.18 on 08/05/2023.
//

import Foundation

class CourseService: ObservableObject {
    @Published var courses: [CourseModel] = []
    
    func fetch() {
        guard let url = URL(string: "https://iosacadamy.io/api/v1/courses/index.php") else {
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data, error == nil else {
                return
            }
            do {
                let courses = try JSONDecoder().decode([CourseModel].self, from: data)
                
                print("courses", courses)
                DispatchQueue.main.async {
                    self.courses = courses
                }
            }
            catch {
                print(error)
            }
        }
        task.resume()
    }
}
