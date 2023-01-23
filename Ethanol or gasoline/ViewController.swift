//
//  ViewController.swift
//  Ethanol or gasoline
//
//  Created by Jauri da Cruz Junior on 23/01/23.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var resultadoLegenda: UILabel!
    @IBOutlet weak var precoAlcoolCampo: UITextField!
    @IBOutlet weak var precoGasolinaCampo: UITextField!
    
    
    @IBAction func calcularCombustivel(_ sender: Any) {
        
        if let precoAlcool = precoAlcoolCampo.text {
            if let precoGasolina = precoGasolinaCampo.text {
                
                // validar valores digitados
                let validaCampos = self.validarCampos(precoAlcool: precoAlcool, precoGasolina: precoGasolina)
                
                if validaCampos {
                    
                    //calcula melhor combustível
                    self.calcularMelhorPreco(precoAlcool: precoAlcool, precoGasolina: precoGasolina)
                    
                } else {
                    self.resultadoLegenda.text = "Digite os preços para calcular!"
                }
            }
        }
    
        
    }
    
    func validarCampos(precoAlcool: String, precoGasolina: String) -> Bool {
        return !precoAlcool.isEmpty && !precoGasolina.isEmpty
    }
    
    func calcularMelhorPreco(precoAlcool: String, precoGasolina: String) {
        
        if let valorAlcool = Double(precoAlcool) {
            if let valorGasolina = Double(precoGasolina) {
                
                let resultadoPreco = valorAlcool / valorGasolina
                
                if resultadoPreco >= 0.7 {
                    
                    self.resultadoLegenda.text = "Melhor utilizar Gasolina!"
                } else {
                    self.resultadoLegenda.text = "Melhor utilizar Alcool!"
                    
                }
            }
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

