//
//  Model.swift
//  Youtube Clore
//
//  Created by Darell Legoferdanu on 15/03/21.
//

import Foundation

class Model {
  
//  buat fungsi untun mengambil ata dari youtube API
  func getVideo(){

    let url = URL(string: Constants.API_URL)
    
//    kitac cek url nyya arigato
    guard url != nil else {
      return
    }
    
//    mendapatkan urlSession
    let session = URLSession.shared
    
//    mendapatkan data dari urlSession
    let dataTask = session.dataTask(with: url!) {  (data, response, error) in
      
//      kalau ada error
      if error != nil || data == nil{
        return
      }
      
      do{
        
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .iso8601
        
        let response = try decoder.decode(Response.self, from: data!)
        
        dump(response)
      }
      
      catch{
        
      }
    }
//    mulai bekerja
    dataTask.resume()
    
  }
}
