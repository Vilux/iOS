import UIKit
import Firebase

class LoginViewController: UIViewController {
    
    @IBOutlet weak var emailLoginText: UITextField!
    @IBOutlet weak var passwordLoginText: UITextField!
    
    @IBAction func loginTapped(_ sender: UIButton) {
        if let email = emailLoginText.text, let password = passwordLoginText.text {
            Auth.auth().signIn(withEmail: email, password: password) { (_, error) in
                if let err = error {
                    // there was an error, print it
                    print(err)
                } else {
                    // successfully logged in user
                    print("successfully logged in user " + email)
                    self.performSegue(withIdentifier: "showChat", sender: self)
                }
            }
        }
    }
}
