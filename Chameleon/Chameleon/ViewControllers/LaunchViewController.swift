//
//  LaunchViewController.swift
//  Chameleon
//
//  Created by 유정주 on 2022/03/29.
//

import UIKit
import Lottie
import SnapKit

class LaunchViewController: UIViewController {
    
    //MARK: - Views
    let logoImage: UIImageView = UIImageView()
    lazy var animationView: AnimationView = {
        UITraitCollection.current.userInterfaceStyle == .light ? .init(name: "bottomImage-Light")
                                                               : .init(name: "bottomImage-Dark")
    }()

    
    //MARK: - Life Cycles
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.backgroundColor
        
        setupLogoImage()
        setupBottomView()
        
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 2) {
            self.logoImage.snp.remakeConstraints { make in
                make.height.equalTo(self.view.frame.height * 0.1)
                make.top.equalTo(self.view.safeAreaLayoutGuide).offset(40)
                make.right.equalToSuperview().offset(-40)
                make.left.equalToSuperview().offset(40)
            }
            
            UIView.animate(withDuration: 0.3, animations: { [weak self] in
                self?.animationView.isHidden = true
                self?.view.layoutIfNeeded()
            })
        }
        
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 2.3) {
            self.dismiss(animated: false, completion: {
                let loginVC = LoginViewController()
                loginVC.modalPresentationStyle = .fullScreen
                self.present(loginVC, animated: false, completion: nil)
            })
        }
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("\(#fileID) \(#line)-line, \(#function)")
    }
    
    //MARK: - Methods
    private func setupLogoImage() {
        logoImage.image = UIImage(named: "LogoImage")
        logoImage.contentMode = .scaleAspectFit
        
        view.addSubview(logoImage)
        logoImage.snp.makeConstraints { make in
            make.height.equalTo(view.frame.height * 0.1)
            make.centerY.equalToSuperview().offset(-20)
            make.right.equalToSuperview().offset(-40)
            make.left.equalToSuperview().offset(40)
        }
    }
    
    private func setupBottomView() {
        animationView.contentMode = .scaleAspectFill
        animationView.loopMode = .loop
        animationView.animationSpeed = 1.2
        animationView.play()
        
        view.addSubview(animationView)
        animationView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.width.equalTo(view.frame.width)
            make.height.equalTo(180)
            make.bottom.equalTo(view.snp.bottom).offset(20)
        }
    }
}
