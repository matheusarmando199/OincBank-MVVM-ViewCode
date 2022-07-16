//
//  Utilities.swift
//  OincBank
//
//  Created by Matheus Armando on 16/07/22.
//

import UIKit

class Utilities{
  
    
    func imputContainerView(imagem: UIImage?, textField: UITextField) -> UIView{
        let ecv = UIView()
        ecv.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        let ive = UIImageView()
        ive.image = imagem
        
        ecv.addSubview(ive)
        ive.anchor(left: ecv.leftAnchor, bottom: ecv.bottomAnchor, paddingLeft: 8, paddingBottom: 8)
        ive.setDimensions(width: 24, height: 24)
        
        ecv.addSubview(textField)
        textField.anchor(left: ive.rightAnchor, bottom: ecv.bottomAnchor, right: ecv.rightAnchor, paddingLeft: 8, paddingBottom: 8)
        
        let div = UIView()
        div.backgroundColor = .white
        
        ecv.addSubview(div)
        div.anchor(left: ecv.leftAnchor, bottom: ecv.bottomAnchor, paddingLeft: 8, height: 1)
        div.anchor(top: ive.bottomAnchor, left: ecv.leftAnchor, right: ecv.rightAnchor, paddingTop: 5, height: 0.75)
        return ecv
    }
    
    func myTextField(myplaceholder: String) -> UITextField{
        let etf = UITextField()
        etf.placeholder = myplaceholder
        etf.textColor = .white
        etf.font = UIFont.systemFont(ofSize: 16)
        etf.attributedPlaceholder = NSAttributedString(string: myplaceholder, attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
        return etf
    }
    
    func myButton(titulo: String, backgroundColor: UIColor, tituloColor:UIColor) -> UIButton{
        let lb = UIButton()
        lb.backgroundColor = backgroundColor
        lb.setTitle(titulo, for: .normal)
        lb.titleLabel?.font = UIFont.boldSystemFont(ofSize: 25)
        lb.setTitleColor(tituloColor, for: .normal)
        lb.layer.cornerRadius = 10
        lb.setDimensions(width: 300, height: 50)
        return lb
    }
    
    func configStackView(eixo: NSLayoutConstraint.Axis, espacoEntreViews: CGFloat, views: [UIView] ) -> UIStackView{
        let stackView = UIStackView(arrangedSubviews: views)
        stackView.axis = eixo
        stackView.spacing = espacoEntreViews
        return stackView
    }
}
