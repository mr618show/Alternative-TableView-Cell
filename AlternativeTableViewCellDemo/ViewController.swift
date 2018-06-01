//
//  ViewController.swift
//  AlternativeTableViewCellDemo
//
//  Created by Rui Mao on 5/31/18.
//  Copyright © 2018 Rui Mao. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    let labels = ["label1", "label2", "label3", "label4"]
    let images: [UIImage] = [UIImage(named: "becky")!,
                             UIImage(named: "finn")!,
                             UIImage(named: "holm")!,
                             UIImage(named: "tom")!
                             ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tableView.delegate = self
        tableView.dataSource = self
        
        let nibName1 = UINib(nibName: TableViewCellIdentifiers.Cell1, bundle: nil)
        tableView.register(nibName1, forCellReuseIdentifier: TableViewCellIdentifiers.Cell1)
        let nibName2 = UINib(nibName: TableViewCellIdentifiers.Cell2, bundle: nil)
        tableView.register(nibName2, forCellReuseIdentifier: TableViewCellIdentifiers.Cell2)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return labels.count * 2
    }
    
}
extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row % 2 {
        case 0:
            if let cell = tableView.dequeueReusableCell(withIdentifier: "Cell1", for: indexPath) as? Cell1 {
                cell.label.text = labels[indexPath.row/2]
                return cell
            }
        case 1:
            if let cell = tableView.dequeueReusableCell(withIdentifier: "Cell2", for: indexPath) as? Cell2 {
                cell.cellImageView.image = images[indexPath.row/2]
                return cell
            }
        default:
            let cell = UITableViewCell()
                return cell
            
        }
//        if indexPath.row % 2 == 0 {
//            cell = tableView.dequeueReusableCell(withIdentifier: "cell1", for: indexPath) as! Cell1
//            cell.label.text = labels[indexPath.row/2]
//        } else if indexPath.row % 2 == 1 {
//            cell = tableView.dequeueReusableCell(withIdentifier: "cell2", for: indexPath) as! Cell2
//            cell.cellImageView.image = images[indexPath.row/2]
//        }
        return UITableViewCell()
    }
}

