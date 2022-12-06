//
//  Photo.swift
//  Navigation
//
//  Created by Христина Буянова on 02.12.2022.
//

import Foundation
import UIKit

struct Photo {
    var image: String
}

var photoGallery = [Photo(image: "Photo1"), Photo(image: "Photo2"), Photo(image: "Photo3"), Photo(image: "Photo4"), Photo(image: "Photo5"), Photo(image: "Photo6"), Photo(image: "Photo7"), Photo(image: "Photo8"), Photo(image: "Photo9"), Photo(image: "Photo10"), Photo(image: "Photo11"), Photo(image: "Photo12"), Photo(image: "Photo13"), Photo(image: "Photo14"), Photo(image: "Photo15"), Photo(image: "Photo16"), Photo(image: "Photo17"), Photo(image: "Photo18"), Photo(image: "Photo19"), Photo(image: "Photo20")]

struct PhotoForProfile {
    var firstPhoto: String
    var secondPhoto: String
    var thirdPhoto: String
    var fouthPhoto: String
}

var cellPhoto = [PhotoForProfile(firstPhoto: photoGallery[0].image, secondPhoto: photoGallery[1].image, thirdPhoto: photoGallery[2].image, fouthPhoto: photoGallery[3].image)]

