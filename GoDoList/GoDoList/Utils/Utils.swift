//
//  Utils.swift
//  GoDoList
//
//  Created by Fabian Josue Rodriguez Alvarez on 12/3/23.
//

import Foundation

enum Log {
    
    /**
     Shows an Catch error message on console, and an optional string message.
     
     **Notes:**
     - This function takes the file name where the error is presented, the function name who call it and the line number where the error is presented.
     - By default **file**, **function** and **line** are setted internally, so you can ignore these parameters.
     
     **Example:**
     ```swift
     do{
     let article = try JSONDecoder().decode(T.self, from: data)
     
     if let article = article {
     completion(article)
     }
     }catch{
     Log.WriteCatchExeption(err: error)
     }
     ```
     
     - Parameters:
     - message:Optional string message to add to the print.
     - error: The catch error message from the try.
     
     - Returns: Void
     
     - Warning: N/A
     
     - Throws: N/A
     
     - Authors: Fabian Rodriguez
     
     - Version: 1.0
     
     - Date: March 2023
     */
    static func WriteCatchExeption(_ message: String? = nil, file: String = #file, function: String = #function, line: Int = #line, error: Error) {
        print("Error in catch - \(message ?? ""), called by: \(file.components(separatedBy: "/").last ?? file) - \(function), at line: \(line). Description: ", error)
    }
}

struct Utils {
    
    /**
     Converts a JSON file to a specific Model.
     
     **Notes:**
     - The model is generic, so it can decode any kind of model object.
     - Its optional because a Json file could be empty or not found.
     
     **Example:**
     ```swift
     guard let list = Utils.decodeJson(jsonName: "ItemNavbarList", model: [ItemNavbarModel].self) else {
         throw NetworkError.jsonDecoder
     }
     ```
     
     - Parameters:
        - jsonName: Name of the Json file.
        - model: The model where the json will decode.
     
     - Returns: The model.
     
     - Warning: N/A
     
     - Throws: N/A
     
     - Authors: Fabian Rodriguez
     
     - Version: 1.0
     
     - Date: March 2023
     */
    static func decodeJson<T: Decodable>(jsonName: String, model: T.Type) -> T? {
        
        //lee un archivo que esta en el Bundle, pasandole un nombre y el tipo de extension.
        guard let url = Bundle.main.url(forResource: jsonName, withExtension: "json") else {
            return nil
        }
        
        do {
            //Lee la URL donde está el archivo y lo convierte en "data".
            let data = try Data(contentsOf: url)
            
            let jsonDecoder = JSONDecoder()
            
            do {
                let responseModel = try jsonDecoder.decode(T.self, from: data)
                return responseModel
            }catch{
                Log.WriteCatchExeption("json mock: ", error: error)
                return nil
            }
        }catch{
            return nil
        }
    }
}
