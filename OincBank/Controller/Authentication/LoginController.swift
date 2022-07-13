//
//  LoginController.swift
//  OincBank
//
//  Created by Matheus Armando on 13/07/22.
//

import UIKit

class LoginController: UIViewController{
    
    // MARK: - Elementos
    
    
    // MARK: - Funções  SetUp
    
    func configUI(){
        view.backgroundColor = .systemBlue
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    // MARK: - Funções Target

    
    
    // MARK: - Ciclos de Vida
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configUI()
    }
}
    
