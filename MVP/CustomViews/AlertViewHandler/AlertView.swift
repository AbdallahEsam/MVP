//
//  AlertView.swift
//  MVP
//
//  Created by Abdallah Esam on 09/04/2021.
//


import UIKit

class AlertView: UIView {
    
    private let imageView = UIImageView()
    private let messageLable = UILabel()
    
     var message: String
     var type: AllertThemes
    
    init(message: String, title: AllertThemes) {
        self.message = message
        self.type = title
        super.init(frame: .zero)
        setup()
    }
    
    private func setup() {
        switch type {
            case .success:
                imageView.image = #imageLiteral(resourceName: "success")
                backgroundColor = #colorLiteral(red: 0.4392156863, green: 0.6235294118, blue: 0.2078431373, alpha: 1)
            case .warning:
                backgroundColor = #colorLiteral(red: 0.9019607843, green: 0.7490196078, blue: 0.2823529412, alpha: 1)
                imageView.image = #imageLiteral(resourceName: "Info")
            case .error:
                backgroundColor = #colorLiteral(red: 1, green: 0.1491314173, blue: 0, alpha: 1)
                imageView.image = #imageLiteral(resourceName: "error")
        }
        
        imageView.tintColor = .white
        messageLable.textColor = .white
        messageLable.text = message
        messageLable.numberOfLines = 2
        messageLable.font = .systemFont(ofSize: 14)
        
        let swipeToTop = UISwipeGestureRecognizer(target: self, action: #selector(handelGesture(_:)))
        swipeToTop.direction = .up
        
        addGestureRecognizer(swipeToTop)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            self.closeMe()
        }
    }
    
    @objc
    private func handelGesture(_ sender: UISwipeGestureRecognizer) {
        closeMe()
    }
    
    private func closeMe() {
        UIView.animate(withDuration: 0.5, animations: {
            self.transform = .init(translationX: 0, y: -1000)
        }) { (_) in
            self.removeFromSuperview()
        }
    }
    

    
     func layout() {
        messageOnlyLayOut()
    }
    
    func messageOnlyLayOut(){
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 20 / 2
        imageView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(imageView)
        
        NSLayoutConstraint.activate([
            imageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            imageView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -15),
            imageView.widthAnchor.constraint(equalToConstant: 20),
            imageView.heightAnchor.constraint(equalToConstant: 20)
        ])
        
        messageLable.translatesAutoresizingMaskIntoConstraints = false
        addSubview(messageLable)
        NSLayoutConstraint.activate([
            messageLable.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            messageLable.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -15),
            messageLable.trailingAnchor.constraint(equalTo: imageView.leadingAnchor, constant: 10)
        ])
        
        transform = .init(translationX: 0, y: -1000)
        alpha = 1
        
        UIView.animate(withDuration: 0.5) {
            self.transform = .identity
          
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            switch self.type {
            case .success:
                UINotificationFeedbackGenerator().notificationOccurred(.success)
            case .warning:
                UINotificationFeedbackGenerator().notificationOccurred(.warning)
            case .error:
                UINotificationFeedbackGenerator().notificationOccurred(.error)
            }
        }
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
