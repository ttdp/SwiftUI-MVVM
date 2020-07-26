//
//  ImageLoader.swift
//  SwiftUI-MVVM
//
//  Created by Tian Tong on 7/26/20.
//  Copyright © 2020 TTDP. All rights reserved.
//

import Foundation
import Combine
import UIKit

class ImageLoader: ObservableObject {
    
    let url: URL
    
    @Published var image: UIImage?
    
    private var cancellable: AnyCancellable?
    
    init(url: URL) {
        self.url = url
        
        fetchImage()
    }
    
    func fetchImage() {
        cancellable = URLSession.shared.dataTaskPublisher(for: url)
            .map { UIImage(data: $0.data) }
            .replaceError(with: nil)
            .receive(on: RunLoop.main)
            .assign(to: \.image, on: self)
    }
    
}
