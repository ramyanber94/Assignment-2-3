//
//  ItemCellView.swift
//  Assignment 2-3
//
//  Created by ramy on 2022-01-31.
//


import SwiftUI
import CoreData

struct ItemCellView: View {
    let match: match
    var body: some View {
        ZStack{
            HStack{
                
                VStack{
                    Image("https://footystats.org/img/\(match.away_image)").padding()
                    Text("https://footystats.org/img/\(match.home_name)").padding()
                }.padding()
                Spacer()
                VStack{
                    Image("\(match.home_image)").padding()
                    Text("\(match.home_name)").padding()
                }.padding()           }
            Text("\(match.homeGoalCount) - \(match.awayGoalCount)")
        }.background(Color(.green))
    }
}

struct ItemCellView_Previews: PreviewProvider {
    static var previews: some View {
        ItemCellView(match: match.example)
    }
}
