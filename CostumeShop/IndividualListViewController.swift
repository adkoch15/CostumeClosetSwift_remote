//
//  IndividualListViewController.swift
//  CostumeShop
//
//  Created by Anthony Koch on 2/5/22.
//

import UIKit

class IndividualListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet var table: UITableView!
    @IBOutlet var label: UILabel!
    
    var models: [(title: String, note: String)] = []
    override func viewDidLoad(){
        super.viewDidLoad()
        table.delegate = self;
        table.dataSource = self;
        title = "Notes"
    }
    
    @IBAction func didTapNewNote() {
        
    }
    
    //Table
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return models.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text=models[indexPath.row].title
        cell.detailTextLabel?.text = models[indexPath.row].title
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        //Show note controller
        
        guard let vc = storyboard?.instantiateViewController(identifier: "note") as? NoteViewController else {return}
        vc.title = "Note"
        navigationController?.pushViewController(vc, animated: true)
    }
   
}
