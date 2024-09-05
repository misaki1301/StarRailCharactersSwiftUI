//
//  File.swift
//  
//
//  Created by Paul Frank on 26/02/24.
//

import Foundation

@MainActor
class CharacterViewModel: ObservableObject {
	@Published 
	var characterList: Character = [:]
	
	var service: CharactersService = CharactersService()
	
	
	func getCharacter() async {
		guard let data = try? await service.getCharacters() else {return}
		self.characterList = data
	}
	
	
}
