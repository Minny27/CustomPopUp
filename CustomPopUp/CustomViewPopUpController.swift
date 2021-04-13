//
//  CustomViewPopUpController.swift
//  CustomPopUp
//
//  Created by SeungMin on 2021/04/12.
//

import UIKit

class CustomViewPopUpController : UIViewController {
    // 뷰에 올라갈 메모리 적재
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var subscribeBtn: UIButton!
    @IBOutlet weak var bgBtn: UIButton!
    
    // 아무것도 실행되지 않는 변수를 하나 만들고 함수가 호출되었다는 것만 main에게 알리기
    // main view에서 웹 뷰를 호출하기 위함
    var subscribeBtnCompletionClosure : (() -> Void)?
    
    // 초기화면 설정
    override func viewDidLoad() {
        // UIViewController에 있는 데이터를 모두 사용하겠다.
        super.viewDidLoad()
        print("CustomViewPopUpController - viewDidLoad() called")
        // 테두리를 타원형태로 만들기
        contentView.layer.cornerRadius = 30
        subscribeBtn.layer.cornerRadius = 10
    }
    
 
    @IBAction func onBgBtnClicked(_ sender: Any) {
        print("CustomViewPopUpController - onBgBtnClicked() called")
        // 현재 창 닫아주기
        self.dismiss(animated: true, completion: nil)
    }

    
    // 다른 컨트롤러에서 발생하는 이벤트를 메인에서 알아야한다.
    @IBAction func onSubscribeBtnClicked(_ sender: Any) {
        print("CustomViewPopUpController - onSubscribeBtnClicked() called")
        
        self.dismiss(animated: true, completion: nil)
        
        // 컴플레션 블럭 호출
        if let subscribeBtnCompletionClosure = subscribeBtnCompletionClosure {
            // 메인에 팝업이 눌린 이벤트를 알리기
            subscribeBtnCompletionClosure()
        }
    }
    
}
