//
//  TableViewController.swift
//  UIExample
//
//  Created by jason brown on 12/06/1402 AP.
//

import UIKit

class TableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    lazy var imageModel:ImageModel = {
        return ImageModel.sharedInstance()
    }()

    // MARK: - Table view data source

    /**
     Return the number of sections in the table view
     */
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 4
    }

    /**
    Returns the number of rows in the table
     */
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return self.imageModel.numberOfImages()
        }
        return 1
    }
    
    /**
     Returns the actual cells as listed from the storyboard.
     */
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        print(indexPath)
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "ImageNameCell", for: indexPath)
            
            // Configure the cell...
            if let name = imageModel.getImageName(for: indexPath.row) as? String{
                cell.textLabel!.text = name
            }
            
            return cell
        };
        if indexPath.section == 1{
            let cell = tableView.dequeueReusableCell(withIdentifier: "CollectCell", for: indexPath)
            cell.textLabel?.text = "Carousel"
            //cell.detailTextLabel?.text = "Summary"
            
            return cell
            
        }else if indexPath.section == 2{
       
            let cell = tableView.dequeueReusableCell(withIdentifier: "TimerCell", for: indexPath)
            cell.textLabel?.text = "Timer"
            return cell
        }else{
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "EverythingCell", for: indexPath)
            cell.textLabel?.text = "Everything Else"
            return cell
        }
    }

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if let vc = segue.destination as? ViewController,
           let cell = sender as? UITableViewCell,
           let name = cell.textLabel?.text {
            vc.displayImageName = name
        }
    }
    

}
