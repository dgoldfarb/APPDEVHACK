//
//  ViewController.swift
//  DG646_P4
//
//  Created by David Goldfarb on 10/24/22.
//

import UIKit

class ViewController: UIViewController{
    
    var gyms: [GYM] = []
    var reservations: [Reservation] = []
    let GymTable = UITableView()
    let reusableidentifier = "contactResueidentifier"
    let appearance = UINavigationBarAppearance()
    let bookings = UIButton()
   

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Fitness Centers"
        view.backgroundColor = .white
        navigationItem.hidesBackButton = true
        appearance.titleTextAttributes = [.foregroundColor: UIColor.black]
        appearance.largeTitleTextAttributes = [.foregroundColor: UIColor.black]
        appearance.backgroundColor = .systemYellow
        navigationItem.standardAppearance = appearance
        navigationItem.scrollEdgeAppearance = appearance
        
        let newman = GYM(gympic: "newman", name: "Helen Newman")
        let noyes = GYM(gympic: "noyes", name: "Noyes Gym")
        let morrison = GYM(gympic: "reis", name: "Reis Tennis Courts")
        let teagle = GYM(gympic: "grumman", name: "Grumman Squash Courts")
        let badminton = GYM(gympic: "badminton", name: "Badminton courts")
        let res1 = Reservation(time: "10:30", date: "thursday", gym: "newman")
        
        
        

        gyms = [newman,noyes,morrison,teagle, badminton]
        reservations = [res1]
        
        GymTable.translatesAutoresizingMaskIntoConstraints = false
        GymTable.backgroundColor = .white
        view.addSubview(GymTable)
        GymTable.dataSource = self
        GymTable.delegate = self
        GymTable.register(gymTableViewCell.self, forCellReuseIdentifier: reusableidentifier)
        
        bookings.setTitle("see my bookings", for: .normal)
        bookings.setTitleColor(.black, for: .normal)
        bookings.addTarget(self, action: #selector(openBooked), for: .touchUpInside)
        bookings.backgroundColor = .systemYellow
        bookings.clipsToBounds = false
        bookings.layer.cornerRadius = 10
        bookings.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(bookings)
        
      
        
        
        setupconstraints()
     
    }
    
    func setupconstraints(){
        //constraint function for organization
        
        NSLayoutConstraint.activate([
            GymTable.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            GymTable.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor,constant: -50),
            GymTable.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            GymTable.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor)
            
        ])
        NSLayoutConstraint.activate([
            bookings.topAnchor.constraint(equalTo: GymTable.bottomAnchor, constant: 10),
            bookings.heightAnchor.constraint(equalToConstant: 50),
            bookings.widthAnchor.constraint(equalToConstant: 200),
            bookings.centerXAnchor.constraint(equalTo: view.centerXAnchor)
           
        ])
        
 
 

        
    }
    @objc func openBooked(){
        navigationController?.pushViewController(BookingsViewController(reservations: reservations), animated: true)
    }
    


   


}



extension ViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return gyms.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = GymTable.dequeueReusableCell(withIdentifier: reusableidentifier, for:  indexPath) as? gymTableViewCell{
            cell.configure(song: gyms[indexPath.row])
            return cell
        }
        else{
            return UITableViewCell()
        }
            
    }
    
    
}

extension ViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        
       // let cell = GymTable.cellForRow(at: indexPath) as! songTableTableViewCell
        navigationController?.pushViewController(DetailsViewController(gym: gyms[indexPath.row], delegate: self), animated: true)
    }

}

extension ViewController: addBooking{
    func addRes(res: Reservation) {
        reservations.insert(res, at: 0)
        
    }


}








