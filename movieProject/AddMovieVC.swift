//
//  AddMovieVC.swift
//  movieProject
//
//  Created by Bdoor on 29/07/1442 AH.
//

import UIKit

class AddMovieVC: UIViewController,UITextFieldDelegate, UIImagePickerControllerDelegate & UINavigationControllerDelegate {

    @IBOutlet weak var btnColor: UIButton!
    var movie = movieModel()
    
    @IBOutlet weak var movieNameTxt: UITextField!
    @IBOutlet weak var movieRateLbl: UILabel!
    @IBOutlet weak var movieTypeTxt: UITextField!
    @IBOutlet weak var movieImage: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tapGestureInImageView = UITapGestureRecognizer(target: self, action: #selector(tapTpImageView(sender:)))
        tapGestureInImageView.numberOfTapsRequired = 1
        movieImage?.isUserInteractionEnabled = true
        movieImage?.addGestureRecognizer(tapGestureInImageView)
        // Do any additional setup after loading the view.
        let penGestureToLabelRating = UIPanGestureRecognizer(target: self, action: #selector(penInLAbelRating(sender:)))
        movieRateLbl?.isUserInteractionEnabled = true
        movieRateLbl?.addGestureRecognizer(penGestureToLabelRating)
        let tapGestureInRatingLbl = UITapGestureRecognizer(target: self, action: #selector(penInLAbelRating(sender:)))
        tapGestureInRatingLbl.numberOfTapsRequired = 1
        movieRateLbl?.addGestureRecognizer(tapGestureInRatingLbl)
        
        //hide keyboard
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(hideKeyboard(sender:))))
        
        
    }
    @objc func hideKeyboard(sender:UITapGestureRecognizer){
        view.endEditing(true)
    }
    
    @objc func tapTpImageView(sender:UITapGestureRecognizer){
        print("tap on image")
        let pickerController = UIImagePickerController()
        pickerController.delegate = self
        pickerController.allowsEditing = true
        pickerController.sourceType = .photoLibrary
        self.present(pickerController, animated: true, completion: nil)
    }
    //after picking photo
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let chosenImage:UIImage = info[UIImagePickerController.InfoKey.editedImage] as! UIImage
        movieImage!.image = chosenImage
        movie.movieImage = chosenImage
        picker.dismiss(animated: true, completion: nil)
    }
    @objc func penInLAbelRating(sender:UITapGestureRecognizer){
        print("tap rate")
        let locaationInView = sender.location(in: self.view)
        let newLblRatingView = self.view.convert(movieRateLbl!.frame, from: movieRateLbl!.superview)
        let frame1 = CGRect(x: newLblRatingView.origin.x, y: newLblRatingView.origin.y, width: newLblRatingView.size.width / 5, height: newLblRatingView.size.height)
        let frame2 = CGRect(x: newLblRatingView.origin.x, y: newLblRatingView.origin.y, width: 2 * newLblRatingView.size.width / 5, height: newLblRatingView.size.height)
        let frame3 = CGRect(x: newLblRatingView.origin.x, y: newLblRatingView.origin.y, width: 3 * newLblRatingView.size.width / 5, height: newLblRatingView.size.height)
        let frame4 = CGRect(x: newLblRatingView.origin.x, y: newLblRatingView.origin.y, width: 4 * newLblRatingView.size.width / 5, height: newLblRatingView.size.height)
        let frame5 = newLblRatingView
        if(frame1.contains(locaationInView)){
            movieRateLbl?.text = "★☆☆☆☆"
            movie.movieRate = 1
        }else if(frame2.contains(locaationInView)){
            movieRateLbl?.text = "★★☆☆☆"
            movie.movieRate = 2
        }else if(frame3.contains(locaationInView)){
            movieRateLbl?.text = "★★★☆☆"
            movie.movieRate = 3
        }else if(frame4.contains(locaationInView)){
            movieRateLbl?.text = "★★★★☆"
            movie.movieRate = 4
        }
        else if(frame5.contains(locaationInView)){
            movieRateLbl?.text = "★★★★★"
            movie.movieRate = 5
        }
    }
    
    @IBAction func addMovie(_ sender: Any) {
 
       
        if(movieNameTxt.text == "" || movieRateLbl.text == "" || movieTypeTxt.text == "" || movieImage.image == nil){
            let alertcontroller = UIAlertController(title: "تنبيه", message: "الرجاء التاكد من تعبئة جميع الحقول", preferredStyle: .alert)
            let action = UIAlertAction(title: "تم", style: .default) { (action) in

            }
            alertcontroller.addAction(action)
            self.present(alertcontroller, animated: true, completion: nil)

        }else{
            movie.movieName = movieNameTxt.text
            movie.movieType = movieTypeTxt.text
            movies.append(movie)
        
            
            navigationController?.popViewController(animated: true)
            let mainViewController = self.navigationController?.topViewController as? ViewController
                        //this table connected to movies
            mainViewController?.movieTable.reloadData()
            print("save")
            print(movies)
        }

    }

    
    //textField Delegates
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        print("press return")
        textField.resignFirstResponder()
        return true
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        textField.text = movie.movieName
        textField.resignFirstResponder()
    }

}
