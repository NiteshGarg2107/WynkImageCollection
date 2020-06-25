import Foundation
import Quick
import Nimble

@testable import Wynk_ImageCollection

class GalleryFullImageViewTest: QuickSpec {
    var galleryViewModel: GalleryCollectionControlViewModel!

    override func spec() {
        testGetSearchdata()
    }
    /**
     This function is used for testing the API is working properly or not.
     - Author:  Nitesh Garg
     - Returns: Void
     - Parameters:
     */
    func testGetSearchdata() {
        //MARK: This is used for getting the successful result
        describe("GalleryCollectionControlViewModel") {
            
            //MARK: This is used for removing the instance from the memory
            afterEach {
                self.galleryViewModel = nil
            }
            
            //MARK: This is used for storing the instance from the memory
            beforeEach {
                self.galleryViewModel = GalleryCollectionControlViewModel()
            }
            //MARK: This specify the context
            context(" get Search Data") {
                it("Should Give Array of result"){
                    //MARK: Get data from Coredatabase
                    self.galleryViewModel.getSearchData { (success, data) in
                        expect(success).toEventually(equal(true))
                    }
                }

            }
        }
    }
}
