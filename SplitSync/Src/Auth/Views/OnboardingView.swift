//
//  OnboardingView.swift
//  SplitSync
//
//  Created by João Melo on 09/09/24.
//

import SwiftUI

struct OnboardingView: View {
    @ObservedObject var controller: OnboardingController

    var body: some View {
        GeometryReader {
            let size = $0.size

            VStack {
                if controller.isLoading {
                    Spacer()

                    SplitSyncLoading()

                    Spacer()
                } else {
                    Spacer()

                    MorphingSymbolView(
                        symbol: controller.onboardingPages[controller.currentIndex].icon,
                        config: .init(
                            font: .system(size: 150, weight: .bold),
                            frame: .init(width: 200, height: 200),
                            radius: 30,
                            foregroundColor: .textWhite
                        )
                    )

                    TextContents(
                        pages: controller.onboardingPages,
                        currentIndex: controller.currentIndex,
                        size: size
                    )

                    Spacer()

                    IndicatorView(
                        pages: controller.onboardingPages,
                        currentIndex: controller.currentIndex
                    )

                    ContinueButton(
                        pages: controller.onboardingPages,
                        currentIndex: controller.currentIndex,
                        goToNextPage: controller.gotToNextPage
                    )
                }
            }
            .frame(maxWidth: .infinity)
            .overlay(alignment: .top) {
                if !controller.isLoading {
                    HeaderView(
                        pages: controller.onboardingPages,
                        currentIndex: controller.currentIndex,
                        gotToLastPage: controller.gotToLastPage,
                        goToPreviousPage: controller.goToPreviousPage
                    )
                }
            }
            .onAppear {
                Task {
                    let response = await controller.getOnboarding()

                    if !response {
                        // Go To Login page
                    }
                }
            }
        }
        .navigationBarBackButtonHidden()
        .background {
            Rectangle()
                .fill(Color.accentColor.gradient)
                .ignoresSafeArea()
        }
    }

    @ViewBuilder
    func TextContents(
        pages: [OnboardingPageEntity],
        currentIndex: Int,
        size: CGSize
    ) -> some View {
        VStack(spacing: 8) {
            HStack(alignment: .top, spacing: 0) {
                ForEach(pages, id: \.order) { page in
                    SplitSyncText(text: page.title)
                        .lineLimit(1)
                        .kerning(1.1)
                        .frame(width: size.width)
                }
            }
            .offset(x: -CGFloat(currentIndex) * size.width)
            .animation(.smooth(duration: 0.7, extraBounce: 0.1), value: currentIndex)

            HStack(alignment: .top, spacing: 0) {
                ForEach(pages, id: \.order) { page in
                    SplitSyncText(text: page.subTitle)
                        .padding(.horizontal, 15)
                        .multilineTextAlignment(.center)
                        .frame(width: size.width)
                }
            }
            .offset(x: -CGFloat(currentIndex) * size.width)
            .animation(.smooth(duration: 0.9, extraBounce: 0.1), value: currentIndex)
        }
        .padding(.top, 15)
        .frame(width: size.width, alignment: .leading)
    }

    @ViewBuilder
    func IndicatorView(
        pages: [OnboardingPageEntity],
        currentIndex: Int
    ) -> some View {
        HStack(spacing: 6) {
            ForEach(pages, id: \.order) { page in
                Capsule()
                    .fill(.textWhite.opacity(currentIndex == page.order ? 1 : 0.4))
                    .frame(width: currentIndex == page.order ? 25 : 8, height: 8)
            }
        }
        .animation(.smooth(duration: 0.5, extraBounce: 0), value: currentIndex)
        .padding(.bottom, 12)
    }

    @ViewBuilder
    func HeaderView(
        pages: [OnboardingPageEntity],
        currentIndex: Int,
        gotToLastPage: @escaping () -> Void,
        goToPreviousPage: @escaping () -> Void
    ) -> some View {
        HStack {
            Button(action: goToPreviousPage) {
                Image(systemName: "chevron.left")
                    .font(.title3)
                    .fontWeight(.semibold)
                    .contentShape(.rect)
            }
            .opacity(currentIndex != 0 ? 1 : 0)

            Spacer()

            Button("Skip", action: gotToLastPage)
                .fontWeight(.semibold)
                .opacity(currentIndex != pages.count - 1 ? 1 : 0)
        }
        .foregroundStyle(.textWhite)
        .animation(.snappy(duration: 0.35, extraBounce: 0), value: currentIndex)
        .padding(15)
    }

