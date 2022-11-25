//
//  GiftGuideFiveScrollView.swift
//  GiftHub
//
//  Created by TinkerTanker on 25/11/22.
//

import SwiftUI

struct GiftGuideFiveScrollView: View {
    var body: some View {
        VStack {
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(alignment: .top, spacing: 16) {
                    ForEach(GGgiftsfive) { num in
                        GeometryReader { proxy in
                            let scale = getScale(proxy: proxy)
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
                                    .foregroundColor(.black)
                        }
                        .scaleEffect(.init(width: scale, height: scale))
                        .animation(.easeOut(duration: 1))
                        .padding(.vertical)
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

struct GiftGuideFiveScrollView_Previews: PreviewProvider {
    static var previews: some View {
        GiftGuideFiveScrollView()
    }
}
