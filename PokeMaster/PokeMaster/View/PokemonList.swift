//
//  PokemonList.swift
//  PokeMaster
//
//  Created by sengshuaibin on 2021/6/29.
//  Copyright © 2021 OneV's Den. All rights reserved.
//

import SwiftUI

struct PokemonList: View {
    @State var expandingIndex: Int?
    
    var body: some View {
        ScrollView {
            LazyVStack {
                ForEach(PokemonViewModel.all) { pokemon in
                    PokemonInfoRow(model: pokemon, expanded: expandingIndex == pokemon.id)
                        .onTapGesture {
                            withAnimation(.spring(response: 0.45, dampingFraction: 0.425, blendDuration: 0)) {
                                expandingIndex = expandingIndex == pokemon.id ? nil : pokemon.id
                            }
                        }
                }
            }
        }.overlay(
            VStack {
                Spacer()
                PokemonInfoPanel(model: .sample(id: 1))
            }.edgesIgnoringSafeArea(.bottom)
        )

    }
}

struct PokemonList_Previews: PreviewProvider {
    static var previews: some View {
        PokemonList()
    }
}
