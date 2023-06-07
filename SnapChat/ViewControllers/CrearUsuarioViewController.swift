//
//  CrearUsuarioViewController.swift
//  Pods
//
//  Created by Aldo on 7/06/23.
//

import UIKit
import FirebaseAuth
import FirebaseDatabase

class CrearUsuarioViewController: UIViewController {

    @IBOutlet weak var crearCorreo: UITextField!
    @IBOutlet weak var crearPass: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func crearUs(_ sender: Any) {
        Auth.auth().createUser(withEmail: self.crearCorreo.text!, password: self.crearPass.text!, completion: {(user, error) in print ("Intentando crear un usuario")
            
            if error != nil{
                print("Se presento el siguiente erro al crear el usuario: \(error)")
            } else {
                print("El usuario fue creado exitosamente")
                
                Database.database().reference().child("usuarios").child(user!.user.uid).child("email").setValue(user!.user.email)
                let alerta = UIAlertController(title: "Creacion de Usuario", message: "Usuario: \(self.crearCorreo.text!)", preferredStyle: .alert)
                let btnOK = UIAlertAction(title:"Aceptar", style:.default, handler:{(UIAlertAction) in self.performSegue(withIdentifier: "iniciarsesionsegue", sender: nil)})
                alerta.addAction(btnOK)
                self.present(alerta, animated: true, completion: nil)
            }
        })
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
