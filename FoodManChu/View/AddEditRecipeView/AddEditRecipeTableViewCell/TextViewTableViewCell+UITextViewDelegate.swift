//
//  TextViewTableViewCell+UITextViewDelegate.swift
//  FoodManChu
//
//  Created by Julian Worden on 7/23/22.
//

import Foundation
import UIKit

extension TextViewTableViewCell: UITextViewDelegate {
    func textViewDidChange(_ textView: UITextView) {
        switch textView {
        case detailsTextView:
            detailsTextViewChanged()
        case instructionsTextView:
            instructionsTextViewChanged()
        default:
            break
        }
    }
}
