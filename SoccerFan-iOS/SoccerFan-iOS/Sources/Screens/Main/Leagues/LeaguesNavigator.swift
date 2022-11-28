//
//  LeaguesNavigator.swift
//  MVVM-Combine-iOS
//
//  Created by Tuan Tang on 09/11/2022.
//

import UIKit

protocol LeaguesNavigator: AnyObject {
    func showStandings(with season: Int, leaguesId: Int)
}
