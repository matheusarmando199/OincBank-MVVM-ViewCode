//
//  LojaController.swift
//  OincBank
//
//  Created by Matheus Armando on 12/07/22.
//

import UIKit

class LojaController: UIViewController {

    // MARK: - Elementos
    
    
    
    
    // MARK: - Funções SetUp
    
    func configUI(){
        view.backgroundColor = .systemBlue
        navigationItem.title = "OincStore"
    }
    
    // MARK: - Ciclos de Vida
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configUI()
    }
  
    
}
