//
//  FirstViewController.swift
//  Alamofire
//
//  Created by Ats on 13/08/19.
//

import UIKit

class FirstViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
   
    
    @IBOutlet weak var firstView: UIView!
    
    @IBOutlet weak var bookingTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

         bookingTableView.delegate = self
         bookingTableView.dataSource = self
        
         bookingTableView.register(UINib(nibName: "BookingTableViewCell", bundle: nil), forCellReuseIdentifier: "BookingTableViewCell")
        
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "BookingTableViewCell", for: indexPath) as! BookingTableViewCell
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 380
    }
    
    
    



    
    
}
