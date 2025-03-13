//
//  ProfileView.swift
//  SportsChatMessenger
//
//  Created by Saif Shikdar on 05/03/2025.
//

import SwiftUI
import SwiftUICore

struct ProfileView: View {
    @ObservedObject var viewModel: ProfileViewModel

    var body: some View {
        NavigationView {
            ZStack {
                VStack {
                    AsyncImage(url: URL(string: viewModel.profile?.profilePictureURL ?? "")) { phase in
                        switch phase {
                        case .success(let image):
                            image
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .edgesIgnoringSafeArea(.all)
                                .frame(
                                    width: UIScreen.main.bounds.width,
                                    height: UIScreen.main.bounds.height)
                        default:
                            Image(Images.backgroundImage)
                                .resizable()
                                .edgesIgnoringSafeArea(.all)
                                .frame(
                                    width: UIScreen.main.bounds.width,
                                    height: UIScreen.main.bounds.height
                                )
                        }
                    }
                    Spacer()
                        .frame(height: 200)
                }
                ScrollView {
                    VStack {
                        Spacer()
                            .frame(height: 700)
                        VStack {
                            ProfileHeadingView(title: "Links", showHideButton: true,
                                               hideSectionTapped: viewModel.hideLinksTapped,
                                               editSectionTapped: viewModel.editLinksTapped)
                            ProfileLinksSection(socialLinks: viewModel.profile?.links ?? [])
                            ProfileHeadingView(title: "Bio", showHideButton: true,
                                               hideSectionTapped: {},
                                               editSectionTapped: {})
                            Text(viewModel.profile?.bio ?? "")
                                .font(DesignTokens.Typography.bodyFont)
                                .foregroundStyle(DesignTokens.Colors.white)
                                .padding(.bottom, 24)
                            ProfileHeadingView(title: "Details", showHideButton: false,
                                               hideSectionTapped: {},
                                               editSectionTapped: {})
                            ProfileDetailsRowView(title: "Works at \(viewModel.profile?.workCompany ?? "")",
                                                  subtitle: viewModel.profile?.workTitle ?? "",
                                                  icon: "briefcase.fill")
                            ProfileDetailsRowView(title: "Studied at \(viewModel.profile?.educationInstitution ?? "")",
                                                  subtitle: viewModel.profile?.educationField ?? "",
                                                  icon: "graduationcap.fill")
                            ProfileDetailsRowView(title: viewModel.profile?.ethnicity ?? "",
                                                  subtitle: "",
                                                  icon: "shareplay")
                            ProfileDetailsRowView(title: viewModel.profile?.relationshipStatus ?? "",
                                                  subtitle: "",
                                                  icon: "heart.fill")
                            createUserCreationRow()
                            Spacer(minLength: 300)
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .safeAreaPadding()
                        .background(DesignTokens.Colors.black)
                    }
                }
            }
            .background(DesignTokens.Colors.black)
        }

    }
}

@ViewBuilder
func createUserCreationRow() -> some View {
    HStack(spacing: 24) {
        Image(systemName: "clock")
            .foregroundStyle(DesignTokens.Colors.white)
            .frame(width: 20, alignment: .center)
        Text("Joined on February 2024")
            .font(DesignTokens.Typography.bodyFont)
            .foregroundStyle(DesignTokens.Colors.secondary)
        Spacer()
    }
    .padding(.bottom, 24)
}

#Preview {
    ProfileView(viewModel: ProfileViewModel(
        profile: Profile(bio: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
                         bornLocation: "England",
                         educationField: "NA",
                         educationInstitution: "NA",
                         ethnicity: "Mixed",
                         homeLocation: "Madrid",
                         links: [
                            SocialLink(
//                                name: .playstation,
                                       linkURL: "https://psntrophyleaders.com/user/view/saifshikdar#games"),
                            SocialLink(
//                                name: .instagram,
                                       linkURL: "https://www.instagram.com/judebellingham/?hl=en"),
                            
                         ],
                         profilePictureURL: "https://www.fifatrainingcentre.com/media/images/game/World-class-bellingham.variant1920x1080.jpg",
                         publicFields: PublicFields(
                            bio: true,
                            education: true,
                            ethnicity: true,
                            home: true,
                            links: true,
                            relationship: true,
                            work: true),
                         relationshipStatus: "Single",
                         forename: "Jude",
                         surname: "Bellingham",
                         email: "bellinghamjude12@gmail.com",
                         workCompany: "Real Madrid",
                         workTitle: "Football Player")))
}
