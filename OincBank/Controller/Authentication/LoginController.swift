//
//  LoginController.swift
//  OincBank
//
//  Created by Matheus Armando on 13/07/22.
//

import UIKit

class LoginController: UIViewController{
    
    // MARK: - Elementos
    lazy var customBotttomImageView: UIImageView = {
        let obiv = UIImageView()
        obiv.contentMode = .scaleAspectFit
        obiv.image = UIImage(named: "bottoncustomlogin")
        return obiv
    }()
    lazy var customTopImageView: UIImageView = {
        let obiv = UIImageView()
        obiv.contentMode = .scaleAspectFit
        obiv.image = UIImage(named: "login")
        return obiv
    }()
    lazy var backButton: UIButton = {
        let bb = UIButton()
        bb.setBackgroundImage(UIImage(named: "back"), for: .normal)
        bb.tintColor = .white
        bb.addTarget(self, action: #selector(actionBack), for: .touchUpInside)
        return bb
    }()
    // MARK: - Funções  SetUp
    
    func configUI(){
        view.backgroundColor = .white
    }
    
    func configAllElements(){
        view.addSubview(customTopImageView)
        view.addSubview(customBotttomImageView)
        view.addSubview(backButton)
    }
    
    func configConstraints(){
        customBotttomImageView.centerX(inView: view, topAnchor: view.safeAreaLayoutGuide.topAnchor, paddingTop: 150)
        customBotttomImageView.setDimensions(width: 800, height: 800)
        
        customTopImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
        customTopImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        customTopImageView.setDimensions(width: 400, height: 400)
        
        backButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 15).isActive = true
        backButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        backButton.setDimensions(width: 40, height: 20)
    }
    
    
    
    // MARK: - Funções Target

    @objc func actionBack(){
        navigationController?.pushViewController(FirsController(), animated: true)
    }
    
    
    // MARK: - Ciclos de Vida
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configUI()
        configAllElements()
        configConstraints()
    }
}
    
