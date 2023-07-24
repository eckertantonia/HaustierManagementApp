//
//  PhotosPickerItemExtension.swift
//  HaustierApp
//
//  Created by Mobile1 on 21.07.23.
//

import Foundation
import _PhotosUI_SwiftUI

extension PhotosPickerItem {
    var uiImage:UIImage? {
        guard let imageData = self.dataProvider?.loadObject(ofClass: NSData.self) as? NSData else {
            return nil
        }
        return UIImage(data: Data(referencing: imageData))
    }
}