    @ViewBuilder
    func ContinueButton(
        pages: [OnboardingPageEntity],
        currentIndex: Int,
        goToNextPage: @escaping () -> Void
    ) -> some View {
        Button(action: goToNextPage) {
            Text(currentIndex == pages.count - 1 ? "Login into SplitSync" : "Continue")
                .contentTransition(.identity)
                .foregroundStyle(Color.accentColor)
                .padding(.vertical, 15)
                .frame(maxWidth: currentIndex == pages.count - 1 ? 220 : 180)
                .background(.backgroundWhite, in: .capsule)
        }
        .padding(.bottom, 15)
        .animation(.smooth(duration: 0.5, extraBounce: 0), value: currentIndex)
    }
}

#Preview {
    // swiftlint:disable line_length
    let onboardingPages = [
        OnboardingPageEntity(
            id: "1",
            icon: "person.crop.rectangle.stack.fill",
            title: "<font:fontStyle:titleMedium color:textWhite>Effortless expense sharing</font>",
            subTitle: "<font:fontStyle:bodyMedium color:textWhite opacity:0.8>Welcome to </font><font:fontStyle:bodyMediumBold color:textWhite>SplitSync!</font><font:fontStyle:bodyMedium color:textWhite opacity:0.8> Track your expenses and seamlessly share costs with friends, family, or teammates. Whether it’s a group trip or splitting bills with your partner, </font><font:fontStyle:bodyMediumBold color:textWhite>we make it easy</font>",
            order: 0
        ),
        OnboardingPageEntity(
            id: "1",
            icon: "person.2.circle.fill",
            title: "<font:fontStyle:titleMedium color:textWhite>Group expense management</font>",
            subTitle: "<font:fontStyle:bodyMedium color:textWhite opacity:0.8>Start by creating a group for your event or project. </font><font:fontStyle:bodyMediumBold color:textWhite>Invite your partners</font><font:fontStyle:bodyMedium color:textWhite opacity:0.8>, and keep everyone in sync with shared expenses and balances.</font>",
            order: 1
        ),
        OnboardingPageEntity(
            id: "1",
            icon: "creditcard.fill",
            title: "<font:fontStyle:titleMedium color:textWhite>Keep tabs on every transaction</font>",
            subTitle: "<font:fontStyle:bodyMedium color:textWhite opacity:0.8>Log expenses in just a few taps. Add notes, receipts, and categories to keep track of </font><font:fontStyle:bodyMediumBold color:textWhite>who owes what</font><font:fontStyle:bodyMedium color:textWhite opacity:0.8>, so everyone stays on the same page.</font>",
            order: 2
        ),
        OnboardingPageEntity(
            id: "1",
            icon: "icloud.and.arrow.up",
            title: "<font:fontStyle:titleMedium color:textWhite>Always in sync</font>",
            subTitle: "<font:fontStyle:bodyMedium color:textWhite opacity:0.8>Your data is always up to date with </font><font:fontStyle:bodyMediumBold color:textWhite>real-time syncing</font><font:fontStyle:bodyMedium color:textWhite opacity:0.8>. Access your groups and expenses from any device, anytime.</font>",
            order: 3
        ),
        OnboardingPageEntity(
            id: "1",
            icon: "checkmark.circle",
            title: "<font:fontStyle:titleMedium color:textWhite>Start splitting!</font>",
            subTitle: "<font:fontStyle:bodyMedium color:textWhite opacity:0.8>That's it! You're ready to </font><font:fontStyle:bodyMediumBold color:textWhite>simplify your expense tracking</font><font:fontStyle:bodyMedium color:textWhite opacity:0.8> and start splitting expenses with ease. Let’s get started!</font>",
            order: 4
        )
    ]
    // swiftlint:enable line_length

    let getOnboardingUseCase = GetOnboardingUseCaseMock(
        result: .success(onboardingPages)
    )

    return OnboardingView(
        controller: OnboardingController(
            getOnboardingUseCase: getOnboardingUseCase
        )
    )
}
