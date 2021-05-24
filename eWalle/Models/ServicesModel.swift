//
//  ServicesModel.swift
//  eWalle
//
//  Created by Александр on 24.05.2021.
//

import Foundation

enum ServicesModel: String, CustomStringConvertible, CaseIterable {
  case cashBackOffer = "CashBack\nOffer"
  case electricityBill = "Electricity\nBill"
  case flightTickets = "Flight\nTickets"
  case mobilePrepaid = "Mobile\nPrepaid"
  case sendMoney = "Send\nMoney"
  case receiveMoney = "Receive\nMoney"
  case movieTickets = "Movie\nTickets"
  case moreOptions = "More\nOptions"
  
  var description: String {
    switch self {
    case .cashBackOffer: return "CashBackOffer"
    case .electricityBill: return "ElectricityBill"
    case .flightTickets: return "FlightTickets"
    case .mobilePrepaid: return "MobilePrepaid"
    case .sendMoney: return "SendMoney"
    case .receiveMoney: return "ReceiveMoney"
    case .movieTickets: return "MovieTickets"
    case .moreOptions: return "MoreOptions"
    }
  }
  
}
