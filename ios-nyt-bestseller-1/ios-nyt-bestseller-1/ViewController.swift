//
//  ViewController.swift
//  ios-nyt-bestseller-1
//
//  Created by Mario Holper on 11.10.19.
//  Copyright © 2019 Mario Holper. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    var books = [Book]()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //Top-15 der NYT laden
        books = Book.loadBestseller()
        
        //Table-View-Verwaltung
        tableView.delegate = self
        tableView.dataSource = self
        
        //keine leeren Tabellenzellen am Ende der Liste zeigen
        tableView.tableFooterView = UIView(frame: CGRect.zero)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segueToDetailView", let dest = segue.destination as? DetailViewController, let row = tableView.indexPathForSelectedRow?.row {
            dest.book = books[row]
        }
    }

}
extension ViewController : UITableViewDataSource {
    //Anzahl der Listenabschnitte
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    //Anzahl der Listenelemente
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return books.count
    }
    //Tabellenzeilen initialisieren
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let reuseIdentifier = "cell"
        let row = indexPath.row
        
        //vorhandene Zelle wiederverwenden oder eine neue Zelle erzeugen
        var cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier) as UITableViewCell?
        if (cell == nil) {
            cell = UITableViewCell(style:  .subtitle, reuseIdentifier: reuseIdentifier)
        }
        //Titel und Autor in der Zell anzeigen
        cell!.textLabel?.text = "\(books[row].rank). \(books[row].title)"
        cell!.detailTextLabel?.text = books[row].author
        return cell!
    }
    //Höhe der Tabellenzellen
    @objc(tableView:heightForRowAtIndexPath:)
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 40.0
    }
}

extension ViewController : UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "segueToDetailView", sender: self)
    }
}

