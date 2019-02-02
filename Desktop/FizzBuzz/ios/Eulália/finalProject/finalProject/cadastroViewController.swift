//
//  cadastroViewController.swift
//  finalProject
//
//  Created by Treinamento on 01/08/18.
//  Copyright © 2018 PortoDigital. All rights reserved.
//

import UIKit
import CoreData

class cadastroViewController: UIViewController {
    
    var appDelegate: AppDelegate?
    var managedContext: NSManagedObjectContext?
    var recievedData: Int = 0
    var players: [NSManagedObject] = []
    
    
    @IBOutlet weak var imageUser: UIImageView!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var playerNameTextField: UITextField!
    
    
    @IBAction func save() {
        if let test = playerNameTextField.text, test != "", let testImage = imageUser.image {
            afterTap(novoNome: test, novoScore: scoreLabel.text!, novaFoto: testImage)
            
        }
        else{
            print("insira nome ou foto")
        }
    }
    
    
    func afterTap(novoNome: String, novoScore: String, novaFoto: UIImage){
        let entity = NSEntityDescription.entity(forEntityName: "PlayerEnt", in: managedContext!)
        let player = NSManagedObject(entity: entity!, insertInto: managedContext)
        let imgData = UIImageJPEGRepresentation(novaFoto, 1)
        let scoreString = Int(novoScore)!
        player.setValue(novoNome, forKey: "nome")
        player.setValue(scoreString, forKey: "score")
        player.setValue(imgData, forKey: "foto")
        
        do{
            try managedContext?.save()
            self.players.append(player)
            performSegue(withIdentifier: "fromCadastrotoScore", sender: self)
        }
        catch let error as NSError{
            print("erro na hora de salvar \(error),\(error.userInfo)")
        }
    }
    

    
    
    @IBAction func choosePhoto(_ sender: Any) {
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.photoLibrary){
            let imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.sourceType = UIImagePickerControllerSourceType.photoLibrary
            imagePicker.allowsEditing = true
            self.present(imagePicker,animated: true)
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.scoreLabel.text = "\(recievedData)"

        // Do any additional setup after loading the view.
        self.appDelegate = UIApplication.shared.delegate as? AppDelegate
        self.managedContext = self.appDelegate?.persistentContainer.viewContext
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

extension cadastroViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let pickedImage = info[UIImagePickerControllerOriginalImage] as? UIImage{
            let imagemSelecionada = pickedImage
            imageUser.image = imagemSelecionada
        }
        picker.dismiss(animated: true, completion: nil)
    }
}


