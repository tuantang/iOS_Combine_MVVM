//
//  Resource+Standings.swift
//  UseCases
//
//  Created by Tuan Tang on 09/11/2022.
//

import Services
import Entities

extension Resource {
    public static func standings(_ season: Int, _ leagueId: Int) -> Resource<Response<[StandingsResponse]>> {
        let url = NetworkServiceConstant.shared.apiURL.appendingPathComponent("/standings")
        let parameters: [String : CustomStringConvertible] = [
            "season": season,
            "league": leagueId
        ]
        return Resource<Response<[StandingsResponse]>>(url: url, headers: headers, parameters: parameters)
    }
}
