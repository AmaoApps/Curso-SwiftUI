//
//  UsuarioDBDTO+CoreDataProperties.swift
//  cocktelito
//
//  Created by Paku on 14/07/21.
//
//

import Foundation
import CoreData


extension UsuarioDBDTO {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<UsuarioDBDTO> {
        return NSFetchRequest<UsuarioDBDTO>(entityName: "UsuarioDBDTO")
    }

    @NSManaged public var email: String?
    @NSManaged public var id: Int32
    @NSManaged public var name: String?
    @NSManaged public var password: String?
    @NSManaged public var isLogged: Bool

}

extension UsuarioDBDTO : Identifiable {

}
