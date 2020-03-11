//
//  ViewController.swift
//  loginView
//
//  Created by DAN on 28.01.2020.
//  Copyright © 2020 DAN. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var firstDot: DotForLoading!
    @IBOutlet weak var secondDot: DotForLoading!
    @IBOutlet weak var thirdDot: DotForLoading!
    
    @IBOutlet weak var login: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var scrollView: UIScrollView!
    
    override  func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.firstDot.alpha = 1.0
        self.secondDot.alpha = 1.0
        self.thirdDot.alpha = 1.0
        dotDansing()
        
        // Подписываемся на два уведомления: одно приходит при появлении клавиатуры
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWasShown), name: UIResponder.keyboardWillShowNotification, object: nil)
        // Второе — когда она пропадает
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillBeHidden(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil)
        
    }
    
    private func dotDansing(y: CGFloat = 10, alpha: CGFloat = 0.1){
        UIView.animate(withDuration: 1.0, delay: 0, options: [.repeat, .autoreverse], animations: {
            self.firstDot.frame.origin.y += y
            self.firstDot.alpha = alpha
        })
        UIView.animate(withDuration: 1.0, delay: 0.5, options: [.repeat, .autoreverse], animations: {
            self.secondDot.frame.origin.y += y
            self.secondDot.alpha = alpha
        })
        UIView.animate(withDuration: 1.0, delay: 1, options: [.repeat, .autoreverse], animations: {
            self.thirdDot.frame.origin.y += y
            self.thirdDot.alpha = alpha
        })
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Жест нажатия
        let hideKeyboardGesture = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        // Присваиваем его UIScrollVIew
    scrollView?.addGestureRecognizer(hideKeyboardGesture)
    }
    
    @objc func keyboardWasShown(notification: Notification) {
        
        // Получаем размер клавиатуры
        let info = notification.userInfo! as NSDictionary
        let kbSize = (info.value(forKey: UIResponder.keyboardFrameEndUserInfoKey) as! NSValue).cgRectValue.size
        let contentInsets = UIEdgeInsets(top: 0.0, left: 0.0, bottom: kbSize.height, right: 0.0)
        
        // Добавляем отступ внизу UIScrollView, равный размеру клавиатуры
        self.scrollView?.contentInset = contentInsets
        scrollView?.scrollIndicatorInsets = contentInsets
    }
    
    //Когда клавиатура исчезает
    @objc func keyboardWillBeHidden(notification: Notification) {
        // Устанавливаем отступ внизу UIScrollView, равный 0
        let contentInsets = UIEdgeInsets.zero
        scrollView?.contentInset = contentInsets
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc func hideKeyboard() {
        self.scrollView?.endEditing(true)
    }
    
    @IBAction func btnTapp(_ sender: UIButton){
        print(#function)
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        // Проверяем данные
        let checkResult = checkUserData()
        
        // Если данные не верны, покажем ошибку
        if !checkResult {
            showLoginError()
        }
        
        // Вернем результат
        return checkResult
    }
    
    func checkUserData() -> Bool {
        guard let ownLogin = login.text,
            let ownPassword = password.text else { return false }
        
        if ownLogin == "admin" && ownPassword == "admin" {
            return true
        } else {
            return false
        }
    }
    
    func showLoginError() {
        // Создаем контроллер
        let alter = UIAlertController(title: "Ошибка", message: "Введены не верные данные пользователя", preferredStyle: .alert)
        // Создаем кнопку для UIAlertController
        let action = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        // Добавляем кнопку на UIAlertController
        alter.addAction(action)
        // Показываем UIAlertController
        present(alter, animated: true, completion: nil)
    }




}

