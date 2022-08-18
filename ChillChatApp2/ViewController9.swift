//
//  ViewController9.swift
//  ChillChatApp2
//
//  Created by Scholar on 8/18/22.
//

import UIKit

class ViewController9: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet var table:UITableView!
    @IBOutlet var label: UILabel!
    
    var models: [(title: String,note: String)] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        table.delegate = self
        table.dataSource = self
        title = "Notes"
    
    }
    @IBAction func didTapNewNote(){
        guard let vc = storyboard?.instantiateViewController(identifier: "new") as? EntryViewController else{
                return
        }
        vc.title = "New Note"
        vc.navigationItem.largeTitleDisplayMode = .never
        vc.completion = { noteTitle, note in self.models.append((title: noteTitle, note: note))
            self.navigationController?.popToRootViewController(animated: true)
            self.label.isHidden = true
            self.table.isHidden = false
            
            
        }
        navigationController?.pushViewController(vc, animated: true)
    }
    
    //Table
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
    return models.count
}

func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
    let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
    cell.textLabel?.text = models[indexPath.row].title
    cell.detailTextLabel?.text = models[indexPath.row].note

    return cell
}

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        tableView.deselectRow(at: indexPath, animated: true)
    
    //Show note controller
    
        guard let vc = storyboard?.instantiateViewController(identifier: "note")as? NoteViewController else{
            return
        }
        vc.title = "Note"
        navigationController?.pushViewController(vc,animated: true)



    }
}
