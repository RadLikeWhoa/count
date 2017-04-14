//
//  CounterList.swift
//  Count!
//
//  Created by Sacha Schmid on 14.4.17.
//
//

import Foundation
import RealmSwift

class CounterList: Object {
    let items = List<Counter>()
}
