//
//  TodoItem.swift
//  RealmDemo
//
//  Created by AnhTT on 7/31/20.
//  Copyright © 2020 AnhTT. All rights reserved.
//

import Foundation
import RealmSwift

class TodoItem: Object {
  dynamic var detail = ""
  dynamic var status = 0
}
