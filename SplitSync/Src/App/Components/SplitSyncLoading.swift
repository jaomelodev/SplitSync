//
//  SplitSyncLoading.swift
//  SplitSync
//
//  Created by João Melo on 15/09/24.
//

import SwiftUI
import SwiftfulLoadingIndicators

struct SplitSyncLoading: View {
    let color: Color
    let size: LoadingIndicator.Size

    init(
        color: Color = .textWhite,
        size: LoadingIndicator.Size = .medium
    ) {
        self.color = color
        self.size = size
    }

    var body: some View {
        LoadingIndicator(
            animation: .fiveLines,
            color: color,
            size: size
        )
    }
}

#Preview {
    SplitSyncLoading()
        .padding()
        .background(Color.accentColor)
}
