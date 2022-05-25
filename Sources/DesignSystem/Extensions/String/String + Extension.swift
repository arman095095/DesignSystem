//
//  File.swift
//  
//
//  Created by Арман Чархчян on 25.05.2022.
//

import UIKit

extension String {
    
    public func height(width: CGFloat, font: UIFont) -> CGFloat {
        let textSize = CGSize(width: width, height: .greatestFiniteMagnitude)
        let size = self.boundingRect(with: textSize,
                                     options: .usesLineFragmentOrigin,
                                     attributes: [NSAttributedString.Key.font : font],
                                     context: nil)
        return ceil(size.height)
    }
    
    public func width(font: UIFont) -> CGFloat {
        let textSize = CGSize(width: .greatestFiniteMagnitude,
                              height: font.lineHeight )
        
        let size = self.boundingRect(with: textSize,
                                     options: .usesLineFragmentOrigin,
                                     attributes: [NSAttributedString.Key.font : font],
                                     context: nil)
        return ceil(size.width)
    }
    
}
