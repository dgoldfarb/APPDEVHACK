//
//  DetailsViewController.swift
//  DG646_P4
//
//  Created by David Goldfarb on 10/24/22.
//

import UIKit
import DropDown

class DetailsViewController: UIViewController {
    
    
    let cover = UIImageView()
    let bookingLable = UILabel()
    let name = UITextView()
    let saveinfo = UIButton()
    var setTime = ""
    var date = ""
    let menuOpen = UIButton()
    let datePicker : UIDatePicker = {
        let datePicker = UIDatePicker()
        datePicker.locale = .current
        datePicker.datePickerMode = .date
        datePicker.preferredDatePickerStyle = .compact
        datePicker.tintColor = .blue
        return datePicker
    }()
    var dateFormatter: DateFormatter{
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        return formatter
    }
    //random times for show final version will pull from backend
    let timeSelect: DropDown = {
        let timeSelect = DropDown()
        timeSelect.dataSource = [
            "8:30",
            "9:30",
            "10:30"
        
        ]
        
        return timeSelect
    }()
    
    let gym: GYM
    //let reservation:Reservation
   // weak var delegate: ChangeGymDelegate?
    
    init(gym: GYM){
        
        
        self.gym = gym
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        view.backgroundColor = .white
        
        title = gym.gymName

//        saveinfo.setTitle("save reservation", for: .normal)
//        saveinfo.setTitleColor(.systemBlue, for: .normal)
//        saveinfo.addTarget(self, action: #selector(addres), for: .touchUpInside)
//        saveinfo.translatesAutoresizingMaskIntoConstraints = false
//        view.addSubview(saveinfo)
//        saveinfo.backgroundColor = .lightGray
//        saveinfo.clipsToBounds = true
//        saveinfo.layer.cornerRadius = 10

        menuOpen.setTitle("selecttime", for: .normal)
        menuOpen.addTarget(self, action: #selector(openMenu), for: .touchUpInside)
        menuOpen.backgroundColor = .lightGray
        menuOpen.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(menuOpen)

        timeSelect.backgroundColor = .lightGray
        timeSelect.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(timeSelect)
        timeSelect.anchorView = menuOpen
        

        timeSelect.selectionAction = { index, title in
//            self.feature2.text.append(title)
            self.setTime = String(title)

        }
        
        bookingLable.text = "Booking Details:"
        bookingLable.font = .systemFont(ofSize: 20)
        bookingLable.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(bookingLable)
        
        datePicker.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(datePicker)
        
        date = (dateFormatter.string(from: datePicker.date))
        

        
        setupconstraints()
        
        
        

        // Do any additional setup after loading the view.
    }
    
    func setupconstraints(){

        
        NSLayoutConstraint.activate([
            bookingLable.topAnchor.constraint(equalTo:view.safeAreaLayoutGuide.topAnchor, constant: 20),
            bookingLable.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            
        
        ])
        NSLayoutConstraint.activate([
            datePicker.topAnchor.constraint(equalTo:bookingLable.bottomAnchor, constant: 20),
            datePicker.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            
        
        ])
        
        
 
//        NSLayoutConstraint.activate([
//            saveinfo.topAnchor.constraint(equalTo:menuOpen.bottomAnchor, constant: 20),
//            saveinfo.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//            saveinfo.widthAnchor.constraint(equalToConstant: 200 ),
//            saveinfo.heightAnchor.constraint(equalToConstant: 40)
//
//
//        ])
        NSLayoutConstraint.activate([
            menuOpen.topAnchor.constraint(equalTo:datePicker.bottomAnchor, constant: 20),
            menuOpen.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            menuOpen.widthAnchor.constraint(equalToConstant: 200 ),
            menuOpen.heightAnchor.constraint(equalToConstant: 40)


        ])
        
        
        
    }
//
//   @objc func addRes(){
//
//       let newRes = Reservation(time: setTime, date: date, gym: gym.gymName)
//       delegate?.changeDetails(newRes: newRes)
//
//
//
//       self.navigationController?.popViewController(animated: true)
//
//    }
    @objc func openMenu(){
        timeSelect.show()
        
    }
    

 

}

//protocol ChangeGymDelegate: UITableViewCell{
////    func changeDetails(newRes:Reservation)
//
//}
//protocol addBooking: BookingsViewController{
//    func addRes(res: Reservation)
//}
