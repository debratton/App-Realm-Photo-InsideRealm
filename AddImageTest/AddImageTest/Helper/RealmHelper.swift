//
//  RealmHelper.swift
//  AddImageTest
//
//  Created by David E Bratton on 12/15/18.
//  Copyright © 2018 David Bratton. All rights reserved.
//

import Foundation
import RealmSwift

class RealmHelper {
    static let realm = try! Realm()
    
    static func getAllPhotos() -> Results<Photo>? {
        var photos: Results<Photo>?
        photos = realm.objects(Photo.self)
        let sortedPhotos = photos?.sorted(byKeyPath: "photoName", ascending: true)
        return sortedPhotos
    }
    
    static func savePhoto(photo: Photo) {
        do {
            try realm.write {
                realm.add(photo)
            }
        } catch {
            print("Error Saving Photo: \(error.localizedDescription)")
        }
    }
    
    static func updatePhoto(photo: Photo) {
        let id = photo.photoID
        let image = photo.photoImg
        let name = photo.photoName
        
        do {
            try realm.write {
                realm.create(Photo.self, value: [
                    "photoID": id,
                    "photoImg": image!,
                    "photoName": name], update: true)
            }
        } catch {
            print("Error Updating Photos: \(error.localizedDescription)")
        }
    }
    
    static func deletePhoto(photo: Photo) {
        do {
            try realm.write {
                realm.delete(photo)
            }
        } catch {
            print("Error Deleting Photo: \(error.localizedDescription)")
        }
    }
}
