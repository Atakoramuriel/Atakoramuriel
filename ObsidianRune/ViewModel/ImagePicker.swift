//
//  ImagePicker.swift
//  ObsidianRune
//
//  Created by Lord Atakora on 3/1/21.
//
import SwiftUI
import PhotosUI

struct ImagePicker : UIViewControllerRepresentable {
    @Binding var picker : Bool
    @Binding var imgData : Data
    
    //This is the first function
    func makeCoordinator() -> Coordinator {
        return ImagePicker.Coordinator(parent: self)
    }
    
    //Second Function
    func makeUIViewController(context: Context) -> some PHPickerViewController {
        var config = PHPickerConfiguration()
        config.selectionLimit = 1 //only 1 picture selection allowed for profile photo
        let controller = PHPickerViewController(configuration: config)
        controller.delegate = context.coordinator
        return controller
    }
    
    //Third function
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        //Leave empty for now
    }
    
    //next create class
    class Coordinator : NSObject, PHPickerViewControllerDelegate {
        //Variables
        var parent : ImagePicker
        
        //initializer here!!
        init(parent: ImagePicker){
            self.parent = parent
        }
        
        func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
            
            //In the event no pictures are selected
            if results.isEmpty{
                self.parent.picker.toggle()
                return
            }
            
            //else
            let item = results.first!.itemProvider
            
            //start of if statement
            if item.canLoadObject(ofClass: UIImage.self){
                //continue
                item.loadObject(ofClass: UIImage.self) { (image, err) in
                    //if statement
                    if err != nil{return}
                    
                    let imageData = image as! UIImage
                    
                    DispatchQueue.main.async {
                        self.parent.imgData = imageData.jpegData(compressionQuality: 0.5)!
                        self.parent.picker.toggle()
                    }
                }
            }
        }
    }
}

