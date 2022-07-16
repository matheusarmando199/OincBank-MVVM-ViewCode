//
//  HomeController.swift
//  OincBank
//
//  Created by Matheus Armando on 12/07/22.
//

import UIKit

class HomeController: UIViewController {

    // MARK: - Elementos

    
    
    // MARK: - Funções SetUp
    
    func configUI(){
        view.backgroundColor = .systemPink
        let logo = UIImageView(image: UIImage(named: "oincbankicon"))
        logo.contentMode = .scaleAspectFit
        navigationItem.titleView = logo
    }
    
    
    
    // MARK: - Ciclos de Vida
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configUI()
    }
    




}
