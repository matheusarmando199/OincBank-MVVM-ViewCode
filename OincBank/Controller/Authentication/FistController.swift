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
        obiv.image = UIImage(named: "bottoncustomlogin")
        return obiv
    }()
    
    lazy var loginButton: UIButton = {
        let lb = Utilities().myButton(titulo: "Login", backgroundColor: .white, tituloColor: .systemPink)
        lb.addTarget(self, action: #selector(actionChamarTelaLogin), for: .touchUpInside)
        return lb
    }()
    lazy var RegistroButton: UIButton = {
        let lb = UIButton()
        lb.setTitle("Ainda não é um Oincer, Cadastre-se", for: .normal)
        lb.titleLabel?.font = UIFont.boldSystemFont(ofSize: 15)
        lb.setTitleColor(.white, for: .normal)
        lb.addTarget(self, action: #selector(actionChamarTelaRegistro), for: .touchUpInside)
        return lb
    }()
    lazy var emailContainerView: UIView = {
        let emailImage = UIImage(named: "emaill")
        let ecv = Utilities().imputContainerView(imagem: emailImage, textField: emailTextField, divColor: .white)
        return ecv
    }()
    lazy var senhaContainerView: UIView = {
        let cadeadoImage = UIImage(named: "cadeadol")
        let ecv = Utilities().imputContainerView(imagem: cadeadoImage, textField: senhaTextField, divColor: .white)
        return ecv
    }()
    let emailTextField: UITextField = {
        let etf = Utilities().myTextField(myplaceholder: "Email", myPlaceHolderColor: .white, myTextColor: .white)
        return etf
    }()
    let senhaTextField: UITextField = {
        let etf = Utilities().myTextField(myplaceholder: "Senha", myPlaceHolderColor: .white, myTextColor: .white)
        etf.isSecureTextEntry = true
        return etf
    }()
    lazy var loginStackView: UIStackView = {
        let stackView = Utilities().configStackView(eixo: .vertical, espacoEntreViews: 20, views: [emailContainerView, senhaContainerView])
        return stackView
    }()
    // MARK: - Funções  SetUp
    
    func configUI(){
        view.backgroundColor = .white
    }
    func setUpDelegates(delegates: UITextFieldDelegate){
        emailTextField.delegate = delegates
        senhaTextField.delegate = delegates
    }
    
    func configAllElements(){
        view.addSubview(oincBankImageView)
        view.addSubview(customBotttomImageView)
        view.addSubview(loginButton)
        view.addSubview(loginStackView)
        view.addSubview(RegistroButton)
    }
    
    func configConstraints(){
        oincBankImageView.centerX(inView: view, topAnchor: view.safeAreaLayoutGuide.topAnchor)
        oincBankImageView.setDimensions(width: 200, height: 200)
        
        customBotttomImageView.centerX(inView: view, topAnchor: view.safeAreaLayoutGuide.topAnchor, paddingTop: 100)
        customBotttomImageView.setDimensions(width: 800, height: 800)
        
        loginStackView.anchor(top: oincBankImageView.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor, paddingTop: 60, paddingLeft: 16, paddingRight: 16)
        
        loginButton.centerX(inView: view, topAnchor: loginStackView.bottomAnchor, paddingTop: 30)
        
        RegistroButton.centerX(inView: view, topAnchor: loginButton.bottomAnchor, paddingTop: 50)
        
        
    }
    
    // MARK: - Funções Target

    @objc func actionChamarTelaLogin(){
        navigationController?.pushViewController(MainTabBarController(), animated: true)
    }
    
    @objc func actionChamarTelaRegistro(){
        navigationController?.present(RegistroController(), animated: true)
    }
    
    // MARK: - Ciclos de Vida
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.setNavigationBarHidden(true, animated: false)
        configUI()
        configAllElements()
        configConstraints()
        setUpDelegates(delegates: self)
    }
}
    
extension FirsController: UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
    }
}
