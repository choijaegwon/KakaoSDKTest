//
//  KaKaoAuthViewModel.swift
//  KakaoSDKTest
//
//  Created by Jae kwon Choi on 2023/05/29.
//

import Foundation
import KakaoSDKCommon
import KakaoSDKUser

class KaKaoAuthViewModel: ObservableObject {
    
    @Published var accessToken: String = ""
    @Published var refreshToken: String = ""
    /// 성공여부
    @Published var isSuccess: Bool = false

    /// 카카오 로그인
    func kakaoLogin() {
        if UserApi.isKakaoTalkLoginAvailable() {
            // 카카오톡 앱
            UserApi.shared.loginWithKakaoTalk { oauthToken, error in
                if let error = error {
                    print(error)
                } else {
                    print("loginWithKakaoTalk() success.")
                    self.isSuccess = true
                    // do something
                    _ = oauthToken
                }
            }
        } else {
            // 웹사이트
            UserApi.shared.loginWithKakaoAccount { oauthToken, error in
                if let erorr = error {
                } else {
                    print("카카오 로그인 성공")
                    _ = oauthToken
                    self.isSuccess = true
                    self.accessToken = oauthToken?.accessToken ?? ""
                    self.refreshToken = oauthToken?.refreshToken ?? ""
                }
            }
        }
    }
    
    /// 로그아웃
    func kakaoLogOut() {
        self.accessToken = ""
        self.refreshToken = ""
        self.isSuccess = false
    }
}
