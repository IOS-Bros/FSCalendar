//
//  AddViewController.swift
//  FsCalendar01
//
//  Created by SooHoon on 2021/07/28.
//

import UIKit

class AddViewController: UIViewController {

    @IBOutlet weak var tfTitle: UITextField!
    @IBOutlet weak var lblDate: UILabel!
    @IBOutlet weak var tvContext: UITextView!
    
    var receiveDate: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        receiveDay(receiveDate)
        
        lblDate.text = receiveDate
        // Do any additional setup after loading the view.
    }
    
    
    
    func receiveDay(_ date: String){
        receiveDate = date
    }

    @IBAction func btnInsert(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
        
        
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
