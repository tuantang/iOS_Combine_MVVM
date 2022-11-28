//
//  LeaguesViewController.swift
//  MVVM-Combine-iOS
//
//  Created by Tuan Tang on 09/11/2022.
//

import UIKit
import Combine
import SnapKit
import Keys
import Services

class LeaguesViewController: BaseViewController {
    
    private var cancellables: [AnyCancellable] = []
    private let viewModel: LeaguesViewModelType
    private let selection = PassthroughSubject<Int, Never>()
    private let appear = PassthroughSubject<Void, Never>()
    
    let standingsButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Standings", for: .normal)
        button.setTitleColor(.darkGray, for: .normal)
        return button
    }()
    
    init(viewModel: LeaguesViewModelType) {
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
    
    private func adjustUI() {
        view.addSubview(standingsButton)
        
        standingsButton.snp.makeConstraints { make in
            make.centerX.equalTo(view)
            make.centerY.equalTo(view)
        }
        standingsButton.addTarget(self, action: #selector(standingsButtonPressed), for: .touchUpInside)
    }
    
    private func bind(to viewModel: LeaguesViewModelType) {
        cancellables.forEach { $0.cancel() }
        cancellables.removeAll()
        let input = LeaguesViewModelInput(appear: appear.eraseToAnyPublisher(),
                                          selection: selection.eraseToAnyPublisher())
        
        let output = viewModel.transform(input: input)
        output.sink(receiveValue: { [unowned self] state in
            
        }).store(in: &cancellables)
    }
    
    @objc
    func standingsButtonPressed() {
        selection.send(39)
    }
}
