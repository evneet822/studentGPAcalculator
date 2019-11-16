//
//  StudentTableViewController.swift
//  evneet_759831_gpaApp
//
//  Created by MacStudent on 2019-11-14.
//  Copyright © 2019 MacStudent. All rights reserved.
//

import UIKit

class StudentTableViewController: UITableViewController,UISearchResultsUpdating {
    

    @IBOutlet var searchBar: UISearchBar!
    var filterData = [Student]()
    let searchController = UISearchController(searchResultsController: nil)
    var studentIndx = -1
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        
               searchController.searchResultsUpdater = self
               searchController.dimsBackgroundDuringPresentation = false
               definesPresentationContext = true
               tableView.tableHeaderView = searchController.searchBar
        searchBar.backgroundColor = UIColor.white
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        if searchController.isActive && searchController.searchBar.text != ""{
            return filterData.count
        }
        
        return Student.studentData.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
       
        let cell = tableView.dequeueReusableCell(withIdentifier: "studentCell", for: indexPath)
        let studnt: Student
        if searchController.isActive && searchController.searchBar.text != ""{
            studnt = filterData[indexPath.row]
        }
        else{
            studnt = Student.studentData[indexPath.row]
        }
        cell.textLabel?.text = "\(studnt.firstName + " " + "\(studnt.lastName)")"
        cell.detailTextLabel?.text = String(format: "%.2f", studnt.cgpa)
           return cell
        
    }
   
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        self.searchBar.showsCancelButton = true
    }
    
    func updateSearchResults(for searchController: UISearchController) {
        filterStudent(for: searchController.searchBar.text ?? "")
    }
    
   
    
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        
        if let studentDetail = segue.destination as? ViewController{
            studentDetail.studentdelegate = self
        }
        if let detail = segue.destination as? semesterTableViewController{
            detail.studentdelegate = self
        }
        if let cell = sender as? UITableViewCell{
            studentIndx = tableView.indexPath(for: cell)!.row
        }
        
    }
    
    private func filterStudent(for searchText: String){
        
        filterData = Student.studentData.filter({ (Student) -> Bool in
            Student.firstName.lowercased().contains(searchText.lowercased())
        })
        tableView.reloadData()
        
    }
}
