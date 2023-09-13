//
//  BaseViewModel.swift
//  Planets
//
//  Created by Imesh on 2023-09-13.
//

import Foundation

class BaseViewModel<T>: ObservableObject {
    @Published var dataList: [T] = []
}
