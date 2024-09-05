//
//  File.swift
//  
//
//  Created by Paul Frank on 26/02/24.
//

import Foundation
import SwordWard

struct CharacterValue: Codable {
	let id, name, tag: String
	let rarity: Int
	let path, element: String
	let maxSP: Int?
	let ranks, skills, skillTrees: [String]?
	let icon, preview, portrait: String
	
	enum CodingKeys: String, CodingKey {
		case id, name, tag, rarity, path, element
		case maxSP = "max_sp"
		case ranks, skills
		case skillTrees = "skill_trees"
		case icon, preview, portrait
	}
}

typealias Character = [String: CharacterValue]


class CharactersService {
	
	
	public func getCharacters() async throws -> Character {
		guard let url = URL(string: "https://raw.githubusercontent.com/Mar-7th/StarRailRes/master/index_new/en/characters.json") else {return [:] }
		print("url \(url)")
		let result: Result<Character, Error> = try await SwordWard.request(url, method: .get, body: nil)
		switch result {
			case .success(let response):
				print(response)
				return response
			case .failure(let error):
				print(error)
				throw error
		}
	}
	
}
