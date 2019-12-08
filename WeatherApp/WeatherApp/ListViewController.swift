import UIKit

class ListViewController: UIViewController {
    private var tableView = UITableView()
  
    //private var observer: AnyObject?
    
    /* @objc func refreshData() {
     DispatchQueue.main.async {
     
     }
     }*/
    
    override func viewDidLoad() {
        self.view.addSubview(tableView)
        tableView.snp.makeConstraints { (make) -> Void in
            make.edges.equalToSuperview() }
    }
    
    /*  DispatchQueue.main.async {
     self.observer = NotificationCenter.default.addObserver(
     forName: NSNotification.Name(rawValue: "Update"),
     object: nil,
     queue: OperationQueue.main)
     { [weak self] notification in
     guard let `self` = self else {
     return
     }
     self.refreshData()
     }
     }
     */
}
