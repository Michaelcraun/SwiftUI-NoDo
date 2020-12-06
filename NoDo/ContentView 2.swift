//
//  ContentView.swift
//  NoDo
//
//  Created by Michael Craun on 5/8/20.
//  Copyright © 2020 Michael Craun. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State var nodo = NoDo(nodo: "", added: Date())
    @State var nodoList = [NoDo]()
    
    var body: some View {
        NavigationView {
            VStack {
                HStack(spacing: 5) {
                    Image(systemName: "plus.circle")
                        .padding(.leading)
                    Group {
                        TextField("What will you not do today?", text: $nodo.nodo, onEditingChanged: { (changed) in
                            
                        }, onCommit: {
                            self.nodo.added = Date()
                            self.nodoList.insert(self.nodo, at: 0)
                        }).padding(.all, 12)
                    }.clipShape(RoundedRectangle(cornerRadius: 5))
                        .background(Color.green)
                        .shadow(radius: 5)
                        .padding(.trailing, 8)
                }
                List(self.nodoList, id: \.self) { nodo in
                    CellRow(nodo: nodo)
                }
            }
        }.navigationBarTitle("NoDo")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
