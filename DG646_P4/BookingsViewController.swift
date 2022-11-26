//
//  BookingsViewController.swift
//  DG646_P4
//
//  Created by David Goldfarb on 11/25/22.
//

import UIKit

class BookingsViewController: UIViewController, UITableViewDelegate {
 
    

    

    
    
    var reservations: [Reservation] = []
    let reservedTable = UITableView()
    let reusableidentifier = "reservationReuseidentifier"
    init(reservations: [Reservation]){
        self.reservations = reservations
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "bookings"
        
        reservedTable.translatesAutoresizingMaskIntoConstraints = false
        reservedTable.backgroundColor = .white
        view.addSubview(reservedTable)
        reservedTable.dataSource = self
        reservedTable.delegate = self
        reservedTable.register(ReservationTableViewCell.self, forCellReuseIdentifier: reusableidentifier)
        
        
        
        
        setupConstraints()

        // Do any additional setup after loading the view.
    }
    
    func setupConstraints(){
        NSLayoutConstraint.activate([
            reservedTable.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            reservedTable.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            reservedTable.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            reservedTable.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor)
        ])
        
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension BookingsViewController: UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return reservations.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = reservedTable.dequeueReusableCell(withIdentifier: reusableidentifier, for: indexPath) as? ReservationTableViewCell{
            cell.configure(reservation: reservations[indexPath.row])
            return cell
            
        }
        
        else{
            return UITableViewCell()
        }
    }
    
    
}



    
