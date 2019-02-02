//
//  ScoreTableViewController.swift
//  finalProject
//
//  Created by Treinamento on 01/08/18.
//  Copyright © 2018 PortoDigital. All rights reserved.
//

import UIKit
import CoreData

class ScoreTableViewController: UITableViewController {

    
    @IBAction func newGame(_ sender: Any) {
        self.performSegue(withIdentifier: "novoJogo", sender: self)
    }
    var appDelegate: AppDelegate?
    var managedContext: NSManagedObjectContext?
    

    //array de jogadores
    
    var playersObject: [NSManagedObject] = []
    
    //funcao de carregamento na tela
    

    
    //funcoes de personalizacao da table view
    
    override func numberOfSections(in tableView: UITableView) -> Int{
        return 1
    }
    
    override func tableView(_ tableView : UITableView,numberOfRowsInSection section: Int) -> Int{
        return self.playersObject.count
    }
    
    //funcao de reutilizacao de celula
    
    override func tableView(_ tableView: UITableView,cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let cellIdentifier = "playerCell"
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier) as? playerTableViewCell
        
        
        let currentPlayer = self.playersObject[indexPath.row]
        
        cell?.playerName.text = currentPlayer.value(forKey: "nome") as? String
        let imagem = currentPlayer.value(forKey: "foto") as? Data
        cell?.playerImage.image = UIImage(data: imagem!)
        cell?.playerScore.text = "\(currentPlayer.value(forKey: "score")!)"
        return cell!
    }
    
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            let player = self.playersObject[indexPath.row]
            self.managedContext?.delete(player)
            self.appDelegate?.saveContext()
            
            let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "PlayerEnt")
            do{
                try self.playersObject = (self.managedContext?.fetch(fetchRequest))!
                tableView.reloadData()
            }
            catch{
                print("Fetching Failed")
            }
        }
    }
    
    /*remover
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath){
        if editingStyle == .delete{
            self.players.remove(at: indexPath.row)
            tableView.deleteRows(at:[indexPath], with: .fade)
        }
    }
    */
    
    //funcao de fetch
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName:"PlayerEnt")
        do{
            try self.playersObject = (self.managedContext?.fetch(fetchRequest))!
            tableView.reloadData()
        }
        catch let error as NSError{
            print("erro na hora de pedir \(error), \(error.userInfo)")
        }
    }
    
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        self.appDelegate = UIApplication.shared.delegate as? AppDelegate
        self.managedContext = self.appDelegate?.persistentContainer.viewContext

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source


    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}


