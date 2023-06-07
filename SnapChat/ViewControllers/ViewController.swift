//
//  ViewController.swift
//  SnapChat
//
//  Created by Aldo on 31/05/23.
//

import UIKit
import FirebaseCore
import FirebaseAuth
import FirebaseDatabase
//import GoogleSignIn
//import GoogleSignInSwift


class iniciarSesionViewController: UIViewController {

    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        

    }

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        FirebaseApp.configure()
        
        return true
    }
    //func application(_ app: UIApplication,
      //               open url: URL,
        //             options: [UIApplication.OpenURLOptionsKey: Any] = [:]) -> Bool {
      //return GIDSignIn.sharedInstance.handle(url)
    //}
    
    @IBAction func iniciarSesionTapped(_ sender: Any) {
        Auth.auth().signIn(withEmail: emailTextField.text!, password: passwordTextField.text!){(user, error) in
            print("Intentando Iniciar Sesion")
            if error != nil {
                print("Se presento el siguiente error: \(error)")
                self.alertaCreacion()
                
                
            } else {
                print ("Inicio de sesion exitoso")
                self.performSegue(withIdentifier: "iniciarsesionsegue", sender: nil)
            }
        }

    }
    
    
    //func sign(_ signIn: GIDSignIn, didSignInFor user: GIDGoogleUser, withError error: Error?) {
        
   // }
    func alertaCreacion (){
        let alertaUsuario = UIAlertController(title: "Crea un usuario", message: "Error", preferredStyle: .alert)
        //let btnCrear = UIAlertAction(title: "Crear", style: .default, handler: nil)
        //alertaUsuario.addAction(btnCrear)
        //present(alertaUsuario, animated: true, completion: nil)
        let redirectAction = UIAlertAction(title:"Crear", style: .default){ _ in
            let crearUsuario = CrearUsuarioViewController()
            self.navigationController?.pushViewController(crearUsuario, animated: true)
        }
        alertaUsuario.addAction(redirectAction)
        let btnCancelar = UIAlertAction(title: "Cancelar", style: .cancel, handler: nil)
        alertaUsuario.addAction(btnCancelar)
        present(alertaUsuario, animated: true, completion: nil)
    }
    @IBAction func loginGithub(_ sender: Any) {
        //guard let clientID = FirebaseApp.app()?.options.clientID else { return }

        //// Create Google Sign In configuration object.
        //let config = GIDConfiguration(clientID: clientID)
        //GIDSignIn.sharedInstance.configuration = config

        //// Start the sign in flow!
        //GIDSignIn.sharedInstance.signIn(withPresenting: self) { [unowned self] result, error in
        //  guard error == nil else {
        //    return
        //  }

        //  guard let user = result?.user,
        //    let idToken = user.idToken?.tokenString
        //  else {
        //    return
        //  }

        //  let credential = GoogleAuthProvider.credential(withIDToken: idToken,
        //                                                 accessToken: user.accessToken.tokenString)

        //    Auth.auth().signIn(with: credential) { result, error in

        //      // At this point, our user is signed in
        //    }
        //}
        
    }
    
}

