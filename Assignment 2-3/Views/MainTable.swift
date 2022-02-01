//
//  MainTable.swift
//  Assignment 2-3
//
//  Created by ramy on 2022-01-31.
//

import SwiftUI

struct MainTable: View {
    @State var data = [match]()
    var body: some View {
        List{
            ForEach(data){ d in
                ItemCellView(match: d)
            }
        }.task {
            ApiService.shared.getAllLeagues { result in
                data = result
            }
        }
    }
}

struct MainTable_Previews: PreviewProvider {
    static var previews: some View {
        MainTable()
    }
}
