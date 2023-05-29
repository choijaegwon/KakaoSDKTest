//
//  KakaoSDKTestApp.swift
//  KakaoSDKTest
//
//  Created by Jae kwon Choi on 2023/05/29.
//

import KakaoSDKAuth
import KakaoSDKCommon
import SwiftUI

@main
struct KakaoLogin: App {

    init() {
        KakaoSDK.initSDK(appKey: "네이티브 키")
    }

    var body: some Scene {
        WindowGroup {
            ContentView().onOpenURL(perform: { url in
                if AuthApi.isKakaoTalkLoginUrl(url) {
                    AuthController.handleOpenUrl(url: url)
                }
            })
        }
    }
}
