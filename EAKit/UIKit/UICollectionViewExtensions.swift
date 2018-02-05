//
//  UICollectionViewExtensions.swift
//  EAKit
//
//  Created by Elias Abel on 11/12/2016.
//  Copyright © 2016 EAKit
//

#if os(iOS) || os(tvOS)
    import UIKit
    
    public extension UICollectionView {
        public func register(cell cellClass: AnyClass, identifier: String? = nil, xib: Bool) {
            let id = identifier ?? stringify(cellClass)
            if xib {
                let nib = UINib.init(nibName: id, bundle: nil)
                self.register(nib, forCellWithReuseIdentifier: id)
            } else {
                self.register(cellClass, forCellWithReuseIdentifier: id)
            }
        }
    }

    // MARK: - Properties
    public extension UICollectionView {
        
        /// EAKit: Index path of last item in collectionView.
        public var indexPathForLastItem: IndexPath? {
            return indexPathForLastItem(inSection: lastSection)
        }
        
        /// EAKit: Index of last section in collectionView.
        public var lastSection: Int {
            return numberOfSections > 0 ? numberOfSections - 1 : 0
        }
        
    }

    // MARK: - Methods
    public extension UICollectionView {
        
        /// EAKit: Number of all items in all sections of collectionView.
        ///
        /// - Returns: The count of all rows in the collectionView.
        public func numberOfItems() -> Int {
            var section = 0
            var itemsCount = 0
            while section < self.numberOfSections {
                itemsCount += numberOfItems(inSection: section)
                section += 1
            }
            return itemsCount
        }
        
        /// EAKit: IndexPath for last item in section.
        ///
        /// - Parameter section: section to get last item in.
        /// - Returns: optional last indexPath for last item in section (if applicable).
        public func indexPathForLastItem(inSection section: Int) -> IndexPath? {
            guard section >= 0 else {
                return nil
            }
            guard section < numberOfSections else {
                return nil
            }
            guard numberOfItems(inSection: section) > 0 else {
                return IndexPath(item: 0, section: section)
            }
            return IndexPath(item: numberOfItems(inSection: section) - 1, section: section)
        }
        
        /// EAKit: Reload data with a completion handler.
        ///
        /// - Parameter completion: completion handler to run after reloadData finishes.
        public func reloadData(_ completion: @escaping () -> Void) {
            UIView.animate(withDuration: 0, animations: {
                self.reloadData()
            }, completion: { _ in
                completion()
            })
        }
        
        /// EAKit: Dequeue reusable UICollectionViewCell using class name.
        ///
        /// - Parameters:
        ///   - name: UICollectionViewCell type.
        ///   - indexPath: location of cell in collectionView.
        /// - Returns: UICollectionViewCell object with associated class name.
        public func dequeueReusableCell<T: UICollectionViewCell>(withClass name: T.Type, for indexPath: IndexPath) -> T? {
            return dequeueReusableCell(withReuseIdentifier: String(describing: name), for: indexPath) as? T
        }
        
        /// EAKit: Dequeue reusable UICollectionReusableView using class name.
        ///
        /// - Parameters:
        ///   - kind: the kind of supplementary view to retrieve. This value is defined by the layout object.
        ///   - name: UICollectionReusableView type.
        ///   - indexPath: location of cell in collectionView.
        /// - Returns: UICollectionReusableView object with associated class name.
        public func dequeueReusableSupplementaryView<T: UICollectionReusableView>(ofKind kind: String, withClass name: T.Type, for indexPath: IndexPath) -> T? {
            return dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: String(describing: name), for: indexPath) as? T
        }
        
        /// EAKit: Register UICollectionReusableView using class name.
        ///
        /// - Parameters:
        ///   - kind: the kind of supplementary view to retrieve. This value is defined by the layout object.
        ///   - name: UICollectionReusableView type.
        public func register<T: UICollectionReusableView>(supplementaryViewOfKind kind: String, withClass name: T.Type) {
            register(T.self, forSupplementaryViewOfKind: kind, withReuseIdentifier: String(describing: name))
        }
        
        /// EAKit: Register UICollectionViewCell using class name.
        ///
        /// - Parameters:
        ///   - nib: Nib file used to create the collectionView cell.
        ///   - name: UICollectionViewCell type.
        public func register<T: UICollectionViewCell>(nib: UINib?, forCellWithClass name: T.Type) {
            register(nib, forCellWithReuseIdentifier: String(describing: name))
        }
        
        /// EAKit: Register UICollectionViewCell using class name.
        ///
        /// - Parameter name: UICollectionViewCell type.
        public func register<T: UICollectionViewCell>(cellWithClass name: T.Type) {
            register(T.self, forCellWithReuseIdentifier: String(describing: name))
        }
        
        /// EAKit: Register UICollectionReusableView using class name.
        ///
        /// - Parameters:
        ///   - nib: Nib file used to create the reusable view.
        ///   - kind: the kind of supplementary view to retrieve. This value is defined by the layout object.
        ///   - name: UICollectionReusableView type.
        public func register<T: UICollectionReusableView>(nib: UINib?, forSupplementaryViewOfKind kind: String, withClass name: T.Type) {
            register(nib, forSupplementaryViewOfKind: kind, withReuseIdentifier: String(describing: name))
        }
        
        /// EAKit: Register UICollectionViewCell with .xib file using only its corresponding class.
        ///               Assumes that the .xib filename and cell class has the same name.
        ///
        /// - Parameters:
        ///   - name: UICollectionViewCell type.
        ///   - bundleClass: Class in which the Bundle instance will be based on.
        public func register<T: UICollectionViewCell>(nibWithCellClass name: T.Type, at bundleClass: AnyClass? = nil) {
            let identifier = String(describing: name)
            var bundle: Bundle? = nil
            
            if let bundleName = bundleClass {
                bundle = Bundle(for: bundleName)
            }
            
            register(UINib(nibName: identifier, bundle: bundle), forCellWithReuseIdentifier: identifier)
        }
        
    }
#endif
