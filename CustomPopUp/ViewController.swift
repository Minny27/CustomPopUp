//
//  ViewController.swift
//  CustomPopUp
//
//  Created by SeungMin on 2021/04/12.
//

import UIKit
import WebKit

class ViewController: UIViewController {
    
    @IBOutlet weak var myWebView: WKWebView!
    @IBOutlet weak var createPopUpBtn: UIButton!
//    override func() {
//        super.viewDidLoad()
//        // Do any additional setup after loading the view.
//    }

    @IBAction func onCreatePopUpClicked(_ sender: Any) {
        print("ViewController - onCreatePopUpClicked called")
        // 스토리보드 가져오기 
        let storyboard = UIStoryboard.init(name: "PopUp", bundle: nil)
        // 스토리보드를 통해서 뷰컨트롤러 가져오기(뷰 컨트롤러의 id를 통해서)
        let customAlertPopUpVC = storyboard.instantiateViewController(withIdentifier: "AlertPopUpVC") as! CustomViewPopUpController
        // 뷰컨트롤러가 보여지는 스타일
        customAlertPopUpVC.modalPresentationStyle = .overCurrentContext
        // 뷰컨트롤러가 사라지는 스타일
        customAlertPopUpVC.modalTransitionStyle = .crossDissolve
        // subscribeBtnCompletionClosure 함수가 호출됐을 때만 실행
        customAlertPopUpVC.subscribeBtnCompletionClosure = {
            print("컴플레션 블럭이 호출되었다!")
            let myChannelUrl = URL(string: "https://minny27.tistory.com/")
            self.myWebView.load(URLRequest(url: myChannelUrl!))
        }
        
        // 다른 뷰 컨트롤러를 보여주기
        // navigation Controller의 경우 스택으로 쌓인다.
        // 하지만 present는 현재의 뷰컨트롤러에서 다른 뷰컨트롤러가 바로 보임
        // 팝업띄우기 버튼을 눌렀을 때 다음 나오는 화면 호출
        self.present(customAlertPopUpVC, animated: true, completion: nil)
    }
    
}

