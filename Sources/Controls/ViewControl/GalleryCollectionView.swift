//
//  GalleryCollectionView.swift
//  Wynk-ImageCollection
//
//  Created by Nitesh Garg on 23/06/20.
//  Copyright © 2020 Nitesh Garg. All rights reserved.
//

import UIKit
import ModernSearchBar

/**
This define  the class for **GalleryCollectionViewControl**.
- Author:  Nitesh Garg
- Date: 25 June, 2020
- Copyright: © 2020 Wynk. All rights reserved.
*/
class GalleryCollectionViewControl: AbstractControl, GalleryCollectionControlViewModelProtocol {
    //Member of the class
    @IBOutlet weak var searchBar: ModernSearchBar!
    private var viewModel = GalleryCollectionControlViewModel()
    
    /**
        This define the collection class foe **AbstractCollectionListControl**
      - Author:  Nitesh Garg
      - Returns: AbstractCollectionListControl.Type!
      - Parameters:
      */
    override var collectionClass: AbstractCollectionListControl.Type! {
        return GalleryCollectionListControl.self
    }
    
    //VeiwDidLoad method
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "GalleryView"
        viewModel.delegate = self
        //Implement the delegation
        self.searchBar.delegateModernSearchBar = self
        // Do any additional setup after loading the view.
    }
    
    /**
        This  function called for refreshing the suggestionBox for searchBar
      - Author:  Nitesh Garg
      - Returns: Void
      - Parameters:
      */
    func refreshSearchBarSuggestion() {
        viewModel.getSearchData { success, searchArr  in
            if success {
                self.searchBar.setDatas(datas: searchArr as! Array<String>)
            }
        }
    }
    
    //This function called when collectionview model click
    override func updateListModel(_ model: AnyObject) {
        refreshSearchBarSuggestion()
    }
    
    //viewDidAppear method
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        refreshSearchBarSuggestion()
    }
}

/**
This extension define the delegates for **SearchBar**
- Author:  Nitesh Garg
- Date: 25 June, 2020
- Copyright: © 2020 Wynk. All rights reserved.
*/
extension GalleryCollectionViewControl: UISearchBarDelegate {
    //This function called when search button clicked in searchbar
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        (collectionControl as! GalleryCollectionListControl).searchText = searchBar.text ?? ""
        collectionControl.refresh()
        self.searchBar.endEditing(true)
    }
}

/**
This extension define the delegates for **ModernSearchBAr**
- Author:  Nitesh Garg
- Date: 25 June, 2020
- Copyright: © 2020 Wynk. All rights reserved.
*/
extension GalleryCollectionViewControl: ModernSearchBarDelegate {
    ///Called if you use String suggestion list
    func onClickItemSuggestionsView(item: String) {
        (collectionControl as! GalleryCollectionListControl).searchText = item
        collectionControl.refresh()
        searchBar.text = item
        searchBar.closeSuggestionsView()
        self.searchBar.endEditing(true)
    }

    ///Called if you use Custom Item suggestion list
    func onClickItemWithUrlSuggestionsView(item: ModernSearchBarModel) {
    }

    ///Called when user touched shadowView
    func onClickShadowView(shadowView: UIView) {
        self.searchBar.endEditing(true)
    }
}
