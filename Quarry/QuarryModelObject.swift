//
//  QuarryModelObject.swift
//  Quarry
//
//  Created by Venkat on 31/05/16.
//  Copyright © 2016 NTT DATA. All rights reserved.
//

import UIKit

class QuarryModelObject: NSObject {
    var topicTitle : String
    var topicImageName : String
    var topicDetailText : NSMutableAttributedString

    init?(topicTitle : String,topicImageName : String,topicDetailText : NSMutableAttributedString) {
        self.topicTitle = topicTitle
        self.topicImageName = topicImageName
        self.topicDetailText = topicDetailText
        if topicTitle.isEmpty || topicImageName.isEmpty || topicDetailText.string.isEmpty {
            return nil
        }
    }
}

