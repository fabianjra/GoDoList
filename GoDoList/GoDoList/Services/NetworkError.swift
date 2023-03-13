//
//  NetworkError.swift
//  GoDoList
//
//  Created by Fabian Josue Rodriguez Alvarez on 12/3/23.
//

import Foundation

//Error types for the errors using WebService
enum NetworkError: String, Error {
    case invalidURL
    case serializationFailed
    case generic
    case couldNotDecodeData
    case httpResponseError
    case statusCodeError = "Ocurrió un error al tratar de consultar el API: status code"
    case jsonDecoder = "Error al intentar extraer datos de json"
    case unauthorized
}
