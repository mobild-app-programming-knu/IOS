//
//  qrlibrary
//
//  Created by unme97 on 2021/04/28.
//  로그인 후에 다시 돌아가기 수정해야함!

import SwiftUI

struct SignInView: View {
    @State var email: String = ""
    @State var password: String = ""
    @State var loginresult = false
    @State var user : User? = nil;

    
    func signIn(){
        doLogin(data: LoginRequest(email: email, password: password),
            successCallback: { userResponse in
                loginresult = true
                user = userResponse
                print(userResponse)
            }, failedCallback: { errorResponse in
                loginresult = false
                print(errorResponse)
        })
    }
    
    
    var body: some View {
        VStack {
            Text("환영합니다")
                .font(.system(size: 32, weight: .heavy))
            
            Text("로그인 하세요")
                .font(.system(size: 18, weight: .medium))
                .foregroundColor(Color(UIColor.gray))
            
            VStack(spacing: 18) {
                TextField("이메일", text: $email)
                    .font(.system(size:14))
                    .padding(12)
                    .background(RoundedRectangle(cornerRadius: 5).strokeBorder(Color(UIColor.black), lineWidth: 1))
                
                SecureField("패스워드", text: $password)
                    .font(.system(size:14))
                    .padding(12)
                    .background(RoundedRectangle(cornerRadius: 5).strokeBorder(Color(UIColor.black), lineWidth: 1))
            }
            .padding(.vertical, 64)
            
            NavigationLink(destination: TabbarView(user: user), isActive: $loginresult) {
                HStack {
                    Button(action: signIn) {
                        Text("로그인")
                            .frame(minWidth: 0, maxWidth: .infinity)
                            .frame(height: 50)
                            .foregroundColor(.white)
                            .font(.system(size: 14, weight: .bold))
                            .background(LinearGradient(gradient: Gradient(colors: [Color(UIColor.systemBlue), Color(UIColor.systemBlue)]), startPoint: .leading, endPoint: .trailing))
                        .cornerRadius(5)
                    }
                }
            }
            
            Spacer()
            
            NavigationLink(destination: SignUpView()) {
                HStack {
                    Text("회원 가입")
                        .font(.system(size: 14, weight: .semibold))
                }
            }
        }
        .padding(.horizontal, 32)
    }
}

struct SignUpView: View {
    @State var email: String = ""
    @State var password: String = ""
    @State var name: String = ""
    @State var phoneNum: String = ""
    @State var joinresult = false
    @State var response: String = ""
    
    func signUp(){
        doJoin(data: JoinRequest(name: name, phoneNum: phoneNum, email: email, password: password),
            successCallback: { JoinResponse in
                joinresult = true
                response = "계정 생성 완료! 로그인 하세요"
                print(JoinResponse)
            }, failedCallback: { errorResponse in
                joinresult = false
                response = ""
                print(errorResponse)
        })
    }
    
    var body: some View {
        VStack {
            Text("계정 생성")
                .font(.system(size: 32, weight: .heavy))
                
            VStack(spacing: 18) {
                TextField("이름", text: $name)
                    .font(.system(size: 14))
                    .padding(12)
                    .background(RoundedRectangle(cornerRadius: 5).strokeBorder(Color(UIColor.black), lineWidth: 1))
                TextField("전화번호", text: $phoneNum)
                    .font(.system(size: 14))
                    .padding(12)
                    .background(RoundedRectangle(cornerRadius: 5).strokeBorder(Color(UIColor.black), lineWidth: 1))
                TextField("이메일", text: $email)
                    .font(.system(size: 14))
                    .padding(12)
                    .background(RoundedRectangle(cornerRadius: 5).strokeBorder(Color(UIColor.black), lineWidth: 1))
                SecureField("비밀번호", text: $password)
                    .font(.system(size: 14))
                    .padding(12)
                    .background(RoundedRectangle(cornerRadius: 5).strokeBorder(Color(UIColor.black), lineWidth: 1))
                Text(response)
                    .font(.system(size: 12))
                    .foregroundColor(Color(UIColor.red))
            }.padding(.vertical, 30)
            .padding(.top, 34)
            
            Button(action: signUp) {
                Text("계정 생성")
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .frame(height: 50)
                    .foregroundColor(.white)
                    .font(.system(size: 14, weight: .bold))
                    .background(LinearGradient(gradient: Gradient(colors: [Color(UIColor.systemBlue), Color(UIColor.systemBlue)]), startPoint: .leading, endPoint: .trailing))
                    .cornerRadius(5)
            }
            
            Spacer()
        }.padding(.horizontal, 32)        
    }
}

struct AuthView: View {
    var body: some View {
        NavigationView {
            SignInView()
        }
    }
}

struct AuthView_Previews: PreviewProvider {
    static var previews: some View {
        SignInView()
    }
}
