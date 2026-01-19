//
//  CoverImageView.swift
//  SriLankaNature
//
//  Created by Naleen Dissanayake on 2026/01/16.
//

import SwiftUI

struct CoverImageView: View {
    // MARK: Properties
    
    let coverImages: [CoverImageModel] = Bundle.main.decode("covers.json")
    
    var body: some View {
        TabView {
            ForEach(coverImages) { image in
                Image(image.name)
                    .resizable()
                    .scaledToFill()
            }
        }
        .tabViewStyle(.page)
    }
}

#Preview(traits: .fixedLayout(width: 400, height: 300)) {
    CoverImageView()
}
