//
//  CardThemeViewController.swift
//  MatchCards
//
//  Created by Deepankar D on 18/05/20.
//  Copyright © 2020 Neha. All rights reserved.
//

import UIKit

class CardThemeViewController: UIViewController, UISplitViewControllerDelegate{
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        // Do any additional setup after loading the view.
//    }
//
    var themes = [
        "Faces" : "😁🥳😆😇🤪😎😳🤕",
        "Food" : "🥦🍤🍔🍳🌶🌽🍕🍞🥭",
        "Symbols" : "❤️✝️🆔💔💞⚠️🅿️♣️🔷",
        "Animals" : "🐶🐳🐝🦎🦖🐣🐕🦍🐉🌲"
    ]
    
    override func awakeFromNib() {
        super.awakeFromNib()
        splitViewController?.delegate = self
    }
    
    func splitViewController(_ splitViewController: UISplitViewController, collapseSecondary secondaryViewController: UIViewController, onto primaryViewController: UIViewController) -> Bool {
        if let cvc = secondaryViewController as? ViewController{
            if cvc.theme == nil {
                return true
            }
        }
        return false
    }
    
    
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let identifier = segue.identifier{
            if let destinationVC = segue.destination as? ViewController{
                if let theme = themes[identifier]{
                    destinationVC.theme = theme
                }else{
                    print("Identifier is not present")
                }
            }
        }
    }
    

}
