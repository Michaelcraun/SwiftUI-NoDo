//
//  ContentView.swift
//  NoDo
//
//  Created by Michael Craun on 5/8/20.
//  Copyright © 2020 Michael Craun. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State var nodoList: [NoDo] = []
    @State var showField: Bool = false
    @State var nodo = NoDo()
    
    var body: some View {
        NavigationView {
            VStack {
                HStack(spacing: 5) {
                    TopView(nodo: $nodo, showField: $showField, nodoList: $nodoList)
                }
                List {
                    ForEach(self.nodoList) { nodo in
                        CellRow(nodo: nodo)
                    }.onDelete(perform: deleteItem(at:))
                }
            }
        }.navigationBarTitle(Text("NoDo"))
    }
    
    func deleteItem(at offset: IndexSet) {
        guard let index = Array(offset).first else { return }
        nodoList.remove(at: index)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
