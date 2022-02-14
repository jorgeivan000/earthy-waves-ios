//
//  EarthquakesViewController.swift
//  EarthyWaves
//
//  Created by Jorge Ivan Herrera Camara on 10/02/22.
//
import UIKit

class EarthquakesViewController: UIViewController {
    
    // MARK: - Views
    lazy var earthquakesTableView: UITableView = { return UITableView(frame: .zero)}()
    // MARK: - Variables
    var earthquakes: [Earthquake] = []
    // MARK: - Presenter
    fileprivate var presenter: EarthquakesPresenter?
    
    override func loadView() {
        super.loadView()
        applyViewCode()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter = EarthquakesPresenter(view: self, earthquakeService: EarthquakesAPI())
        earthquakesTableView.delegate = self
        earthquakesTableView.dataSource = self
        earthquakesTableView.register(EarthquakeTableViewCell.self, forCellReuseIdentifier: EarthquakeTableViewCell.cellId)
        configureViews()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        presenter?.getEarthquakes()
    }
}

// MARK: - ViewCodeConfiguration
extension EarthquakesViewController: ViewCodeConfiguration {
    func buildHierarchy() {
        view.addSubview(earthquakesTableView)
    }
    
    func setupConstraints() {
        self.earthquakesTableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            earthquakesTableView.topAnchor.constraint(equalTo: self.view.topAnchor),
            earthquakesTableView.rightAnchor.constraint(equalTo: self.view.rightAnchor),
            earthquakesTableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            earthquakesTableView.leftAnchor.constraint(equalTo: self.view.leftAnchor)
        ])
    }
    
    func configureViews() {
        self.title = InfoPlistHelper.lookUpFor(.appName) as? String
        self.earthquakesTableView.separatorStyle = .none
    }
}

// MARK: - EarthquakesView
extension EarthquakesViewController: EarthquakesView {
    func showAlert(title: String, message: String, action: String) {
        DispatchQueue.main.async {
            let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: action, style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    func updateEarthquakesList(earthquakes: [Earthquake]) {
        DispatchQueue.main.async {
            self.earthquakes = earthquakes
            self.earthquakesTableView.reloadData()
        }
    }
}

// MARK: - UITableViewDelegate
extension EarthquakesViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView,
                   heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100.0
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let earthquakeDetailViewController = EarthquakeDetailViewController()
        earthquakeDetailViewController.earthquake = earthquakes[indexPath.row]
        self.navigationController?.pushViewController(earthquakeDetailViewController, animated: true)
    }
}

// MARK: - UITableViewDataSource
extension EarthquakesViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return earthquakes.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: EarthquakeTableViewCell.cellId, for: indexPath) as! EarthquakeTableViewCell
        cell.earthquake = earthquakes[indexPath.row]
        cell.updateView()
        return cell
    }
}
