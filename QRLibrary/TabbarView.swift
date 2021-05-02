//
//  File.swift
//  QRLibrary
//
//  Created by unme97 on 2021/04/28.
//

import SwiftUI

struct TabbarView: View {
    @State private var selection = 2
    
    var body: some View {
        TabView(selection: $selection) {
            Text("1")
                .tabItem {
                    Image(systemName: "barcode.viewfinder")
                    Text("대여")
                }.tag(1)
            Filter()
                .tabItem {
                    Image(systemName: "magnifyingglass")
                    Text("검색")
                }.tag(2)
            MypageView()
                .tabItem {
                    Image(systemName: "person.circle")
                    Text("마이페이지")
                }.tag(3)
        }
    }
}

struct SearchView: View {
    @Binding var text : String //Binding은 외부에서 값을 바인딩시킬수있다.
    @State var editText : Bool = false
    
    var body: some View {
        HStack{
            //검색창을 받을수있는 택스트필드
            TextField("검색어를 입력하세요" , text : self.$text)
                //hint와 태두리에 간격을 띄우기위해 15정도의 간격을주고
                .padding(15)
                //양옆은 추가로 15를 더줌
                .padding(.horizontal, 15)
                //배경색상은 자유롭게선택
                .background(Color(.systemGray6))
                //검색창이 너무각지면 딱딱해보이기때문에 모서리를 둥글게
                //숫자는 취향것
                .cornerRadius(15)
                //내가만든 검색창 상단에
                //돋보기를 넣어주기위해
                //오버레이를 선언
                .overlay(
                    //HStack을 선언하여
                    //가로로 view를 쌓을수있도록 하나 만들고
                    HStack{
                        //맨오른쪽으로 밀기위해 Spacer()로 밀어준다.
                        Spacer()
                        //xcode에서 지원해주는 이미지
                       
                        if self.editText{
                            //x버튼이미지를 클릭하게되면 입력되어있던값들을 취소하고
                            //키입력 이벤트를 종료해야한다.
                            Button(action : {
                                self.editText = false
                                self.text = ""
                                //키보드에서 입력을 끝내게하는 코드
                                UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
                            }){
                                Image(systemName: "multiply.circle.fill")
                                    .foregroundColor(Color(.black))
                                    .padding()
                            }
                        }else{
                            Image(systemName: "magnifyingglass")
                                .foregroundColor(Color(.black))
                                .padding()
                        }
                       
                    }
                ).onTapGesture {
                    self.editText = true
                }
        }
    }
}

struct Filter : View {
    @State var text : String = ""
    
    var body :some View{
        VStack{
            SearchView(text: self.$text)
            List((0..<20).filter({"\($0)".contains(self.text) || self.text.isEmpty}), id : \.self){ i in
                Text("\(i)")
            }
        }
    }
}

struct TabbarView_Previews: PreviewProvider {
    static var previews: some View {
        TabbarView()
    }
}
