//
//  StandingsViewController.swift
//  MVVM-Combine-iOS
//
//  Created by Tuan Tang on 09/11/2022.
//

import UIKit
import Combine
import SnapKit
import Utils

class StandingsViewController: BaseViewController {
    
    let tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.showsVerticalScrollIndicator = false
        tableView.separatorStyle = .none
        return tableView
    }()
    
    private let viewModel: StandingsViewModelType
    private let appear = PassthroughSubject<Void, Never>()
    private var cancellables: [AnyCancellable] = []
    private lazy var dataSource = makeDataSource()
    
    init(viewModel: StandingsViewModelType) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        adjustUI()
        bind(to: viewModel)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        appear.send(())
    }
    
    private func adjustUI() {
        view.addSubview(tableView)
        
        tableView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.bottom.equalTo(view.safeAreaLayoutGuide)
            make.right.equalTo(view.safeAreaLayoutGuide)
            make.left.equalTo(view.safeAreaLayoutGuide)
        }
        tableView.registerClass(cellClass: ClubRankingViewCell.self)
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 44.0
    }
    
    private func bind(to viewModel: StandingsViewModelType) {
        let input = StandingsViewModelInput(appear: appear.eraseToAnyPublisher())
        
        let output = viewModel.transform(input: input)
        output.sink(receiveValue: { [unowned self] state in
            self.render(with: state)
        }).store(in: &cancellables)
    }
    
    private func render(with state: StandingsState) {
        switch state {
        case .loading:
            break
        case .noResults:
            break
        case .success(let result):
            update(with: result)
        case .failure(let error):
            print(error.localizedDescription)
        }
    }
}

fileprivate extension StandingsViewController {
    
    enum Section: CaseIterable {
        case standings
    }
    
    func makeDataSource() -> UITableViewDiffableDataSource<Section, StandingViewModel> {
        return UITableViewDiffableDataSource(
            tableView: tableView,
            cellProvider: { tableView, indexPath, standingViewModel in
                guard let cell = tableView.dequeueReusableCell(withClass: ClubRankingViewCell.self) else {
                    return UITableViewCell()
                }
                cell.indexPath = indexPath
                cell.bind(to: standingViewModel)
                return cell
            })
    }
    
    func update(with viewModel: LeagueStandingsViewModel, animate: Bool = true) {
        DispatchQueue.main.async {
            let results = viewModel.standings.map { standing -> StandingViewModel in
                return StandingViewModel(rank: standing.rank, name: standing.team.name, logo: standing.team.logo)
            }
            var snapshot = NSDiffableDataSourceSnapshot<Section, StandingViewModel>()
            snapshot.appendSections(Section.allCases)
            snapshot.appendItems(results, toSection: .standings)
            self.dataSource.apply(snapshot, animatingDifferences: animate)
        }
    }
}
