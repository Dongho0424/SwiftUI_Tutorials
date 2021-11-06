//
//  ProfileHost.swift
//  Landmarks
//
//  Created by 최동호 on 2021/11/05.
//  Copyright © 2021 Apple. All rights reserved.
//

import SwiftUI

struct ProfileHost: View {
    // Initially given values in current environment
    // EnvironmentValues
    @Environment(\.editMode) var editMode
    @EnvironmentObject var modelData: ModelData
    @State private var draftProfile = Profile.default
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            HStack {
                if editMode?.wrappedValue == .active {
                    Button("Cancel", role: .cancel) {
                        print("Cancel Button$")
                        draftProfile = modelData.profile
                        print("profile$: \(draftProfile)")
                        editMode?.animation().wrappedValue = .inactive
                    }
                }
                Spacer()
                EditButton()
            }
            
            if editMode?.wrappedValue == .inactive {
                ProfileSummary(profile: modelData.profile)
            } else {
                ProfileEditor(profile: $draftProfile)
                    .onAppear {
                        print("ProfileEditor onAppear$")
                        print("profile$: \(draftProfile)")
                        draftProfile = modelData.profile
                    }
                    .onDisappear {
                        print("ProfileEditor onDisappear$")
                        modelData.profile = draftProfile
                    }
            }
        }
        .padding()
    }
}

struct ProfileHost_Previews: PreviewProvider {
    static var previews: some View {
        ProfileHost()
            .environmentObject(ModelData())
    }
}
