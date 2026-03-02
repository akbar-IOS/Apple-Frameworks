//
//  FrameworkDetailModelView.swift
//  SwifUI-Framework
//
//  Created by Akbar Abdullo on 2/24/26.
//

import SwiftUI
import Combine

final class FrameworkGridViewModel: ObservableObject {
    
    var selectedFramework: Framework? {
        didSet{
            isShowingFrameworkDetail = true
        }
    }
    @Published var isShowingFrameworkDetail = false
    
}
