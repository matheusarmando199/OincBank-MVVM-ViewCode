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
    lazy var loginLabel: UILabel = {
        let ll = UILabel()
        ll.text = "LOGIN"
        ll.font = UIFont.boldSystemFont(ofSize: 50)
        ll.textColor = .white
        return ll
    }()
    lazy var backButton: UIButton = {
        let bb = UIButton()
        bb.setBackgroundImage(UIImage(named: "back"), for: .normal)
        bb.addTarget(self, action: #selector(actionBack), for: .touchUpInside)
        return bb
    }()
    lazy var emailContainerView: UIView = {
        let emailImage = UIImage(named: "email")
        let ecv = Utilities().imputContainerView(imagem: emailImage, textField: emailTextField)
        return ecv
    }()
    lazy var senhaContainerView: UIView = {
        let cadeadoImage = UIImage(named: "cadeado")
        let ecv = Utilities().imputContainerView(imagem: cadeadoImage, textField: senhaTextField)
        return ecv
    }()
    let emailTextField: UITextField = {
        let etf = Utilities().myTextField(myplaceholder: "Email")
        return etf
    }()
    let senhaTextField: UITextField = {
        let etf = Utilities().myTextField(myplaceholder: "Senha")
        etf.isSecureTextEntry = true
        return etf
    }()
    lazy var loginButton: UIButton = {
        let lb = Utilities().myButton(titulo: "Login", backgroundColor: .white, tituloColor: .systemPink)
        lb.addTarget(self, action: #selector(ActionLogin), for: .touchUpInside)
        return lb
    }()
    lazy var loginStackView: UIStackView = {
        let stackView = Utilities().configStackView(eixo: .vertical, espacoEntreViews: 20, views: [emailContainerView, senhaContainerView])
        return stackView
    }()
    // MARK: - Funções  SetUp
    
    func configUI(){
        view.backgroundColor = .white
    }
    
    func configAllElements(){
        view.addSubview(customTopImageView)
        view.addSubview(loginLabel)
        view.addSubview(customBotttomImageView)
        view.addSubview(backButton)
        view.addSubview(loginButton)
        view.addSubview(loginStackView)
    }
    
    func setUpDelegates(delegates: UITextFieldDelegate){
        emailTextField.delegate = delegates
        senhaTextField.delegate = delegates
    }
    
    func configConstraints(){
        customBotttomImageView.centerX(inView: view, topAnchor: view.safeAreaLayoutGuide.topAnchor, paddingTop: 150)
        customBotttomImageView.setDimensions(width: 800, height: 800)
        
        loginLabel.anchor(top: view.topAnchor, left: view.leftAnchor, paddingTop: 100, paddingLeft: 40)
        
        customTopImageView.anchor(top: view.topAnchor, left: view.leftAnchor, width: 400, height: 400)
    
        backButton.anchor(top: view.safeAreaLayoutGuide.topAnchor, left: view.leftAnchor, paddingTop: 15, paddingLeft: 20,
                          width: 30, height: 20)
        
        loginStackView.anchor(left: view.leftAnchor, bottom: view.safeAreaLayoutGuide.bottomAnchor, right: view.rightAnchor, paddingLeft: 16, paddingBottom: 120, paddingRight: 16)
        
        loginButton.centerX(inView: view, topAnchor: loginStackView.bottomAnchor, paddingTop: 20)
        
    }
    
    // MARK: - Funções Target

    @objc func actionBack(){
        navigationController?.pushViewController(FirsController(), animated: true)
    }
    
    @objc func ActionLogin(){
        navigationController?.pushViewController(MainTabBarController(), animated: true)
    }
    
    
    // MARK: - Ciclos de Vida
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configUI()
        configAllElements()
        configConstraints()
        setUpDelegates(delegates: self)
    }
}
    
extension LoginController: UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
    }
}
