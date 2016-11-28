//
//  ThirdViewController.swift
//  Project1_Alex_Mai
//
//  Created by Alex Mai on 10/26/16.
//  Copyright © 2016 Mobile Application Development. All rights reserved.
//

import UIKit


//This class details the personal information of the user
class ThirdViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate, UITextFieldDelegate {
    
    //MARK: Outlets
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var emailLabel: UILabel!
    @IBOutlet var genderLabel: UILabel!
    @IBOutlet var ageLabel: UILabel!
    @IBOutlet var imageViewer: UIImageView!
    @IBOutlet var emergencyContact: UILabel!
    @IBOutlet weak var cameraItem: UIBarButtonItem!
    
    //MARK: Actions
    @IBAction func cameraButtonPressed(_ sender: AnyObject) {
        let picker = UIImagePickerController()
        
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            picker.sourceType = .camera
            picker.delegate = self
            present(picker, animated: true, completion: nil)
            
        }
    }
    
    @IBAction func photolibraryButtonPressed(_ sender: AnyObject) {
        let picker = UIImagePickerController()

        picker.sourceType = .photoLibrary
        picker.delegate = self
        present(picker, animated: true, completion: nil)
    }
    
    @IBAction func logoutButtonPressed(_ sender: Any) {
        AccountManager.sharedInstance.whoAmI = ""
        dismiss(animated: true, completion: nil)
    }
    
    // picker controller delegate
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        let photo = info[UIImagePickerControllerOriginalImage] as! UIImage
        
        //save the photo - tie the unique ID from caption to the image, so link
        ImagePersister.saveImage(photo, forEmail: AccountManager.sharedInstance.accounts[AccountManager.sharedInstance.getAccountIndex(AccountManager.sharedInstance.whoAmI)].email)
        
        imageViewer.image = photo
        
        dismiss(animated: true, completion: nil)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //if camera is unavailable, disable the camera button
        if !UIImagePickerController.isSourceTypeAvailable(.camera) {
            cameraItem.isEnabled = false
        }
        
        //autopopulate the user's information given login
        nameLabel.text = AccountManager.sharedInstance.accounts[AccountManager.sharedInstance.getAccountIndex(AccountManager.sharedInstance.whoAmI)].name
        emailLabel.text = AccountManager.sharedInstance.accounts[AccountManager.sharedInstance.getAccountIndex(AccountManager.sharedInstance.whoAmI)].email
        genderLabel.text = AccountManager.sharedInstance.accounts[AccountManager.sharedInstance.getAccountIndex(AccountManager.sharedInstance.whoAmI)].gender
        ageLabel.text = (String) (AccountManager.sharedInstance.accounts[AccountManager.sharedInstance.getAccountIndex(AccountManager.sharedInstance.whoAmI)].age)
        
        //if the image were saved, then persist the last saved image, otherwise display its default associated with the account
        if let img = ImagePersister.getImage(forEmail: AccountManager.sharedInstance.accounts[AccountManager.sharedInstance.getAccountIndex(AccountManager.sharedInstance.whoAmI)].email) {
            imageViewer.image = img
        }
        else {
            let img = AccountManager.sharedInstance.accounts[AccountManager.sharedInstance.getAccountIndex(AccountManager.sharedInstance.whoAmI)].image
            
            imageViewer.image = UIImage(named: img)
        }
        
        emergencyContact.text = AccountManager.sharedInstance.accounts[AccountManager.sharedInstance.getAccountIndex(AccountManager.sharedInstance.whoAmI)].emergencyContact
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
