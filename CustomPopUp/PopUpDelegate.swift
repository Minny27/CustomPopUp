//
//  PopUpDelegate.swift
//  CustomPopUp
//
//  Created by SeungMin on 2021/04/13.
//

import Foundation

// 프로토콜을 생성해서 다른 뷰 컨트롤로에서 발생한 이벤트를 메인 뷰에서 알 수 있도록 할 수 있는 장치
protocol PopUpDelegate {
    func onOpenChatBtnClicked()
}
