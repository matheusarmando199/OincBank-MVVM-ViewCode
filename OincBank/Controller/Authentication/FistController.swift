//
//  LoginController.swift
//  OincBank
//
//  Created by Matheus Armando on 13/07/22.
//

import UIKit

class FirsController: UIViewController{
    
    // MARK: - Elementos
    lazy var oincBankImageView: UIImageView = {
        let obiv = UIImageView()
        obiv.contentMode = .scaleAspectFit
        obiv.image = UIImage(named: "oincbanklogo")
        return obiv
    }()
    
    lazy var customBotttomImageView: UIImageView = {
        let obiv = UIImageView()
        obiv.contentMode = .scaleAspectFit
        obiv.image = UIImage(named: "bottoncustom")
        return obiv
    }()
    
    lazy var loginButton: UIButton = {
        let lb = Utilities().myButton(titulo: "Login", backgroundColor: .systemPink, tituloColor: .white)
        lb.addTarget(self, action: #selector(actionChamarTelaLogin), for: .touchUpInside)
        return lb
    }()
    lazy var RegistroButton: UIButton = {
        let lb = UIButton()
        lb.backgroundColor = .white
        lb.setTitle("Ainda não é um Oincer, Cadastre-se", for: .normal)
        lb.titleLabel?.font = UIFont.boldSystemFont(ofSize: 15)
        lb.setTitleColor(.systemPink, for: .normal)
        lb.addTarget(self, action: #selector(actionChamarTelaRegistro), for: .touchUpInside)
        return lb
    }()
    
    // MARK: - Funções  SetUp
    
    func configUI(){
        view.backgroundColor = .systemPink
    }
    
    func configAllElements(){
        view.addSubview(oincBankImageView)
        view.addSubview(customBotttomImageView)
        view.addSubview(loginButton)
        view.addSubview(RegistroButton)
    }
    
    func configConstraints(){
        oincBankImageView.centerX(inView: view, topAnchor: view.safeAreaLayoutGuide.topAnchor)
        oincBankImageView.setDimensions(width: 250, height: 250)
        
        customBotttomImageView.centerX(inView: view, topAnchor: view.safeAreaLayoutGuide.topAnchor, paddingTop: 180)
        customBotttomImageView.setDimensions(width: 800, height: 800)
        
        loginButton.centerX(inView: view, topAnchor: oincBankImageView.bottomAnchor, paddingTop: 130)
        
        RegistroButton.centerX(inView: view, topAnchor: loginButton.bottomAnchor, paddingTop: 20)
    }
    
    // MARK: - Funções Target

    @objc func actionChamarTelaLogin(){
        navigationController?.pushViewController(LoginController(), animated: true)
    }
    
    @objc func actionChamarTelaRegistro(){
        navigationController?.pushViewController(RegistroController(), animated: true)
    }
    
    // MARK: - Ciclos de Vida
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.setNavigationBarHidden(true, animated: false)
        configUI()
        configAllElements()
        configConstraints()
    }
}
    
