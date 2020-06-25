//
//  AbstractCollectionListControl.swift
//  Dropneed
//
//  Created by Lakhwinder Singh on 31/03/17.
//  Copyright © 2017 lakh. All rights reserved.
//

import UIKit

var itemsPerPage = 20
var preloadAtItem = 16

protocol ListControlDelegate {
    func updateListModel(_ model: AnyObject)
}

class AbstractCollectionListControl: UICollectionViewController, UICollectionViewDelegateFlowLayout, CollectionCellDelegate {
    
    enum RequestPageType : Int {
        case first = 0
        case next = 1
    }
    
    var customDelegate: ListControlDelegate!
    var cellbackgroundColor : UIColor!
    var isLoading : Bool!
    var offset : NSInteger!
    var isPageAvailable : Bool!

    var _searchQuery : String!
    var searchQuery: String! {
        get {
            return _searchQuery ?? ""
        }
        set {
            if newValue != _searchQuery {
                _searchQuery = newValue
                requestItemsForFirstPage()
            }
        }
    }
    
    var items: Array<Any>! = []
    
    var isNibUsed: Bool {
        return false
    }

    var isStaticData: Bool {
        return false
    }
    
    var cellClass: AbstractCollectionCell.Type {
        return AbstractCollectionCell.self
    }
    
    var reuseId: String {
        return cellClass.reuseId
    }
    
    // MARK: init view
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    required override init(collectionViewLayout layout: UICollectionViewLayout) {
        super.init(collectionViewLayout: layout)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        isLoading = false
        setupCollectionView()
        requestItemsForFirstPage()
        // Do any additional setup after loading the view.
    }
    
    func setupCollectionView() {
        // Register cell classes
        collectionView?.backgroundColor = UIColor.clear
        collectionView?.setCollectionViewLayout(cellClass.flowLayout(margin), animated: true)
        if isNibUsed {
            collectionView!.register(UINib.init(nibName: String(describing: cellClass), bundle: nil), forCellWithReuseIdentifier: reuseId)
        } else {
            collectionView!.register(cellClass, forCellWithReuseIdentifier:reuseId)
        }
        collectionView!.showsVerticalScrollIndicator = false
        collectionView?.contentInset = .init(top: 0, left: margin, bottom: 8, right: margin)
        collectionView!.alwaysBounceVertical = true
        collectionView?.backgroundView = customBackgroundView
        collectionView!.addSubview(refreshControl)
    }
    
    var margin: CGFloat {
        return 0.0
    }
    
    func addContentOffsetObserver() {
        self.collectionView!.addObserver(self, forKeyPath: CONTENT_OFFSET_KEY_PATH, options: NSKeyValueObservingOptions.new, context: nil);
    }
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        if (keyPath == CONTENT_OFFSET_KEY_PATH) {
            
        }
    }
    
    // MARK: setter getters
    var refreshControl1: UIRefreshControl!
    var refreshControl: UIRefreshControl {
        get {
            if refreshControl1 == nil {
                refreshControl1 = UIRefreshControl()
                refreshControl1.addTarget(self, action: #selector(AbstractCollectionListControl.refresh), for: UIControl.Event.valueChanged)
            }
            return refreshControl1
        }
        set {
            refreshControl1 = newValue
        }
    }
    var _customBackgroundView: ListBackgroundView?
    var customBackgroundView: ListBackgroundView {
        get {
            if (_customBackgroundView == nil) {
                _customBackgroundView = ListBackgroundView()
                _customBackgroundView?.isVisible = false
            }
            return _customBackgroundView!
        }
        set {
            _customBackgroundView = newValue
        }
    }
    
    var _noItemsText: String = ""
    var noItemsText: String {
        get {
            return self.customBackgroundView.messageText;
        }
        set {
            if newValue.length != 0 {
                self.customBackgroundView.messageText = newValue
                _noItemsText = newValue
            }
        }
    }
    
    // MARK: requests
    
    func requestItemsForFirstPage() {
        if isLoading == false {
//            isLoading = true
            self.isPageAvailable = true
            offset = 0
            self.requestItemsForPage(.first)
        }
    }
    
    func requestItemsForNextPage() {
        if isLoading == false && self.isPageAvailable == true {
            isLoading = true
            offset = offset+itemsPerPage
            self.requestItemsForPage(.next)
        }
    }
    
    func requestItemsForPage(_ type: RequestPageType) {

        if (self.searchQuery.length != 0) {
            customBackgroundView.isVisible = true
            customBackgroundView.searchText = searchQuery
            self.items.removeAll();
            self.collectionView!.reloadData();
        } else {
            self.customBackgroundView.isVisible = false
        }

        //MARK: Make a request
        
        if !isStaticData {
            noItemsText = _noItemsText
            self.requestItems(self.searchQuery, limit: itemsPerPage, offset: offset, completion:{(items, error, pageAvailable) in
                self.customBackgroundView.searchText = nil
                self.isLoading = false
                self.isPageAvailable = pageAvailable
                self.endRefreshing()
                if (error == nil && items != nil) {
                    if (type == .first) {
                        self.items.removeAll()
                    }
                    self.items.append(contentsOf: items!)
                    self.collectionView?.reloadData()
                } else {
                    if (type == .first && error != nil) {
                        self.items.removeAll()
                        self.collectionView!.reloadData()
                    }
                }
                self.customBackgroundView.isVisible = (self.items.count == 0)
            })
        } else {
            self.customBackgroundView.searchText = nil
            self.isLoading = false
            self.isPageAvailable = false
            self.endRefreshing()
            
            noItemsText = ""
            self.items.removeAll()
            self.collectionView!.reloadData()
            self.customBackgroundView.isVisible = true
        }
    }
    
    var staticItems: Array<Any> {
        get {
            return items
        }
        set {
            items.removeAll()
            items.append(contentsOf: newValue)
            collectionView?.reloadData()
            
            self.isLoading = false
            self.isPageAvailable = false
            customBackgroundView.isVisible = (items.count == 0)
        }
    }
    
    func requestItems(_ query: String, limit: NSInteger, offset: NSInteger, completion: @escaping (_ : Array<Any>?, _ : NSError?, _ : Bool?) -> Void) {
        completion(nil, nil, false); // Default implementation does almost nothing
    }
    
    func endRefreshing() {
        self.refreshControl.endRefreshingIfNeeded()
    }
    
    // MARK: Actions
    
    @objc func refresh() {
        self.requestItemsForFirstPage()
    }
    
    // MARK: UICollectionViewDataSource
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: self.reuseId, for: indexPath) as! AbstractCollectionCell
        cell.updateWithModel(items[indexPath.row] as AnyObject)
        customDelegate.updateListModel(items[indexPath.row] as AnyObject)
        cell.updateBackGroundColor(cellbackgroundColor ?? .clear)
        cell.delegate = self
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        (cell as! AbstractCollectionCell).viewAppear()
        let shouldPreloadHere = indexPath.item == self.items.count - itemsPerPage + preloadAtItem;
        let lastItemReached = indexPath.item == self.items.count - 1;
        if (shouldPreloadHere || lastItemReached) {
            DispatchQueue.dispatch_async_main ({ // Avoid race condition
                self.requestItemsForNextPage();
            });
        }
    }
    
    // MARK: Cell delegate methods
    
    func updateCell() {
        collectionView?.reloadData()
    }
    
    func updateModel(_ model: AnyObject, cell: AbstractCollectionCell) {
        let indexPath = collectionView?.indexPathForItem(at: cell.frame.origin)
        let row: Int = (indexPath?.row)!
        self.items[row] = model
        print(row)
    }

    // MARK: Misc
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
    
    }
    */


