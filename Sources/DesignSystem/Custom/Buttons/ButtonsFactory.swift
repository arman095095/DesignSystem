//
//  File.swift
//  
//
//  Created by Арман Чархчян on 03.05.2022.
//

import UIKit

public final class ButtonsFactory {
    
    public static var whiteSettingsButton: UIButton {
        UIButton(backgroundColor: .white,
                 titleColor: #colorLiteral(red: 0.4174995422, green: 0.2606979012, blue: 0.7359834313, alpha: 1),
                 font: UIFont.avenir19(),
                 shadow: true,
                 cornerRaduis: UIButton.Constants.cornerRaduis,
                 height: UIButton.Constants.height,
                 shadowColor: #colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1))
    }
    
    public static var blackLoadButton: LoadButton {
        LoadButton(backgroundColor: .buttonDark(),
                   titleColor: .mainWhite(),
                   font: UIFont.avenir20(),
                   shadow: false,
                   cornerRaduis: 4,
                   height: 60,
                   activityColor: .white,
                   shadowColor: nil)
    }
    
    public static var whiteLoadButton: LoadButton {
        LoadButton(backgroundColor: .white,
                   titleColor: .buttonRed(),
                   font: UIFont.avenir19(),
                   shadow: true,
                   cornerRaduis: UIButton.Constants.cornerRaduis,
                   height: UIButton.Constants.height,
                   activityColor: .black,
                   shadowColor: #colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1))
    }
    
    public static var whiteDefaultButton: UIButton {
        UIButton(backgroundColor: .white,
                 titleColor: .buttonRed(),
                 font: UIButton.Constants.font,
                 shadow: true,
                 cornerRaduis: UIButton.Constants.cornerRaduis,
                 height: UIButton.Constants.height,
                 shadowColor: nil)
    }
    
    public static var blackDefaultButton: UIButton {
        UIButton(backgroundColor: .buttonDark(),
                 titleColor: .white,
                 font: UIButton.Constants.font,
                 shadow: false,
                 cornerRaduis: UIButton.Constants.cornerRaduis,
                 height: UIButton.Constants.height,
                 shadowColor: nil)
    }
    
    public static var acceptButton: UIButton {
        UIButton(backgroundColor: .mainWhite(),
                 titleColor: .mainWhite(),
                 font: UIFont.avenir26(),
                 shadow: false,
                 cornerRaduis: UIButton.Constants.cornerRaduis2,
                 height: UIButton.Constants.height,
                 shadowColor: nil)
    }
    
    public static var denyButton: UIButton {
        UIButton(backgroundColor: .mainWhite(),
                 titleColor: .buttonRed(),
                 font: UIFont.avenir26(),
                 shadow: false,
                 cornerRaduis: UIButton.Constants.cornerRaduis2,
                 height: UIButton.Constants.height,
                 shadowColor: nil)
    }
}
