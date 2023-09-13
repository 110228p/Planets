//
//  LoaderView.swift
//  Planets
//
//  Created by Imesh on 2023-09-13.
//

import SwiftUI

struct LoaderView: View {
    let isFailed: Bool
    var body: some View {
        Text(isFailed ? "Failed. Tap to retry." : "Loading...")
                    .foregroundColor(isFailed ? .red : .black)
                    .padding()
    }
}

struct LoaderView_Previews: PreviewProvider {
    static var previews: some View {
        LoaderView(isFailed: false)
    }
}
