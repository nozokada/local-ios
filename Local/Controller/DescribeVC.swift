//
//  DescribeVC.swift
//  local
//
//  Created by Nozomi Okada on 12/19/19.
//  Copyright © 2019 RIR. All rights reserved.
//

import UIKit

class DescribeVC: UIViewController {

    @IBOutlet weak var descriptionTextView: UITextView!
    @IBOutlet weak var priceTextField: MainTextField!
    @IBOutlet weak var nextButton: MainButton!
    
    var itemImage: UIImage!
    var itemTitle: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        checkRequiredFields()
    }
    
    func initData(image: UIImage, title: String) {
        itemTitle = title
        itemImage = image
    }
    
    @IBAction func priceTextFieldEditingDidEnd(_ sender: Any) {
        checkRequiredFields()
    }
    
    func checkRequiredFields() {
        if priceTextField.text != "" {
            nextButton.enable()
        } else {
            nextButton.disable()
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let reviewPostVC = segue.destination as? ReviewVC {
            let itemPrice = priceTextField.text!
            reviewPostVC.initData(image: itemImage,
                                  title: itemTitle,
                                  description: descriptionTextView.text,
                                  price: itemPrice)
        }
    }
}
