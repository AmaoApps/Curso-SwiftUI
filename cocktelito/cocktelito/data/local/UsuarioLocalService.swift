//
//  UsuarioLocalService.swift
//  cocktelito
//
//  Created by Paku on 30/06/21.
//

import Foundation
import CoreData

struct UsuarioLocalService {
    
    let context : NSManagedObjectContext
    
    init(context: NSManagedObjectContext) {
        self.context = context
    }
    
    func store(usuario: Usuario){
        let dtoUsuario = findOrCreateUser(id: usuario.id)
        dtoUsuario.id = Int32(usuario.id)
        dtoUsuario.name = usuario.name
        dtoUsuario.email = usuario.email
        dtoUsuario.password = usuario.password
        
        do {
            try context.save()
        } catch (let ex) {
            print(ex)
        }
    }
    
    func getAll() -> [Usuario] {
        let dtos = getAllUsers()
        let usuarios = dtos.map { dto -> Usuario in
            var usuario = Usuario()
            usuario.id = Int(dto.id)
            usuario.name = dto.name ?? ""
            usuario.email = dto.email ?? ""
            usuario.password = dto.password ?? ""
            return usuario
        }
        return usuarios
    }
    
    func getUsuario(id: Int) -> Usuario? {
        guard let dto = getUserById(id: id) else {
            return nil
        }
        var usuario = Usuario()
        usuario.id = Int(dto.id)
        usuario.name = dto.name ?? ""
        usuario.email = dto.email ?? ""
        usuario.password = dto.password ?? ""
        return usuario
    }
    
    func existeUsuarioPorEmail(email: String) -> Bool {
        guard getUserByEmail(email: email) != nil else {
            return false
        }
        return true
    }
    
    func obtenerCantidadUsuarioRegistrados() -> Int {
        let numUsuarios: [UsuarioDBDTO] = getAllUsers()
        return numUsuarios.count
    }
    
    func autenticarUsuario(email: String, pass: String) -> Usuario? {
        guard let usuarioEncontrado = getUserByEmailAndPassword(email: email, pass: pass) else {
            return nil
        }
        var usuarioAuth = Usuario()
        usuarioAuth.id = Int(usuarioEncontrado.id)
        usuarioAuth.email = usuarioEncontrado.email ?? ""
        usuarioAuth.password = usuarioEncontrado.password ?? ""
        usuarioAuth.name = usuarioEncontrado.name ?? ""
        return usuarioAuth
        
    }
    
    private func getUserByEmail(email: String) -> UsuarioDBDTO? {
        let request = NSFetchRequest<UsuarioDBDTO>(entityName: "UsuarioDBDTO")
        request.predicate = NSPredicate(format: "email = %@", email)
        
        do {
            let result = try context.fetch(request)
            guard let usuario = result.first else {
                return nil
            }
            return usuario
        } catch (let ex) {
            print(ex)
            return nil
        }
        
    }
    
    private func findOrCreateUser(id: Int) -> UsuarioDBDTO{
        guard let usuario = getUserById(id: id) else {
            //Registro nuevo Usuario
            return UsuarioDBDTO(context: context)
        }
        return usuario
    }
    
    private func getUserById(id: Int) -> UsuarioDBDTO? {
        //SELECT * FROM USUARIODBDTO
        let request = NSFetchRequest<UsuarioDBDTO>(entityName: "UsuarioDBDTO")
    
        //WHERE ID = <ID>
        //%d - Int decimal
        //%@ - String
        request.predicate = NSPredicate(format: "id = %d", id)
        
        do {
            let result = try context.fetch(request)
            guard let usuario = result.first else {
                return nil
            }
            return usuario
        } catch (let ex) {
            print(ex)
            return nil
        }
    }
    
    private func getUserByEmailAndPassword(email: String, pass: String)-> UsuarioDBDTO?{
        let request = NSFetchRequest<UsuarioDBDTO>(entityName: "UsuarioDBDTO")
        let predicateEmail = NSPredicate(format: "email == %@", email)
        let predicatePassword = NSPredicate(format: "password == %@", pass)
        let predicateFinal = NSCompoundPredicate.init(type: .and, subpredicates: [predicateEmail, predicatePassword])
        request.predicate = predicateFinal
        
        do {
            let result = try context.fetch(request)
            guard let usuario = result.first else {
                return nil
            }
            return usuario
        } catch (let ex) {
            print(ex)
            return nil
        }
    }
    
    private func getAllUsers() -> [UsuarioDBDTO]{
        let request = NSFetchRequest<UsuarioDBDTO>(entityName: "UsuarioDBDTO")
        
        //ORDER BY IDS
        let orderIds = NSSortDescriptor(keyPath: \UsuarioDBDTO.id, ascending: true)
        request.sortDescriptors = [orderIds]
        
        do {
            return try context.fetch(request)
        } catch (let ex) {
            print(ex)
            return []
        }
    }
    
}
