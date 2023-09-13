//
//  BaseApiViewModel.swift
//  Planets
//
//  Created by Imesh on 2023-09-13.
//

import Foundation

enum APIState {
    case inProgress, succeed, failed
}

class BaseAPIViewModel<T>: BaseViewModel<T> {
    @Published var apiState = APIState.inProgress
}
