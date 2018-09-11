//
//  GCDBlackBox.swift
//
//  Created by Anurita Srivastava on 11/3/16.
//  Copyright © 2016 Udacity. All rights reserved.
//

import Foundation

func performUIUpdatesOnMain(_ updates: @escaping () -> Void) {
    DispatchQueue.main.async {
        updates()
    }
}
