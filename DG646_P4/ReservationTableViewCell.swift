//
//  ReservationTableViewCell.swift
//  DG646_P4
//
//  Created by David Goldfarb on 11/25/22.
//

import UIKit

class ReservationTableViewCell: UITableViewCell {
    
    let time = UILabel()
    let date = UILabel()
    let gym = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        time.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(time)
        
        date.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(date)
        
        gym.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(gym)
        
        setupContraints()
    }
    
    func configure(reservation: Reservation){
        time.text = reservation.time
        date.text = reservation.date
        gym.text = reservation.gym
    }
    
    func setupContraints(){
        
        NSLayoutConstraint.activate([
            gym.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            gym.topAnchor.constraint(equalTo: contentView.topAnchor)
        
        ])
        NSLayoutConstraint.activate([
            date.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            date.topAnchor.constraint(equalTo: gym.bottomAnchor)
        
        ])
        
        NSLayoutConstraint.activate([
            time.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            time.topAnchor.constraint(equalTo: date.bottomAnchor)
        
        ])
        
        
    }
    
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
        
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
