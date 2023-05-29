//
//  ContentView.swift
//  KakaoSDKTest
//
//  Created by Jae kwon Choi on 2023/05/29.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var kakaoAuthVM = KaKaoAuthViewModel()
    
    var body: some View {
        VStack {
            
            Text("로그인 여부")
            
            Text(kakaoAuthVM.isSuccess ? "로그인 중" : "로그아웃중")
                .foregroundColor(Color.gray)
            
            Text("accessToken")
            Text(kakaoAuthVM.accessToken)
                .foregroundColor(Color.gray)
            
            Text("refreshToken")
            Text(kakaoAuthVM.refreshToken)
                .foregroundColor(Color.gray)
            
            Button("카카오 로그인") {
                kakaoAuthVM.kakaoLogin()
            }
            
            Button("카카오 로그아웃") {
                kakaoAuthVM.kakaoLogOut()
            }
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
