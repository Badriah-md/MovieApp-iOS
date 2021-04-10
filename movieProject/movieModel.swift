//
//  movieModel.swift
//  movieProject
//
//  Created by Bdoor on 01/08/1442 AH.
//

import Foundation
import UIKit

class movieModel{
    var movieName:String?
    var movieRate:Int?
    var movieType:String?
    var movieImage:UIImage?
    var imageName :String?
    
    convenience init(movieName:String,movieRate:Int,movieType:String,imageName:String){
    self.init()
        self.movieName = movieName
        self.movieRate = movieRate
        self.movieType = movieType
        self.imageName = imageName
        
    }

}
