//
//  TopViewController.swift
//  Test
//
//  Created by koki on 2021/06/04.
//

import UIKit

class TopViewController: UIViewController,UITableViewDelegate,UITableViewDataSource,UserInfoProtocol {
    

    var userInfo = UserInfo()
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        api()
    }
    
    func api() {
        let urlString = "http://52.194.225.173/api/user"
        let encodeUrlString:String = urlString.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
        userInfo.userDelegate = self
        userInfo.SetData(resultCount: 3, encodeUrlString: urlString)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return userInfo.nameArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        let idLabel = cell.contentView.viewWithTag(1) as! UILabel
        let nameLabel = cell.contentView.viewWithTag(2) as! UILabel
        let emailLabel = cell.contentView.viewWithTag(3) as! UILabel
        
        idLabel.text = String(userInfo.idArray[indexPath.row])
        nameLabel.text = userInfo.nameArray[indexPath.row]
        emailLabel.text = userInfo.emailArray[indexPath.row]
        
        print(idLabel.text.debugDescription)
        print(nameLabel.text.debugDescription)
        print(emailLabel.text.debugDescription)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 130
    }
    
    func catcheData() {
        tableView.reloadData()
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
