//
//  HomeViewController.swift
//  eWalle
//
//  Created by Александр on 20.05.2021.
//

import UIKit

protocol HomeViewControllerDelegate {
  func toggleMenu()
}

protocol HomeViewProtocol: class {
  var delegate: HomeViewControllerDelegate? { get }
  func reloadData()
}

class HomeViewController: UIViewController {
  
  @IBOutlet weak var currentBalanceLabel: UILabel!
  @IBOutlet weak var peoplesCollectionView: UICollectionView!
  @IBOutlet weak var servicesCollectionView: UICollectionView!
  @IBOutlet weak var servicesCollectionViewHeight: NSLayoutConstraint!
  
  var presenter: HomeViewPresenterProtocol!
  var delegate: HomeViewControllerDelegate?
  
  private let configurator: HomeConfiguratorProtocol = HomeConfigurator()
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    
    configurator.configure(with: self)
    presenter.viewDidLoad()
    
    let peopleCell = UINib(nibName: "PeopleCell", bundle: nil)
    peoplesCollectionView.register(peopleCell , forCellWithReuseIdentifier: PeopleCell.reuseId)
    let serviceCell = UINib(nibName: "ServiceCell", bundle: nil)
    servicesCollectionView.register(serviceCell , forCellWithReuseIdentifier: ServiceCell.reuseId)
  }
  
  override func viewWillLayoutSubviews() {
    if view.frame.size.width < 381 {
      servicesCollectionViewHeight.constant = 308
    } else {
      servicesCollectionViewHeight.constant = 212
    }
  }
  
  @IBAction func menuPressed(_ sender: UIButton) {
    presenter.menuPressed()
  }
  @IBAction func topUpBalancePressed(_ sender: UIButton) {
  }
  @IBAction func scanCardPressed(_ sender: UIButton) {
  }
  @IBAction func sendMoneyPressed(_ sender: UIButton) {
  }
  @IBAction func filterPressed(_ sender: UIButton) {
  }
  
  
}

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource {
  
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    if collectionView == peoplesCollectionView {
      return presenter.peoplesCount ?? 0
    }
    
    return presenter.servicesCount ?? 0
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    if collectionView == peoplesCollectionView {
      let cellPeople = collectionView.dequeueReusableCell(withReuseIdentifier: "PeopleCell", for: indexPath) as! PeopleCell
      guard let people = presenter?.people(atIndex: indexPath) else { return UICollectionViewCell() }
      cellPeople.set(peopleCellViewModel: people)
      return cellPeople
    } else {
      let cellService = collectionView.dequeueReusableCell(withReuseIdentifier: "ServiceCell", for: indexPath) as! ServiceCell
      guard let service = presenter?.service(atIndex: indexPath) else { return UICollectionViewCell() }
      cellService.set(service: service)
      return cellService
    }
  }
  
  
}

extension HomeViewController: HomeViewProtocol {
  func reloadData() {
    peoplesCollectionView?.reloadData()
    servicesCollectionView?.reloadData()
  }
}
