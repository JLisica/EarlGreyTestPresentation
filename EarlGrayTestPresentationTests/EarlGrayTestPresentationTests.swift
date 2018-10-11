//
//  EarlGrayTestPresentationTests.swift
//  EarlGrayTestPresentationTests
//
//  Created by Babic Vojko on 9/21/18.
//  Copyright © 2018 CarnegieTechnologies. All rights reserved.
//

import XCTest
import EarlGrey
@testable import EarlGrayTestPresentation

open class Element {
    var text = ""
}

class EarlGrayTestPresentationTests: XCTestCase {

    override func setUp() {
        super.setUp()
        let appDelegate: AppDelegate = UIApplication.shared.delegate as! AppDelegate
        appDelegate.resetApplicationForTesting()
        if let rootNVC = appDelegate.window?.rootViewController as? UINavigationController,
            let homeVC = rootNVC.topViewController as? HomeViewController {
            homeVC.tableView.setContentOffset(.zero, animated: false)
        }

        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testSections() {
        //Check MyChannels section vidibility

        EarlGrey.selectElement(with: grey_accessibilityID("myChannelsCollection"))
            .usingSearch(grey_scrollInDirection(.down, 1),
                         onElementWith: grey_kindOfClass(UITableView.self))
            .assert(grey_sufficientlyVisible())

        EarlGrey.selectElement(with: grey_accessibilityID("hotChannelsCollection"))
            .usingSearch(grey_scrollInDirection(.down, 50),
                         onElementWith: grey_kindOfClass(UITableView.self))
            .assert(grey_sufficientlyVisible())

        EarlGrey.selectElement(with: grey_accessibilityID("newChannelsCollection"))
            .usingSearch(grey_scrollInDirection(.down, 100),
                         onElementWith: grey_kindOfClass(UITableView.self))
            .assert(grey_sufficientlyVisible())

        EarlGrey.selectElement(with: grey_accessibilityID("categoriesCollection"))
            .usingSearch(grey_scrollInDirection(.down, 250),
                         onElementWith: grey_kindOfClass(UITableView.self))
            .assert(grey_sufficientlyVisible())

//        EarlGrey.selectElement(with: grey_accessibilityID("searchBar"))
//            .usingSearch(grey_scrollInDirection(.up, 300),
//                         onElementWith: grey_kindOfClass(UITableView.self))
//            .assert(grey_minimumVisiblePercent(0.2))
    }

    func testMyChannelPreview() {
        EarlGrey.selectElement(with: grey_accessibilityID("myChannel1"))
            .usingSearch(grey_scrollInDirection(.right, 1),
                         onElementWith: grey_accessibilityID("myChannelsCollection"))
            .perform(grey_doubleTap())

        EarlGrey.selectElement(with: grey_accessibilityID("channelPreview")).assert(grey_sufficientlyVisible())
    }

    func testMyChannelsMoreButtonExistance() {
        EarlGrey.selectElement(with: grey_accessibilityID("myChannelMore"))
            .usingSearch(grey_scrollInDirection(.right, 600),
                         onElementWith: grey_accessibilityID("myChannelsCollection"))
            .assert(grey_sufficientlyVisible())
    }

    func testMyChannelsMoreSearch() {
        EarlGrey.selectElement(with: grey_accessibilityID("myChannelMore"))
            .usingSearch(grey_scrollInDirection(.right, 600),
                         onElementWith: grey_accessibilityID("myChannelsCollection"))
            .perform(grey_doubleTap())

        EarlGrey.selectElement(with: grey_accessibilityID("channelSearch")).assert(grey_sufficientlyVisible())
    }

    func testCategoryPreview() {
        EarlGrey.selectElement(with: grey_accessibilityID("categoriesCollection"))
            .usingSearch(grey_scrollInDirection(.down, 250),
                         onElementWith: grey_kindOfClass(UITableView.self))
            .assert(grey_sufficientlyVisible())

        EarlGrey.selectElement(with: grey_accessibilityID("category1"))
            .usingSearch(grey_scrollInDirection(.right, 1),
                         onElementWith: grey_accessibilityID("categoriesCollection"))
            .perform(grey_doubleTap())

        EarlGrey.selectElement(with: grey_accessibilityID("categoryPreview")).assert(grey_sufficientlyVisible())
    }

//    func testMyChannelCellTitle() {
//        let element = Element()
//        EarlGrey.selectElement(with: grey_accessibilityID("title"))
//            .inRoot(grey_accessibilityID("myChannel2"))
//            .perform(grey_getLabelText(element))
////        GREYAssertTrue(element.text == "Banetov Kanal", reason: "get text failed")
//    }

//    func testCategoryCellTitle() {
//        EarlGrey.selectElement(with: grey_accessibilityID("categoriesCollection"))
//            .usingSearch(grey_scrollInDirection(.down, 250),
//                         onElementWith: grey_kindOfClass(UITableView.self))
//            .assert(grey_sufficientlyVisible())
//
//        EarlGrey.selectElement(with: grey_accessibilityID("category4"))
//            .usingSearch(grey_scrollInDirection(.right, 600),
//                         onElementWith: grey_accessibilityID("categoriesCollection"))
//            .assert(grey_sufficientlyVisible())
//
//        let element = Element()
////        EarlGrey.selectElement(with: grey_accessibilityID("title"))
////            .inRoot(grey_accessibilityID("category4"))
////            .perform(grey_getLabelText(element))
//
////        GREYAssertTrue(element.text == "Management", reason: "get text failed")
//    }

    func testSearch() {
        
    }

    // MARK: Private methods
    public func grey_getLabelText(_ elementCopy: Element) -> GREYActionBlock {
        return GREYActionBlock.action(withName: "get text",
                                      constraints: grey_respondsToSelector(#selector(getter: UILabel.text))) { element,
                                        errorOrNil -> Bool in
                                        let elementObject = element as? NSObject
                                        let text = elementObject?.perform(#selector(getter: UILabel.text),
                                                                          with: nil)?.takeRetainedValue() as? String
                                        elementCopy.text = text ?? ""
                                        return true
        }
    }
}
