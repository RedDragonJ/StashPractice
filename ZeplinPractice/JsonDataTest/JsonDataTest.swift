//
//  JsonDataTest.swift
//  JsonDataTest
//
//  Created by James H Layton on 6/14/18.
//  Copyright © 2018 james. All rights reserved.
//

import XCTest
@testable import ZeplinPractice

class JsonDataTest: XCTestCase, InteractorToPresenterProtocol {
    
    func retrieveDataWith(achievements: [Achievenments]) {
        XCTAssertEqual(achievements.first?.id, 4)
        XCTAssertEqual(achievements[1].bg_image_url, "https://cdn.zeplin.io/5a5f7e1b4f9f24b874e0f19f/screens/341E40C8-1C2A-400C-B67D-F490B74BDD81.png")
    }
    
    func failedRetrieveDataWith(error: String) {
        
    }
    
    var interactor: PresenterToInteractorProtocol?
    
    func testJsonData() {
        interactor?.fetchJSON()
    }
    
    
}
