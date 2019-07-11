import UIKit
import Firebase

class RegistrationViewController: UIViewController {
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBAction func registerButtonTapped(_ sender: UIButton) {
        if let email = emailTextField.text, let password = passwordTextField.text {
            Auth.auth().createUser(withEmail: email, password: password) { (_, error) in
                if let err = error {
                    // there was an error, print it
                    print(err)
                } else {
                    // successfully created user
                    print("successfully created user " + email)
                    self.performSegue(withIdentifier: "showChat", sender: self)
                }
            }
        }
    }
}
