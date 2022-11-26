//
//  songTableTableViewCell.swift
//  DG646_P4
//
//  Created by David Goldfarb on 10/24/22.
//

import UIKit

class songTableTableViewCell: UITableViewCell {
    
    let cover = UIImageView()
    var nameText = UILabel()
    var artistText = UILabel()
    var albumText = UILabel()
    
   
    

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = .white
        
        cover.clipsToBounds = true
        cover.layer.cornerRadius = 20
        cover.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(cover)
        
        
        nameText.textColor = .black
        nameText.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(nameText)
        
        
//        artistText.textColor = .white
//        artistText.translatesAutoresizingMaskIntoConstraints = false
//        contentView.addSubview(artistText)
//
//        albumText.textColor = .white
//        albumText.translatesAutoresizingMaskIntoConstraints = false
//        contentView.addSubview(albumText)
        
    
    }
    
    func configure(song: GYM){
        cover.image = UIImage(named: song.gympic)
        nameText.text = song.gymName
        
        setupconstraints()
    }
    
    
    
    func setupconstraints(){
        NSLayoutConstraint.activate([
            cover.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            cover.trailingAnchor.constraint(equalTo: contentView.trailingAnchor,constant: -20),
//            cover.widthAnchor.constraint(equalTo: contentView.widthAnchor, constant: 20),
            cover.heightAnchor.constraint(equalToConstant: 100),
            cover.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            cover.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            cover.topAnchor.constraint(equalTo: contentView.topAnchor),
            cover.bottomAnchor.constraint(equalTo: contentView.bottomAnchor,constant: -40)
        
        ])
        NSLayoutConstraint.activate([
            nameText.topAnchor.constraint(equalTo: cover.bottomAnchor),
            nameText.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,constant: 20),
//            nameText.heightAnchor.constraint(equalToConstant: 10)

        ])
//        NSLayoutConstraint.activate([
//            artistText.leadingAnchor.constraint(equalTo: cover.trailingAnchor, constant: 10),
//            artistText.centerYAnchor.constraint(equalTo:contentView.centerYAnchor)
//        ])
//        NSLayoutConstraint.activate([
//            albumText.leadingAnchor.constraint(equalTo: cover.trailingAnchor, constant: 10),
//            albumText.centerYAnchor.constraint(equalTo:contentView.centerYAnchor, constant: 20)
//        ])
       
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
//extension songTableTableViewCell: ChangeGymDelegate{
//    func changeDetails(newname: String, newartist: String, newalbum: String) {
//        nameText.text = newname
//        artistText.text=newartist
//        albumText.text=newalbum
//    }
//
//
//}
