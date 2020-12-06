//
//  TopView.swift
//  NoDo
//
//  Created by Michael Craun on 5/9/20.
//  Copyright © 2020 Michael Craun. All rights reserved.
//

import SwiftUI

struct TopView: View {
    private let placeholder = "Add Something"
    @Binding var nodo: NoDo
    @Binding var showField: Bool
    @Binding var nodoList: [NoDo]
    
    var body: some View {
        ZStack {
            ZStack(alignment: .leading) {
                TextField(placeholder, text: $nodo.name) {
                    let newItem = NoDo(name: self.nodo.name)
                    self.nodoList.insert(newItem, at: 0)
                    self.nodo.name = ""
                }.padding(.all, 10)
                    .frame(width: UIScreen.main.bounds.width - 50, height: 50)
                    .background(Color.purple)
                    .cornerRadius(25)
                    .foregroundColor(.white)
                    .offset(x: showField ? 0 : (-UIScreen.main.bounds.width / 2) - 180)
                    .animation(.spring())
                Image(systemName: "plus.circle")
                    .resizable()
                    .frame(width: 40, height: 40)
                    .foregroundColor(.orange)
                    .offset(x: showField ? (UIScreen.main.bounds.width - 95) : -20)
                    .animation(.spring())
                    .onTapGesture {
                        self.showField.toggle()
                }
            }.padding(.bottom, 20)
        }
    }
}

//struct TopView_Previews: PreviewProvider {
//    static var previews: some View {
//        var nodo = NoDo()
//        var showField = false
//        var list = [NoDo]()
//        
//        return TopView(nodo: nodo, showField: showField, nodoList: list)
//    }
//}
