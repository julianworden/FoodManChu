//
//  ViewController.swift
//  FoodManChu
//
//  Created by Julian Worden on 7/22/22.
//

/* Hi Nate! Thanks for checking out my project, the app is fully functional
 but there are some things that I'm still struggling with and I think most
 of these things would be fixed if I had built everything on more of a solid
 foundation. I use a lot of Combine and MVVM here, but I'm not sure if any of it
 is done properly (even though almost all of it works just fine). Most of the remaining bugs are
 in the AddEditRecipeViewController and they are as follows, I'd appreciate some suggestions!

 - This isn't a bug, but the structure of the cellForRowAt method in the
 AddEditRecipeViewController+UITableViewDataSource.swift file looks awful. Any overall suggestions
 for improving it would be great even if that means creating that table view a completely different way,
 because I have a feeling that if I made that better it'd fix (or at least make it easier to fix) a lot
 of the bugs I'm about to mention
 - Generally strange cell reloading behavior in AddEditRecipeViewController (see video I sent
 in Discord for more context). In short, reloading a cell at one index path reloads a cell at an
 unexpected, different index path. Additionally, reloading the entire table view causes the cells' sub views
 to get offset. For example, the placeholder text for one cell will somehow end up on top of the placeholder
 text in another cell. Again, you can see examples of all of this in that video.
 - When I tap the Save button in the AddEditRecipeViewController with any empty fields,
 it properly triggers my alert to show the user they need to fill all fields. However,
 this alert dismisses immediately on its own and I can't figure out why. I also can't seem to find
 anybody experiencing this issue in quite this way in any forums.
 - The Ingredients List and Category cells in AddEditRecipeViewController erase their contents when
 they're dequeued and scrolled off screen, but only when creating a new recipe (you will not see
 this behavior if you edit an already existing recipe). I was able to fix this with the other cells, but I
 can't figure out how to fix this on the Ingredients List and Category cells. To see this behavior, add
 ingredients to a recipe or change the recipe's category and then scroll high enough that the cell is dequeued
 (this is easier to do in an iPhone SE simulator). The recipe list should now be blank and the category picker should be
 reset to its default value. I've tried all kinds of things to fix this but can't get it to work.
*/

import Combine
import UIKit

class HomeViewController: UIViewController {
    let viewModel = HomeViewModel()
    var subscribers = Set<AnyCancellable>()

    let tableView = UITableView(frame: CGRect.zero, style: .grouped)
    let searchController = UISearchController(searchResultsController: nil)

    override func viewDidLoad() {
        super.viewDidLoad()

        configureSubscribers()
        viewModel.fetchRecipes()
        configureViews()
        layoutViews()
    }

    func configureViews() {
        view.backgroundColor = .white
        title = "Recipes"
        definesPresentationContext = true
        let addRecipeButton = UIBarButtonItem(barButtonSystemItem: .add,
                                              target: self,
                                              action: #selector(addRecipeTapped))
        navigationItem.rightBarButtonItem = addRecipeButton
        navigationItem.leftBarButtonItem = editButtonItem
        navigationItem.searchController = searchController
        navigationItem.largeTitleDisplayMode = .always

        searchController.searchResultsUpdater = self
        searchController.delegate = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Search Recipes"

        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(RecipeTableViewCell.self, forCellReuseIdentifier: Constants.homeCellReuseIdentifier)
        tableView.backgroundColor = .white
    }

    @objc func addRecipeTapped() {
        let addEditRecipeViewController = AddEditRecipeViewController()
        let addEditRecipeViewModel = AddEditRecipeViewModel(recipeToEdit: nil)
        let addEditRecipeNavigationController = UINavigationController(rootViewController: addEditRecipeViewController)

        addEditRecipeViewModel.recipeFormValidationDelegate = addEditRecipeViewController
        addEditRecipeViewController.title = "Add Recipe"
        addEditRecipeViewController.viewModel = addEditRecipeViewModel
        present(addEditRecipeNavigationController, animated: true)
    }
}

// MARK: - Constraints

extension HomeViewController {
    func layoutViews() {
        view.addSubview(tableView)

        tableView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
}

// MARK: - Combine

// swiftlint:disable force_cast
extension HomeViewController {
    func configureSubscribers() {
        subscribers = [
            viewModel.$updatedControllerIndexPath
                .sink(receiveValue: { [weak self] indexPath in
                    if let indexPath = indexPath {
                        switch self?.viewModel.controllerChangeType {
                        case .delete:
                            self?.tableView.beginUpdates()
                            self?.tableView.deleteRows(at: [indexPath], with: .none)
                            self?.tableView.endUpdates()
                        case .insert:
                            self?.tableView.insertRows(at: [indexPath], with: .none)
                            self?.tableView.reloadData()

                        case .update:
                            let cell = self?.tableView.cellForRow(at: indexPath) as! RecipeTableViewCell
                            self?.configureCell(cell, indexPath: indexPath)
                            self?.tableView.reloadData()

                        case .move:
                            self?.tableView.insertRows(at: [indexPath], with: .none)
                            self?.tableView.reloadData()

                        default:
                            break
                        }
                    }
                })
        ]
    }
}
