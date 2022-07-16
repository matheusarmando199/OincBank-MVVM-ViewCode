//
//  LoginController.swift
//  OincBank
//
//  Created by Matheus Armando on 13/07/22.
//

import UIKit

class RegistroController: UIViewController{
    
    // MARK: - Elementos
    
    lazy var customBotttomImageView: UIImageView = {
        let cbiv = UIImageView()
        cbiv.image = UIImage(named: "custombottomregistro")
        cbiv.contentMode = .scaleAspectFit
        return cbiv
    }()
    lazy var registroLabel: UILabel = {
        let ll = UILabel()
        ll.text = "REGISTRO"
        ll.font = UIFont.boldSystemFont(ofSize: 50)
        ll.textColor = .white
        return ll
    }()
    lazy var addImageButton: UIButton = {
        let lb = UIButton()
        lb.setBackgroundImage(UIImage(named: "addfoto"), for: .normal)
        lb.setDimensions(width: 110, height: 110)
        lb.addTarget(self, action: #selector(actionAddImage), for: .touchUpInside)
        return lb
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
    lazy var nomeContainerView: UIView = {
        let pessoaImage = UIImage(named: "pessoa")
        let ecv = Utilities().imputContainerView(imagem: pessoaImage, textField: nomeTextField)
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
    let nomeTextField: UITextField = {
        let etf = Utilities().myTextField(myplaceholder: "Nome")
        etf.isSecureTextEntry = true
        return etf
    }()
    
    lazy var registroStackView: UIStackView = {
        let rstv = Utilities().configStackView(eixo: .vertical, espacoEntreViews: 20, views: [emailContainerView, senhaContainerView, nomeContainerView])
        return rstv
    }()
    
    lazy var registroButton: UIButton = {
        let rbt = Utilities().myButton(titulo: "Registrarse", backgroundColor: .white, tituloColor: .systemPink)
        return rbt
    }()
    
    // MARK: - Funções  SetUp
    
    func configUI(){
        view.backgroundColor = .systemPink
    }
    
    func setUpAllElements(){
        view.addSubview(customBotttomImageView)
        view.addSubview(registroLabel)
        view.addSubview(backButton)
        view.addSubview(registroStackView)
        view.addSubview(registroButton)
        view.addSubview(addImageButton)
    }

    func setUpConstraints(){
        customBotttomImageView.centerX(inView: view, topAnchor: view.safeAreaLayoutGuide.topAnchor, paddingTop: 5)
        customBotttomImageView.setDimensions(width: 800, height: 800)
        
        addImageButton.centerX(inView: view, topAnchor: view.safeAreaLayoutGuide.topAnchor, paddingTop: 120)
        
        registroLabel.anchor(top: view.safeAreaLayoutGuide.topAnchor, left: backButton.rightAnchor, paddingTop: 15, paddingLeft: 5)
        
        backButton.anchor(top: view.safeAreaLayoutGuide.topAnchor, left: view.leftAnchor, paddingTop: 15, paddingLeft: 20,
                          width: 30, height: 20)
        
        registroStackView.anchor(left: view.leftAnchor, bottom: view.safeAreaLayoutGuide.bottomAnchor, right: view.rightAnchor, paddingLeft: 16, paddingBottom: 120, paddingRight: 16)
        registroButton.centerX(inView: view, topAnchor: registroStackView.bottomAnchor, paddingTop: 20)
    }
    // MARK: - Funções Target

    @objc func actionBack(){
        navigationController?.pushViewController(FirsController(), animated: true)
    }
    
    @objc func actionAddImage(){
        print("batat top")
    }
    
    // MARK: - Ciclos de Vida
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configUI()
        setUpAllElements()
        setUpConstraints()
    }
}
    
