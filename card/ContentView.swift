//
//  ContentView.swift
//  card
//
//  Created by oiu on 19.10.2023.
//

import SwiftUI

struct ContentView: View {
    
    @State
    private var expanded: Bool = false
    
    @Namespace
    private var namespace: Namespace.ID
    
    private var card: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 15)
                .foregroundColor(.blue)
                .matchedGeometryEffect(id: "card", in: namespace)
            
            VStack {
                HStack {
                    Button {
                        expanded.toggle()
                    } label: {
                        Label(
                            "Hide",
                            systemImage: "arrowshape.backward.fill"
                        )
                        .font(.title3)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .matchedGeometryEffect(id: "button", in: namespace, properties: .position)
                    }
                    .padding()
                    
                    Spacer()
                }
                Spacer()
            }
        }
    }
    
    private var button: some View {
        Button {
            expanded.toggle()
        } label: {
            ZStack {
                RoundedRectangle(cornerRadius: 15)
                    .foregroundColor(.blue)
                    .matchedGeometryEffect(id: "card", in: namespace)
                
                Text("Show")
                    .font(.title3)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .matchedGeometryEffect(id: "button", in: namespace, properties: .position)
                    .padding(.vertical, 15)
                    .padding(.horizontal, 30)
            }
        }
    }
    
    var body: some View {
        VStack {
            if expanded {
                card
                    .frame(width: 300, height: 350)
            } else {
                VStack {
                    Spacer()
                    HStack {
                        Spacer()
                        button
                            .fixedSize()
                    }
                }
            }
        }
        .animation(.spring().speed(0.75), value: expanded)
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
