//
//  OnboardingView.swift
//  GiftHub
//
//  Created by DWizard11 on 20/2/23.
//

import SwiftUI

struct OnboardingView: View {
    @State private var currentTab = 0
       var body: some View {
           TabView(selection: $currentTab,
                   content:  {
                       Text("Contacts")
                           .tag(0)
                       Text("Gift Suggestions")
                           .tag(1)
                       Text("Gift Search")
                           .tag(2)
                   })
           .tabViewStyle(PageTabViewStyle())
           .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
           
       }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
    }
}
