//
//  ViewController.swift
//  finalProject
//
//  Created by Treinamento on 01/08/18.
//  Copyright © 2018 PortoDigital. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    var counter: Int = 0
    
    
    @IBOutlet weak var counterButon: UIButton!
    @IBOutlet weak var counterLabel: UILabel!
    
    
    //Ao clicar no botão counter
    
    @IBAction func tapCounterButton(_ sender: Any) {
        if(((counter + 1) % 3 == 0 && (counter + 1) % 5 != 0) || ((counter + 1)  % 3 != 0 && (counter + 1) % 5 == 0) || ((counter + 1) % 3 == 0 && (counter + 1) % 5 == 0)){
            performSegue(withIdentifier: "fromFizztoCadastro" , sender: self)
        }
        else{
            self.counter = self.counter + 1
            counterButon.setTitle("\(self.counter)", for: .normal)
        }
        
    }
    
    //Ao clicar no botao fizz
    
    @IBAction func fizzButton(_ sender: Any) {
        if (counter + 1) % 3 == 0 && (counter + 1) % 5 != 0{
            self.counter = self.counter + 1
            counterButon.setTitle("\(self.counter)", for: .normal)
        }
        else{
            performSegue(withIdentifier: "fromFizztoCadastro" , sender: self)
        }
    }
    
    //Ao clicar no botao buzz
    
    @IBAction func buzzButton(_ sender: Any) {
        if (counter + 1) % 5 == 0 && (counter + 1) % 3 != 0{
            self.counter = self.counter + 1
            counterButon.setTitle("\(self.counter)", for: .normal)
        
        }
        else{
            performSegue(withIdentifier: "fromBuzztoCadastro" , sender: self)
        }
    }
    
    //Ao clicar no botao fizzbuzz
    
    @IBAction func fizzbuzzButton(_ sender: Any) {
        if (counter + 1) % 3 == 0 && (counter + 1) % 5 == 0{
            self.counter = self.counter + 1
            counterButon.setTitle("\(self.counter)", for: .normal)
        
        }
        else{
            performSegue(withIdentifier: "fromFizzBuzztoCadastro" , sender: self)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let cadastroView = segue.destination as? cadastroViewController{
            cadastroView.recievedData = counter
        }
    }
    
   
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.counter = 0
        counterButon.setTitle("\(self.counter)", for: .normal)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
       
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


