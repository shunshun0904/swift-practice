//
//  AddTaskViewController.swift
//  todoapp
//
//  Created by 中村俊 on 2017/05/12.
//  Copyright © 2017年 中村俊. All rights reserved.
//

import UIKit

class AddTaskViewController: UIViewController {

    @IBOutlet weak var textfield: UITextField!
    @IBOutlet weak var categorySegment: UISegmentedControl!
    
    // MARK: -
    
    var taskCategory = "研究"
    var context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    var task: Task?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // taskに値が代入されていたら、textFieldとsegmentedControlにそれを表示
        if let task = task {
            textfield.text = task.name
            taskCategory = task.category!
            switch task.category! {
            case "研究":
                categorySegment.selectedSegmentIndex = 0
            case "講義課題":
                categorySegment.selectedSegmentIndex = 1
            case "その他":
                categorySegment.selectedSegmentIndex = 2
            default:
                categorySegment.selectedSegmentIndex = 0
            }
        }
        // Do any additional setup after loading the view.
    }

    @IBAction func addTask(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func categoryChosen(_ sender: UISegmentedControl) {
        // choose category of task
        switch sender.selectedSegmentIndex {
        case 0:
            taskCategory = "研究"
        case 1:
            taskCategory = "講義課題"
        case 2:
            taskCategory = "その他・課題"
        default:
            taskCategory = "研究"
        }
    }
    
    @IBAction func plusButtonTapped(_ sender: Any) {
            let taskName = textfield.text
            if taskName == "" {
                dismiss(animated: true, completion: nil)
                return
            }
            
            // 受け取った値が空であれば、新しいTask型オブジェクトを作成する
            if task == nil {
                task = Task(context: context)
            }
            
            // 受け取ったオブジェクト、または、先ほど新しく作成したオブジェクトそのタスクのnameとcategoryに入力データを代入する
            if let task = task {
                task.name = taskName
                task.category = taskCategory
            }
            
            // 変更内容を保存する
            (UIApplication.shared.delegate as! AppDelegate).saveContext()
            
            dismiss(animated: true, completion: nil)
        
    }
    
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
}
