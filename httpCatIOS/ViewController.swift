import UIKit

class ViewController: UIViewController {
    private let catURL: String = "https://http.cat"//url to funny cats
    public var catCode: Int = -1
    private let imageView: UIImageView = { //imagebox for holding cats
        let imageView = UIImageView()
        imageView.isUserInteractionEnabled = true
        imageView.contentMode = .scaleAspectFill
        imageView.backgroundColor = .white
        return imageView
    }()
    @objc func slideRight(_ sender: UISwipeGestureRecognizer){
        if catCode >= 1{
            catCode=catCode-1
            httpCat(code: catCode)
        }
    }
    @objc func slideLeft(_ sender: UISwipeGestureRecognizer){
        if catCode < HTTPStatusCode.allCases.count-1{
            catCode=catCode+1
            httpCat(code: catCode)
        }
    }
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
        var slideLeft = UISwipeGestureRecognizer(target: self, action: #selector(slideLeft(_:)))
        slideLeft.direction = .left
        imageView.addGestureRecognizer(slideLeft)
        var slideRight = UISwipeGestureRecognizer(target: self, action: #selector(slideRight(_:)))
        slideRight.direction = .right
        imageView.addGestureRecognizer(slideRight)
        
        view.addSubview(randButton)
        randButton.addTarget(self, action: #selector(randCatButtonPushed), for: .touchUpInside)
        if catCode == -1{
            catCode = getRandomHttp()
        }
        httpCat(code: catCode)
    }
    @objc func randCatButtonPushed(){
        httpCat(code: getRandomHttp()) //set an image from url
    }
    override func viewDidLayoutSubviews() { //set random button to normal position
        super.viewDidLayoutSubviews()
        randButton.frame = CGRect(x: 30, y: view.frame.size.height-100-view.safeAreaInsets.bottom, width: view.frame.size.width-50, height: 50)
    }
    func getRandomHttp()->Int{
        var code = Int.random(in: 0..<HTTPStatusCode.allCases.count)
        //get random status code from enumeration
        return code
    }
    func httpCat(code: Int){//get image from url
        let httpcode = HTTPStatusCode.allCases[code].rawValue
        var url = URL(string: catURL+"//"+"\(httpcode)")!
        if let data = try? Data(contentsOf: url) {
            imageView.image = UIImage(data: data)//set an image
        }
    }
}
