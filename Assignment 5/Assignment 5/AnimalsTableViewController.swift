//
//  AnimalsTableView ControllerTableViewController.swift
//  Assignment 5
//
//  Created by Nadia Khan on 10/10/19.
//  Copyright © 2019 cs329e. All rights reserved.
//

import UIKit


class AnimalsTableViewController: UITableViewController {

    
    //MARK: Properties
    
    var animals = [Animal]()

    override func viewDidLoad() {
        super.viewDidLoad()
        loadAnimals()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    private func loadAnimals(){
        
        let photo1 = UIImage(named: "animal1")
        let photo2 = UIImage(named: "animal2")
        let photo3 = UIImage(named: "animal3")
        let photo4 = UIImage(named: "animal4")
        
        guard let animal1 = Animal(name: "Great White", photo: photo1, scientificName: "Carcharodon carcharias", className: "Chondrichthyes", size: "680.0 kg") else {
            fatalError("Unable to instantiate meal1")
        }
        
        guard let animal2 = Animal(name: "Common Cuttlefish", photo: photo2, scientificName: "Sepia Officinalis", className: "Cephalopada", size: "4.0 kg") else {
            fatalError("Unable to instantiate meal1")
        }
        
        guard let animal3 = Animal(name: "Takhi", photo: photo3, scientificName: "Equus Feris", className: "Mammalia", size: "300.0 kg") else {
            fatalError("Unable to instantiate meal1")
        }
        
        guard let animal4 = Animal(name: "Asian Elephant", photo: photo4, scientificName: "Elephas Maximus", className: "Mammalia", size: "5500.0 kg") else {
            fatalError("Unable to instantiate meal1")
        }
        
        animals += [animal1, animal2, animal3, animal4]
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return animals.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 1
    }

   
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let animal = animals[indexPath.row]
        
        if indexPath.row % 2 == 0
        {
            
            let cellIdentifier = "AnimalCell"
            
            guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? animalCell  else {
                fatalError("The dequeued cell is not an instance of AnimalCell.")
            }
            
            
            cell.animalPic.image = animal.photo
            cell.animalTitle.text = animal.name
            
            return cell
        }
            
        else {
            
            let cellIdentifier = "AnimalInfoCell"
            
            guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? animalInfoCell  else {
                fatalError("The dequeued cell is not an instance of AnimalInfoCell.")
            }
            
            cell.animalSciName.text = animal.scientificName
            cell.animalClassLabel.text = animal.className
            cell.weightLabel.text = animal.size
            
            return cell
        }
    }
    

}
