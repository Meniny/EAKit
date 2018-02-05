//
//  UITableViewExtensions.swift
//  EAKit
//
//  Created by Elias Abel on 8/22/16.
//  Copyright © 2016 EAKit
//

#if os(iOS) || os(tvOS)
import UIKit
    
    public extension UITableView {
        public func register(cell cellClass: AnyClass, identifier: String? = nil, xib: Bool) {
            let id = identifier ?? stringify(cellClass)
            if xib {
                let nib = UINib.init(nibName: id, bundle: nil)
                self.register(nib, forCellReuseIdentifier: id)
            } else {
                self.register(cellClass, forCellReuseIdentifier: id)
            }
        }
    }

    // MARK: - Properties
    public extension UITableView {
        
        /// EAKit: Index path of last row in tableView.
        public var indexPathForLastRow: IndexPath? {
            return indexPathForLastRow(inSection: lastSection)
        }
        
        /// EAKit: Index of last section in tableView.
        public var lastSection: Int {
            return numberOfSections > 0 ? numberOfSections - 1 : 0
        }
        
    }

    // MARK: - Methods
    public extension UITableView {
        
        /// EAKit: Number of all rows in all sections of tableView.
        ///
        /// - Returns: The count of all rows in the tableView.
        public func numberOfRows() -> Int {
            var section = 0
            var rowCount = 0
            while section < numberOfSections {
                rowCount += numberOfRows(inSection: section)
                section += 1
            }
            return rowCount
        }
        
        /// EAKit: IndexPath for last row in section.
        ///
        /// - Parameter section: section to get last row in.
        /// - Returns: optional last indexPath for last row in section (if applicable).
        public func indexPathForLastRow(inSection section: Int) -> IndexPath? {
            guard section >= 0 else { return nil }
            guard numberOfRows(inSection: section) > 0  else {
                return IndexPath(row: 0, section: section)
            }
            return IndexPath(row: numberOfRows(inSection: section) - 1, section: section)
        }
        
        /// Reload data with a completion handler.
        ///
        /// - Parameter completion: completion handler to run after reloadData finishes.
        public func reloadData(_ completion: @escaping () -> Void) {
            UIView.animate(withDuration: 0, animations: {
                self.reloadData()
            }, completion: { _ in
                completion()
            })
        }
        
        /// EAKit: Remove TableFooterView.
        public func removeTableFooterView() {
            tableFooterView = nil
        }
        
        /// EAKit: Remove TableHeaderView.
        public func removeTableHeaderView() {
            tableHeaderView = nil
        }
        
        /// EAKit: Scroll to bottom of TableView.
        ///
        /// - Parameter animated: set true to animate scroll (default is true).
        public func scrollToBottom(animated: Bool = true) {
            let bottomOffset = CGPoint(x: 0, y: contentSize.height - bounds.size.height)
            setContentOffset(bottomOffset, animated: animated)
        }
        
        /// EAKit: Scroll to top of TableView.
        ///
        /// - Parameter animated: set true to animate scroll (default is true).
        public func scrollToTop(animated: Bool = true) {
            setContentOffset(CGPoint.zero, animated: animated)
        }
        
        /// EAKit: Dequeue reusable UITableViewCell using class name
        ///
        /// - Parameter name: UITableViewCell type
        /// - Returns: UITableViewCell object with associated class name (optional value)
        public func dequeueReusableCell<T: UITableViewCell>(withClass name: T.Type) -> T? {
            return dequeueReusableCell(withIdentifier: String(describing: name)) as? T
        }
        
        /// SwiferSwift: Dequeue reusable UITableViewCell using class name for indexPath
        ///
        /// - Parameters:
        ///   - name: UITableViewCell type.
        ///   - indexPath: location of cell in tableView.
        /// - Returns: UITableViewCell object with associated class name.
        public func dequeueReusableCell<T: UITableViewCell>(withClass name: T.Type, for indexPath: IndexPath) -> T? {
            return dequeueReusableCell(withIdentifier: String(describing: name), for: indexPath) as? T
        }
        
        /// SwiferSwift: Dequeue reusable UITableViewHeaderFooterView using class name
        ///
        /// - Parameter name: UITableViewHeaderFooterView type
        /// - Returns: UITableViewHeaderFooterView object with associated class name (optional value)
        public func dequeueReusableHeaderFooterView<T: UITableViewHeaderFooterView>(withClass name: T.Type) -> T? {
            return dequeueReusableHeaderFooterView(withIdentifier: String(describing: name)) as? T
        }
        
        /// EAKit: Register UITableViewHeaderFooterView using class name
        ///
        /// - Parameters:
        ///   - nib: Nib file used to create the header or footer view.
        ///   - name: UITableViewHeaderFooterView type.
        public func register<T: UITableViewHeaderFooterView>(nib: UINib?, withHeaderFooterViewClass name: T.Type) {
            register(nib, forHeaderFooterViewReuseIdentifier: String(describing: name))
        }
        
        /// EAKit: Register UITableViewHeaderFooterView using class name
        ///
        /// - Parameter name: UITableViewHeaderFooterView type
        public func register<T: UITableViewHeaderFooterView>(headerFooterViewClassWith name: T.Type) {
            register(T.self, forHeaderFooterViewReuseIdentifier: String(describing: name))
        }
        
        /// EAKit: Register UITableViewCell using class name
        ///
        /// - Parameter name: UITableViewCell type
        public func register<T: UITableViewCell>(cellWithClass name: T.Type) {
            register(T.self, forCellReuseIdentifier: String(describing: name))
        }
        
        /// EAKit: Register UITableViewCell using class name
        ///
        /// - Parameters:
        ///   - nib: Nib file used to create the tableView cell.
        ///   - name: UITableViewCell type.
        public func register<T: UITableViewCell>(nib: UINib?, withCellClass name: T.Type) {
            register(nib, forCellReuseIdentifier: String(describing: name))
        }
        
        /// EAKit: Register UITableViewCell with .xib file using only its corresponding class.
        ///               Assumes that the .xib filename and cell class has the same name.
        ///
        /// - Parameters:
        ///   - name: UITableViewCell type.
        ///   - bundleClass: Class in which the Bundle instance will be based on.
        public func register<T: UITableViewCell>(nibWithCellClass name: T.Type, at bundleClass: AnyClass? = nil) {
            let identifier = String(describing: name)
            var bundle: Bundle? = nil
            
            if let bundleName = bundleClass {
                bundle = Bundle(for: bundleName)
            }
            
            register(UINib(nibName: identifier, bundle: bundle), forCellReuseIdentifier: identifier)
        }
        
    }
#endif
