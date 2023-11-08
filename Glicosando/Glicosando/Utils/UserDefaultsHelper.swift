//
//  UserDefaultsHelper.swift
//  BioChemApp
//
//  Created by Ian Pacini on 06/11/23.
//

import Foundation

public class UserDefaultsHelper {
    enum KeyValues: String {
        case highscore
    }

    static func get( key: KeyValues) -> Any? {
        UserDefaults.standard.value(forKey: key.rawValue)
    }

    static func set( value: Any?, forKey key: KeyValues) {
        UserDefaults.standard.set(value, forKey: key.rawValue)
    }

    static func has( atKey key: KeyValues) -> Bool {
        UserDefaults.standard.value(forKey: key.rawValue) != nil
    }
}
