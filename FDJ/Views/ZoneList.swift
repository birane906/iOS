//
//  ZoneList.swift
//  FDJ
//
//  Created by Jingjing XIANG on 24/03/2021.
//

import Foundation
import Combine
import SwiftUI

public class ZoneList : ObservableObject{
    
    @Published var listzone = [Zone]()
    
    init(){
        load()
    }

    func load(){
        guard let url = URL(string: "http://127.0.0.1:8080/api/zone") else { return }
        let request = URLRequest(url:url)
        URLSession.shared.dataTask(with: request) {(data,response,error) in
                    do {
                        print("---------")
                        print(self.listzone)
                        if let d = data {
                            print("---------")
                            let decodedLists = try JSONDecoder().decode([Zone].self, from: d)
                            print("---------")
                            DispatchQueue.main.async {
                                self.listzone = decodedLists
                                print(self.listzone)
                            }
                        }else {
                            print("No Data")
                        }
                    } catch {
                        print ("Fetch failed: \(error.localizedDescription ?? "Unknown error")")
                    }
                    
                }.resume()

    }

    
    
}
