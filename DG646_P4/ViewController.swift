//
//  ViewController.swift
//  DG646_P4
//
//  Created by David Goldfarb on 10/24/22.
//

import UIKit

class ViewController: UIViewController{
    
    var gyms: [GYM] = []
    let GymTable = UITableView()
    let reusableidentifier = "contactResueidentifier"
    let appearance = UINavigationBarAppearance()
    let bookings = UIButton()
   

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Fitness Centers"
        view.backgroundColor = .white
        
        appearance.titleTextAttributes = [.foregroundColor: UIColor.black]
        appearance.largeTitleTextAttributes = [.foregroundColor: UIColor.black]
        appearance.backgroundColor = .white
        navigationItem.standardAppearance = appearance
        navigationItem.scrollEdgeAppearance = appearance
        
        let newman = GYM(gympic: "newman", name: "Helen Newman")
        let noyes = GYM(gympic: "noyes", name: "Noyes Gym")
        let morrison = GYM(gympic: "reis", name: "Reis Tennis Courts")
        let teagle = GYM(gympic: "grumman", name: "Grumman Squash Courts")
        let badminton = GYM(gympic: "badminton", name: "Badminton courts")
//        let badh = Song(songpic: "lacy1", name: "Bad Habbit", artist:"Steve Lacy", album: "Gemini Rights" )
//        let darkr = Song(songpic: "lacy2", name: "Dark Red", artist:"Steve Lacy", album: "Demo" )
//        let pablo = Song(songpic: "pablo", name: "Pt2", artist:"Kanye", album: "Life of Pablo" )
//        let Uzi = Song(songpic: "uzi", name: "Myron", artist:"Lil Uzi", album: "Lil Uzi Vert vs. the World 2" )
//        let Yeeus = Song(songpic: "Yeezus", name: "Bound2", artist:"Kanye", album: "Yeezus" )
//        let rage = Song(songpic: "rage", name: "Ballin", artist:"Lil Uzi", album: "Luv is Rage" )
//        let paris = Song(songpic: "midnight", name: "Anti-Hero", artist:"Taylor Swift", album: "Midnights" )
//
        gyms = [newman,noyes,morrison,teagle, badminton]//,badh,darkr,pablo,Uzi,Yeeus,rage,paris]
        
        GymTable.translatesAutoresizingMaskIntoConstraints = false
        GymTable.backgroundColor = .white
        view.addSubview(GymTable)
        GymTable.dataSource = self
        GymTable.delegate = self
        GymTable.register(songTableTableViewCell.self, forCellReuseIdentifier: reusableidentifier)
        
        bookings.setTitle("see my bookings", for: .normal)
        bookings.addTarget(self, action: #selector(openBooked), for: .touchUpInside)
        bookings.backgroundColor = .lightGray
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
        navigationController?.pushViewController(BookingsViewController(), animated: true)
    }
    


   


}



extension ViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return gyms.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = GymTable.dequeueReusableCell(withIdentifier: reusableidentifier, for:  indexPath) as? songTableTableViewCell{
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
        navigationController?.pushViewController(DetailsViewController(gym: gyms[indexPath.row]), animated: true)
    }

}








