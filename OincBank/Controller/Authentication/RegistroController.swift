//
//  LoginController.swift
//  OincBank
//
//  Created by Matheus Armando on 13/07/22.
//

import UIKit
import Firebase

class RegistroController: UIViewController{
    
    // MARK: - Elementos
    
    private let imagePiker = UIImagePickerController()
    private var profileImage: UIImage?
    
    lazy var customBotttomImageView: UIImageView = {
        let cbiv = UIImageView()
        cbiv.image = UIImage(named: "custombottomregistro")
        cbiv.contentMode = .scaleAspectFit
        return cbiv
    }()
    lazy var addImageButton: UIButton = {
        let lb = UIButton()
        lb.setBackgroundImage(UIImage(named: "addfoto"), for: .normal)
        lb.setDimensions(width: 140, height: 140)
        lb.addTarget(self, action: #selector(actionAddImage), for: .touchUpInside)
        return lb
    }()
    lazy var emailContainerView: UIView = {
        let emailImage = UIImage(named: "email")
        let ecv = Utilities().imputContainerView(imagem: emailImage, textField: emailTextField, divColor: .systemPink)
        return ecv
    }()
    lazy var senhaContainerView: UIView = {
        let cadeadoImage = UIImage(named: "cadeado")
        let ecv = Utilities().imputContainerView(imagem: cadeadoImage, textField: senhaTextField, divColor: .systemPink)
        return ecv
    }()
    lazy var nomeContainerView: UIView = {
        let pessoaImage = UIImage(named: "pessoa")
        let ecv = Utilities().imputContainerView(imagem: pessoaImage, textField: nomeTextField, divColor: .systemPink)
        return ecv
    }()
    let emailTextField: UITextField = {
        let etf = Utilities().myTextField(myplaceholder: "Email", myPlaceHolderColor: .systemPink, myTextColor: .systemPink)
        return etf
    }()
    let senhaTextField: UITextField = {
        let etf = Utilities().myTextField(myplaceholder: "Senha", myPlaceHolderColor: .systemPink, myTextColor: .systemPink)
        etf.isSecureTextEntry = true
        return etf
    }()
    let nomeTextField: UITextField = {
        let etf = Utilities().myTextField(myplaceholder: "Nome", myPlaceHolderColor: .systemPink, myTextColor: .systemPink)
        return etf
    }()
    
    lazy var registroStackView: UIStackView = {
        let rstv = Utilities().configStackView(eixo: .vertical, espacoEntreViews: 20, views: [emailContainerView, senhaContainerView, nomeContainerView])
        return rstv
    }()
    
    lazy var registroButton: UIButton = {
        let rbt = Utilities().myButton(titulo: "Registrar-se", backgroundColor: .systemPink, tituloColor: .white)
        rbt.addTarget(self, action: #selector(actionRegistrarse), for: .touchUpInside)
        return rbt
    }()
    
    // MARK: - Funções  SetUp
    
    func configUI(){
        view.backgroundColor = .systemPink
    }
    func SetUpImagePiker(){
        imagePiker.delegate = self
        imagePiker.allowsEditing = true
    }
    func setUpTextFieldsDelegates(delegate: UITextFieldDelegate){
        emailTextField.delegate = delegate
        senhaTextField.delegate = delegate
        nomeTextField.delegate = delegate
    }
    func setUpAllElements(){
        view.addSubview(customBotttomImageView)
        view.addSubview(registroStackView)
        view.addSubview(registroButton)
        view.addSubview(addImageButton)
    }

    func setUpConstraints(){
        customBotttomImageView.centerX(inView: view, topAnchor: view.safeAreaLayoutGuide.topAnchor, paddingTop: 80)
        customBotttomImageView.setDimensions(width: 800, height: 800)
        
        addImageButton.centerX(inView: view, topAnchor: view.safeAreaLayoutGuide.topAnchor, paddingTop: 20)
        
        registroStackView.anchor(top: addImageButton.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor, paddingTop: 60, paddingLeft: 16, paddingRight: 16)
        registroButton.centerX(inView: view, topAnchor: registroStackView.bottomAnchor, paddingTop: 60)

    }
    // MARK: - Funções Target

    @objc func actionBack(){
        navigationController?.pushViewController(FirsController(), animated: true)
    }
    
    @objc func actionAddImage(){
        present(imagePiker, animated: true, completion: nil)
    }
    
    @objc func actionRegistrarse(){
        guard let profileImage = profileImage else {
            print("DEBUG: Por favor selecione uma imagem de perfil")
            return
        }
        guard let email = emailTextField.text else {return}
        guard let senha = senhaTextField.text else {return}
        guard let nome = nomeTextField.text else {return}
        Auth.auth().createUser(withEmail: email, password: senha) { result, error in
            if let error = error {
                print("Debug mensagem de erro: \(error .localizedDescription)")
                return
            }
            print("Registrado com sucesso")
        }
    }
    
    // MARK: - Ciclos de Vida
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configUI()
        setUpAllElements()
        setUpConstraints()
        SetUpImagePiker()
        setUpTextFieldsDelegates(delegate: self)
    }
}
    
extension RegistroController: UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let profileImage = info[.editedImage] as? UIImage else {return}
        self.profileImage = profileImage
        addImageButton.layer.cornerRadius = 140 / 2
        addImageButton.layer.masksToBounds = true
        addImageButton.imageView?.clipsToBounds = true
        addImageButton.imageView?.contentMode = .scaleAspectFill
        addImageButton.layer.borderColor = UIColor.white.cgColor
        addImageButton.layer.borderWidth = 3
        self.addImageButton.setImage(profileImage.withRenderingMode(.alwaysOriginal), for: .normal)
        dismiss(animated: true, completion: nil )
    }
}

extension RegistroController: UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
    }
}
