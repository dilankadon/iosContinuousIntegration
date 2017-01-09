//
//
//  Created by XCFit Framework
//  Copyright © 2016 XCFit Framework. All rights reserved.
//

/*
 
 This is sample code created by XCFit Framework and can be edited/Removed as per your project need. You can also re-arrange Xcode Groups and directories as per your need.
 
 Here is Step implementation for the HomeScreen where we can use buttons from HomeScreen. We have to implement all the steps in the func HomeScreenSteps Or create another func if needed but we have register it in the intitialiser class. 
 */

import Foundation
import XCTest

class HomeScreenSteps: BaseScreen {
    
    func HomeScreenSteps() {
        

        let app = XCUIApplication()
        let tablesQuery = app.tables
        
        MatchAll("I am on the home screen") { (args, userInfo) -> Void in
            XCTAssert(app.navigationBars.staticTexts["Master"].exists)
        }
        
        When("I tap add button"){ (args, userInfo) -> Void in
           
            app.navigationBars["Master"].buttons["Add"].tap()
        }
        Then("A new entry is added to the list"){ (args, userInfo) -> Void in
            
            XCTAssertEqual(tablesQuery.cells.count, 1)
        }

        When("I swipe the entry to the left"){ (args, userInfo) -> Void in
            let staticText = tablesQuery.cells.element(boundBy: 0)
            staticText.tap()
            app.navigationBars.matching(identifier: "Detail").buttons["Master"].tap()
            staticText.swipeLeft()
        }
        
        And("I tap delete button"){ (args, userInfo) -> Void in
            tablesQuery.buttons["Delete"].tap()
        }

        Then("the entry is deleted from the list"){ (args, userInfo) -> Void in
            XCTAssertEqual(tablesQuery.cells.count, 0)
        }
        
        
    }
}
