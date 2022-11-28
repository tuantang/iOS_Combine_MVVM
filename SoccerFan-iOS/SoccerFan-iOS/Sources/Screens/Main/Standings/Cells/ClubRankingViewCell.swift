//
//  ClubRankingViewCell.swift
//  SoccerFan-iOS
//
//  Created by Tuan Tang on 14/11/2022.
//

import UIKit
import SnapKit
import Kingfisher
import Utils

class ClubRankingViewCell: UITableViewCell, ReusableView {
    
    let rankLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        return label
    }()
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        return label
    }()
    
    let logoImageView: UIImageView = {
        let label = UIImageView()
        return label
    }()
    
    var indexPath: IndexPath!
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        adjustUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        adjustUI()
    }
    
    func bind(to viewModel: StandingViewModel) {
        nameLabel.text = viewModel.name
        rankLabel.text = "\(viewModel.rank)"
        logoImageView.kf.setImage(with: URL(string: viewModel.logo))
    }
}

fileprivate extension ClubRankingViewCell {
    private func adjustUI() {
        selectionStyle = .none
        
        let stackView: UIStackView = {
            let stackView = UIStackView(arrangedSubviews: [rankLabel, logoImageView, nameLabel])
            stackView.axis = .horizontal
            stackView.spacing = 4
            return stackView
        }()
        
        addSubview(stackView)
        
        stackView.snp.makeConstraints { make in
            make.top.equalTo(self).offset(4)
            make.bottom.equalTo(self).offset(-4)
            make.left.equalTo(self).offset(8)
        }
        
        logoImageView.snp.makeConstraints { make in
            make.height.equalTo(20)
            make.width.equalTo(20)
        }
        
        rankLabel.snp.makeConstraints { make in
            make.width.equalTo(18)
        }
    }
}
