//
//  CellRow.swift
//  NoDo
//
//  Created by Michael Craun on 5/8/20.
//  Copyright © 2020 Michael Craun. All rights reserved.
//

import SwiftUI

struct CellRow: View {
    @State var nodo: NoDo
    
    var body: some View {
        VStack(alignment: .center, spacing: 2) {
            Group {
                HStack {
                    Text(nodo.name)
                        .foregroundColor(nodo.isDone ? .black : .white)
                        .multilineTextAlignment(.leading)
                        .lineLimit(2)
                    Spacer()
                    Image(systemName: nodo.isDone ? "checkmark" : "square")
                        .padding()
                }
                HStack(alignment: .center, spacing: 3) {
                    Spacer()
                    Text("Added \(nodo.dateText)")
                        .foregroundColor(nodo.isDone ? .black : .white)
                        .italic()
                        .padding(.all, 4)
                }.padding(.bottom, 5)
            }.padding(.all, 5)
        }.background(nodo.isDone ? Color.gray : Color.pink)
            .opacity(nodo.isDone ? 0.3 : 1)
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .onTapGesture {
                self.nodo.isDone.toggle()
                
        }.offset(x: nodo.isDone ? 30 : 0)
            .animation(.spring())
    }
}

//struct CellRow_Previews: PreviewProvider {
//    var nodo = Binding<NoDo>(NoDo(name: "Yo Mama"))
//    static var previews: some View {
//        CellRow(nodo: $nodo)
//    }
//}
