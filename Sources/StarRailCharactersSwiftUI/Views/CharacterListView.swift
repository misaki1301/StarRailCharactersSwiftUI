//
//  SwiftUIView.swift
//  
//
//  Created by Paul Frank on 26/02/24.
//

import SwiftUI

public struct CharacterListView: View {
	@ObservedObject var viewModel = CharacterViewModel()
	
	public init() {}
	
   public var body: some View {
		Text("\(viewModel.characterList.count)")
			.onAppear(perform: {
				Task {
					await viewModel.getCharacter()
					print(viewModel.characterList)
				}
			})
    }
}

#Preview {
	CharacterListView()
}
