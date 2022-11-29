//
//  GiftGuideFourScrollView.swift
//  GiftHub
//
//  Created by TinkerTanker on 25/11/22.
//

import SwiftUI

struct GiftGuideFourScrollView: View {
    
    @Environment(\.colorScheme) var currentMode
    
    var body: some View {
        VStack {
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(alignment: .top, spacing: 16) {
                    ForEach(GGgiftsfour) { num in
                        GeometryReader { proxy in
                            let scale = getScale(proxy: proxy)
                            withAnimation {
                                VStack(spacing: 8) {
                                    Image(num.imageName)
                                        .resizable()
                                     //   .scaledToFill()
                                        .frame(width: 300)
                                        .clipped()
                                        .cornerRadius(8)
                                        .overlay (
                                            RoundedRectangle(cornerRadius: 8)
                                                .stroke(Color(white: 0.4))
                                            )
                                        //      .shadow(radius: 3)
                                    Text(num.title)
                                        .font(.system(size: 16, weight: .semibold))
                                        .multilineTextAlignment(.center)
                                        .foregroundColor(currentMode == .dark ? Color.white : Color.black)
                            }
                            .scaleEffect(.init(width: scale, height: scale))
                            .padding(.vertical)
                            }
                    }
                    .frame(width: 270, height: 420)
                    .padding(.horizontal, 32)
                    .padding(.vertical, 32)
                }
                Spacer()
                    .frame(width: 0)
                }
            }
        }
    }
    func getScale(proxy: GeometryProxy) -> CGFloat {
        let midPoint: CGFloat = 125
        let viewFrame = proxy.frame(in: CoordinateSpace.global)
        var scale: CGFloat = 1.0
        let deltaXAnimationThreshold: CGFloat = 125
            
        let diffFromCenter = abs(midPoint - viewFrame.origin.x - deltaXAnimationThreshold / 2)
        if diffFromCenter < deltaXAnimationThreshold {
                scale = 1 + (deltaXAnimationThreshold - diffFromCenter) / 500
        }
        return scale
    }
}

struct GiftGuideFourScrollView_Previews: PreviewProvider {
    static var previews: some View {
        GiftGuideFourScrollView()
    }
}
