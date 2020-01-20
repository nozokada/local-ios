//
//  ItemVC.swift
//  local
//
//  Created by Nozomi Okada on 12/15/19.
//  Copyright © 2019 RIR. All rights reserved.
//

import UIKit
import Firebase

class ItemVC: UIViewController {

    @IBOutlet weak var itemImageView: UIImageView!
    @IBOutlet weak var itemTitleLabel: UILabel!
    @IBOutlet weak var itemPriceLabel: ItemPriceLabel!
    @IBOutlet weak var itemDescriptionLabel: UILabel!
    @IBOutlet weak var askButton: MainButton!
    
    var item: Item!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        item.photo.download() { (image) in
            self.itemImageView.image = image
        }
        itemTitleLabel.text = item.title
        itemPriceLabel.text = " \(CURRENCY_SYMBOL)\(item.price) "
        itemDescriptionLabel.text = item.description
        
        itemPriceLabel.layer.cornerRadius = 5
        itemPriceLabel.clipsToBounds = true
    }
    
    func initData(item: Item) {
        self.item = item
    }
    
    func openMessageVC(offer: Offer, item: Item) {
        if let messageVC = self.storyboard?.instantiateViewController(withIdentifier: "MessageVC") as? MessageVC {
            messageVC.initData(offer: offer, item: self.item, receipient: offer.to)
            self.present(messageVC, animated: true, completion: nil)
        }
        askButton.enable()
    }
    
    @IBAction func askButtonTapped(_ sender: Any) {
        guard let userId = Auth.auth().currentUser?.uid else { return }
        if item.createdBy == userId {
            debugPrint("You can't make an offer for your item (display alert)")
            return
        }
        askButton.disable()
        DataService.shared.getOffers(type: FROM, userId: userId) { offers, error in
            for offer in offers {
                if offer.itemId == self.item.id {
                    self.openMessageVC(offer: offer, item: self.item)
                    return
                }
            }
            let id = UUID().uuidString
            let offer = Offer(id: id, itemId: self.item.id, to: self.item.createdBy, from: userId)
            self.openMessageVC(offer: offer, item: self.item)
        }
    }
}
