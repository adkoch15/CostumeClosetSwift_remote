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
    
    var models: [(title:String, note:String)] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        table.delegate = self
        table.dataSource = self
        title = "My Collection"
    }
    
    @IBAction func didTapNewItem() {
        
    }
    
    //Table
    
    func tableView(tableView:UITableView, numberofRowsInSection section:Int) -> Int{
        return models.count
    }
    
    func tableView(tableView:UITableView, cellForRowAt indexPath:IndexPath) -> UITableViewCell{
        let cell = tableView.dequeueReusableCell(withIdentifier "cell", for indexPath)
        cell.textLabel?.text = models[indexPath.row].title
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        //Show note controller
        
        guard let vc = storyboard?.instantiateViewController(withIdentifier: "note") as? NoteViewController else {
            vc.title = "Note"
            navigationController?.pushViewController(vc, animated: true)
        }
        <#code#>
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
