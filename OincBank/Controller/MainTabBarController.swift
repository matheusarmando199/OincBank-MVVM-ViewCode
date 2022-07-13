//
//  MainTabBarController.swift
//  OincBank
//
//  Created by Matheus Armando on 11/07/22.
//

import UIKit

class MainTabBarController: UITabBarController {

    
    // MARK: - Elementos
    

    
    
    
    // MARK: - Funções SetUp
    
    func configViewController(){
        
        let home = HomeController()
        home.title = "Home"
        let homenav = navigationControllerTemplate(image: UIImage(named: "casa"), nossaroot: home)

        let cartoes = CartoesContoller()
        cartoes.title = "Cartões"
        let cartoesnav = navigationControllerTemplate(image: UIImage(named: "cartao"), nossaroot: cartoes)
        
        let loja = LojaController()
        loja.title = "OincStore"
        let lojanav = navigationControllerTemplate(image: UIImage(named: "loja"), nossaroot: loja)
        
        viewControllers = [homenav, cartoesnav, lojanav]
        
        tabBar.isTranslucent = false
        let aparenciTabBar = UITabBarAppearance()
        aparenciTabBar.backgroundColor = .white
        
        UITabBar.appearance().tintColor = .systemPink
        if #available(iOS 15, *){
            UITabBar.appearance().scrollEdgeAppearance = aparenciTabBar
        }
    }
    
    func navigationControllerTemplate(image: UIImage?, nossaroot: UIViewController) ->
    UINavigationController{
        let nav = UINavigationController(rootViewController: nossaroot)
        nav.tabBarItem.image = image
        nav.navigationBar.isTranslucent = false
        
        let aparenciaNavBar = UINavigationBarAppearance()
        aparenciaNavBar.backgroundColor = .white
        
        
        if #available(iOS 15, *){
            UINavigationBar.appearance().scrollEdgeAppearance = aparenciaNavBar
            
        }
        
        return nav
    }
    
    
    // MARK: - Ciclos de Vida
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configViewController()
        
    }

}
