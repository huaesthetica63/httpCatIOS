import UIKit

class ViewController: UIViewController {
    private let catURL: String = "https://http.cat"//url to funny cats
    private let imageView: UIImageView = { //imagebox for holding cats
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.backgroundColor = .white
        return imageView
    }()
    private let randButton: UIButton = { //button for getting more funny cats
        let randButton = UIButton()
        randButton.backgroundColor = .white
        randButton.setTitle("Random HTTP-Cat!", for: .normal)
        randButton.setTitleColor(.black, for: .normal)
        return randButton
    }()
    override func viewDidLoad() { //init
        super.viewDidLoad()
        view.backgroundColor = .systemGreen
        view.addSubview(imageView)
        imageView.frame = CGRect(x: 0, y: 0, width: 300, height: 300)
        imageView.center = view.center
        view.addSubview(randButton)
        randButton.addTarget(self, action: #selector(randCatButtonPushed), for: .touchUpInside)
        httpCat()
    }
    @objc func randCatButtonPushed(){
        httpCat() //set an image from url
    }
    override func viewDidLayoutSubviews() { //set random button to normal position
        super.viewDidLayoutSubviews()
        randButton.frame = CGRect(x: 30, y: view.frame.size.height-100-view.safeAreaInsets.bottom, width: view.frame.size.width-50, height: 50)
    }
    func httpCat(){//get image from url
        var code = Int(HTTPStatusCode.allCases.randomElement()?.rawValue ?? 0)
        //get random status code from enumeration
        var url = URL(string: catURL+"//"+"\(code)")!
        if let data = try? Data(contentsOf: url) {
            imageView.image = UIImage(data: data)//set an image
        }
    }
}
