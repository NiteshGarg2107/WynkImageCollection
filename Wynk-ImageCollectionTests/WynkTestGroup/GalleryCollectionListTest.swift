//
//  GalleryCollectionListTest.swift
//  Wynk-ImageCollectionTests
//
//  Created by Nitesh Garg on 25/06/20.
//  Copyright © 2020 Nitesh Garg. All rights reserved.
//

import Foundation
import Quick
import Nimble

@testable import Wynk_ImageCollection

class GalleryCollectionListVeiwTest: QuickSpec {
    var galleryViewModel: GalleryCollectionListViewModel!

    override func spec() {
        testGetGalleryData()
        testSaveSearchText()
    }
    /**
     This function is used for testing the API is working properly or not.
     - Author:  Nitesh Garg
     - Returns: Void
     - Parameters:
     */
    func testGetGalleryData() {
        //MARK: This is used for getting the successful result
        describe("GalleryCollectionListViewModel") {
            
            //MARK: This is used for removing the instance from the memory
            afterEach {
                self.galleryViewModel = nil
            }
            
            //MARK: This is used for storing the instance from the memory
            beforeEach {
                self.galleryViewModel = GalleryCollectionListViewModel()
            }
            //MARK: This specify the context
            context("API Call") {
                it("Should give error or Json result"){
                    //MARK: API Call
                    self.galleryViewModel.getGalleryData(parameters: self.parametersSuccess) { (result) in
                            expect(result.total).toEventually(beGreaterThan(0))
                        }
                }

            }
        }
        
        
        //MARK: This is used for getting the Faliure result
        describe("GalleryCollectionListViewModel") {
            
            //MARK: This is used for removing the instance from the memory
            afterEach {
                self.galleryViewModel = nil
            }
            
            //MARK: This is used for storing the instance from the memory
            beforeEach {
                self.galleryViewModel = GalleryCollectionListViewModel()
            }
            //MARK: This specify the context
            context("API Call") {
                it("Should give error or Json result"){
                    //MARK: API Call
                    self.galleryViewModel.getGalleryData(parameters: self.faliureParameters) { (result) in
                        expect(result.errorMsg).toEventually(beEmpty())
                        }
                }

            }
        }
    }
    
    /**
     This function is used for testing the Data is saving or not.
     - Author:  Nitesh Garg
     - Returns: Void
     - Parameters:
     */
    func testSaveSearchText() {
        //MARK: This is used for checking the data is properly saving in coredata or not
        describe("GalleryCollectionListViewModel") {
            
            //MARK: This is used for removing the instance from the memory
            afterEach {
                self.galleryViewModel = nil
            }
            
            //MARK: This is used for storing the instance from the memory
            beforeEach {
                self.galleryViewModel = GalleryCollectionListViewModel()
            }
            //MARK: This specify the context
            context("Save data") {
                it("Should give error or Json result"){
                    //MARK: API Call
                    self.galleryViewModel.saveSearchText(text: "Nitesh") { (success) in
                        expect(success).toEventually(equal(true))
                    }
                }

            }
        }
        
    }
    
    /**
     This is used for getting the parameters for success API callingt.
     - Author:  Nitesh Garg
     - Returns: [String: AnyObject]
     - Parameters:
     */
    var parametersSuccess: [String: AnyObject] {
        return [ConstantParameterKeys.key: ConstantParameterKeys.keyValue as AnyObject,GalleryParameterKeys.searchText: "Taj" as AnyObject, GalleryParameterKeys.type: GalleryConstantStore.photo as AnyObject, GalleryParameterKeys.pageNumber:"1" as AnyObject, GalleryParameterKeys.perLimit: "20" as AnyObject]
    }
    
    /**
    This is used for getting the parameters for Faliure API callingt.
    - Author:  Nitesh Garg
    - Returns: [String: AnyObject]
    - Parameters:
    */
    var faliureParameters: [String: AnyObject] {
        return [ConstantParameterKeys.key: "sdasasdhbassadajsda" as AnyObject,GalleryParameterKeys.searchText: "Taj" as AnyObject, GalleryParameterKeys.type: GalleryConstantStore.photo as AnyObject, GalleryParameterKeys.pageNumber:"1" as AnyObject, GalleryParameterKeys.perLimit: "20" as AnyObject]
    }
}
