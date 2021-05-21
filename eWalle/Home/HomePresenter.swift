//
//  HomePresenter.swift
//  eWalle
//
//  Created by Александр on 21.05.2021.
//

import Foundation

protocol HomeViewPresenterProtocol: class {
  var peoples: [People] { get }
  var services: [Service] { get }
  var peoplesCount: Int? { get }
  var servicesCount: Int? { get }
  
  func getPeoples()
  func getServices()
  func people(atIndex indexPath: IndexPath) -> People?
  func service(atIndex indexPath: IndexPath) -> Service?
  func viewDidLoad()
}

class HomePresenter {

  
  var services = [Service]()
  var peoples = [People]()
  var peoplesCount: Int? = 0
  var servicesCount: Int? = 0

  weak var view: HomeViewProtocol!
  
  let servicesDictionary = ["CashBack\nOffer" : "CashBackOffer",
                          "Electricity\nBill" : "ElectricityBill",
                            "Flight\nTickets" : "FlightTickets",
                            "Mobile\nPrepaid" : "MobilePrepaid",
                                "Send\nMoney" : "SendMoney",
                             "Receive\nMoney" : "ReceiveMoney",
                             "Movie\nTickets" : "MovieTickets",
                              "More\nOptions" : "MoreOptions"]
  
  let peoplesDictionary = ["Mike" : "Mike",
                        "Joshpeh" : "Joshpeh",
                           "Miky" : "Mike",
                           "JoJo" :"Joshpeh"]
  
  init(view: HomeViewProtocol) {
    self.view = view
  }
}


extension HomePresenter: HomeViewPresenterProtocol {
  func viewDidLoad() {
    getServices()
    getPeoples()
  }
  
  func getServices() {
    for service in servicesDictionary {
      services.append(Service(serviceName: service.key, serviceIcon: service.value))
    }
    servicesCount = services.count
    view?.reloadData()
  }
  
  func getPeoples() {
    for people in peoplesDictionary {
      peoples.append(People(name: people.key, icon: people.value))
    }
    peoplesCount = peoples.count
    view?.reloadData()
  }
  
  func people(atIndex indexPath: IndexPath) -> People? {
    if peoples.indices.contains(indexPath.row) {
        return peoples[indexPath.row]
    } else {
        return nil
    }
  }
  
  func service(atIndex indexPath: IndexPath) -> Service? {
    if services.indices.contains(indexPath.row) {
        return services[indexPath.row]
    } else {
        return nil
    }
  }
}
