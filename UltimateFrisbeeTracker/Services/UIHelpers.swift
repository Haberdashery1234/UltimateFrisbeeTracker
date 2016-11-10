//
//  UIHelpers.swift
//  UltimateFrisbeeTracker
//
//  Created by Christian.Grise on 11/9/16.
//  Copyright © 2016 Christian.Grise. All rights reserved.
//

import UIKit

// MARK: - Constants

// MARK: - Enums

// MARK: Extensions

extension UITableView {
    
    /// Shows or hides extra separators/cells when tableView has less content height than its view height.
    ///
    /// - parameter hidden: Boolean indicating whether to hide or show extra separators/cells
    func toggleExtraSeparators(hidden: Bool) {
        self.tableFooterView = hidden ? UIView(frame: CGRect.zero) : nil
    }
    
    
    /// Sets the table up to use AutomaticDimension for rowHeight and sets the estimated row height
    ///
    /// - parameter height: Height to set the estimatedRowHeight
    func configureAutomaticDimensions(withDefaultRowHeight height: CGFloat = 0) {
        self.rowHeight = UITableViewAutomaticDimension
        self.estimatedRowHeight = height
    }
}
