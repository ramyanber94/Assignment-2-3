//
//  ContentView.swift
//  Assignment 2-3
//
//  Created by ramy on 2022-01-30.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @State private var userName = ""
    @State private var password = ""
    @State private var success = false


    var body: some View {
        ZStack{
        VStack{
            Text("Welcome").frame(width: 300, height: 100).font(.system(size: 50, weight: .bold, design: .default)).padding(.bottom)
            VStack{
                HStack{
                    TextField("User Name", text: $userName).padding()
                }.background(Image("Rectangle -3")).frame(width: 300, height: 30)
                HStack{
                    TextField("Password", text: $password).padding()
                }.background(Image("Rectangle -3")).frame(width: 300, height: 70)
            }
            VStack{
                HStack{
                    Button("Login"){
                        if(CoreDataService.shared.getUser(username: userName, password: password)){
                            print("Success")
                            success = true
                        }else{
                            print("Error")
                        }
                    }.background(Image("Path 5")).foregroundColor(.black).font(.system(size: 20, weight: .bold, design: .default)).padding().sheet(isPresented: $success) {
                        MainTable()
                    }
                }.frame(width: 300, height: 30)
                   
                HStack{
                    Button("Register New Account"){
                        CoreDataService.shared.addUser(userName: userName, password: password)
                        
                    }.background(Image("Path 6")).foregroundColor(.black).font(.system(size: 20, weight: .bold, design: .default))
                }.frame(width: 300, height: 80)
            }.padding()
        }
        }.frame(maxWidth: .infinity, maxHeight: .infinity) // 1
            .accentColor(Color.black)
            .background(Color("custom")).ignoresSafeArea()
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, CoreDataService.preview.container.viewContext)
    }
}
