//
//  OnboardingDataModel.swift
//  Stack-UI
//
//  Created by Adinlewa Olutayo on 22/06/2024.
//

import Foundation
import SwiftUI

struct OnboardingData: Identifiable {
    var id = UUID()
    var title: String
    var text: String
    var img: String
    var bgColor: Color

}
