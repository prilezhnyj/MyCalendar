//
//  AlertAddPhoto.swift
//  MyCalendar
//
//  Created by Максим Боталов on 07.04.2022.
//

import UIKit

extension UIViewController {
    func alertAddPhoto(complitionHandler: @escaping (UIImagePickerController.SourceType) -> Void) {
        let alert = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        
        
        let camera = UIAlertAction(title: "Камера", style: .default) { _ in
            let camera = UIImagePickerController.SourceType.camera
            complitionHandler(camera)
        }
        
        let photo = UIAlertAction(title: "Галлерея", style: .default) { _ in
            let photo = UIImagePickerController.SourceType.photoLibrary
            complitionHandler(photo)
        }
        
        let cancel = UIAlertAction(title: "Отменить", style: .cancel, handler: nil)
        
        alert.addAction(camera)
        alert.addAction(photo)
        
        alert.addAction(cancel)
        
        present(alert, animated: true, completion: nil)
    }
}
