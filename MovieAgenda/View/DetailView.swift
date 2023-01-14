//
//  Detail.swift
//  MovieAgenda
//
//  Created by Ricardo Venieris on 19/10/22.
//

import UIKit

class DetailView: UIView {
    var result:MDBResult
    
    lazy var backdrop:UIImageView = {
        let view = UIImageView()
        view.image = UIImage(systemName: "film", withConfiguration:UIImage.SymbolConfiguration(weight: .light))
        view.contentMode = .scaleAspectFill
        view.clipsToBounds = true
        view.layer.cornerRadius = 0
        view.backgroundColor = .lightGray
        self.loadBackdrop()
        return view
    }()
    

    
    lazy var id               = createLabel(content: result.id, alignment: .center)
    lazy var title            = createLabel(content: result.title ?? result.name, alignment: .center, fontSize: 35)
    lazy var originalTitle    = createLabel(content: result.originalTitle ?? result.originalName, alignment: .center)
    lazy var mediaType        = createLabel(name: "Media Type", content: result.mediaType.rawValue.uppercased(), alignment: .center)
    lazy var voteAverage      = createLabel(name: "Vote Average", content: String(round(result.voteAverage! * 10) / 10.0) + " (\(result.voteCount!) votes)", alignment: .center)
//    lazy var voteCount        = createLabel(name: "Total Votes", content: result.voteCount, alignment: .center)
    lazy var releaseDate     = createLabel(name: "Release Date", content: result.firstAirDate ?? result.releaseDate, alignment: .center)
    lazy var popularity       = createLabel(name: "Popularity", content: result.popularity, alignment: .center)
    lazy var overview         = createLabel(name: "Sinopse", content: "\n"+(result.overview ?? ""), alignment: .justified)

    var viewArray: [UIView] {
        [title,id,mediaType,voteAverage,releaseDate,popularity, overview]
    }
    
    
    lazy var scrollWarning: UILabel = {
        let label = UILabel()
        label.text = "Keep Scrolling to Dismiss"
        label.font = UIFont.boldSystemFont(ofSize: 30)
        label.alpha = 0
        return label
    }()
    
    lazy var stackView:UIStackView = {
        var stack = UIStackView(arrangedSubviews: viewArray)
        return stack
    }()
    
    lazy var scrollView: UIScrollView = {
        var scrollView = UIScrollView(frame: CGRect.zero)
        scrollView.addSubview(stackView)
        return scrollView
    }()
  

    init(result: MDBResult) {
        self.result = result
        super.init(frame: UIScreen.main.bounds)
        backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        addSubview(backdrop) //500 × 281
        addSubview(scrollView)
        addSubview(scrollWarning)
        
        
        let margins = self.layoutMarginsGuide
        
        
        backdrop.translatesAutoresizingMaskIntoConstraints=false
        backdrop.topAnchor.constraint(equalTo: margins.topAnchor).isActive = true
        backdrop.widthAnchor.constraint(equalTo: self.widthAnchor).isActive = true
        backdrop.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        backdrop.heightAnchor.constraint(equalTo: self.widthAnchor, multiplier: 281/500).isActive = true
//
        
        scrollView.translatesAutoresizingMaskIntoConstraints=false
        scrollView.topAnchor.constraint(equalTo: backdrop.bottomAnchor, constant: 10).isActive = true
        scrollView.widthAnchor.constraint(equalTo: self.widthAnchor, constant: -30).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: margins.bottomAnchor).isActive = true
        scrollView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        
        scrollWarning.translatesAutoresizingMaskIntoConstraints = false
        scrollWarning.topAnchor.constraint(equalTo: scrollView.topAnchor).isActive = true
        scrollWarning.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        
        
        overview.translatesAutoresizingMaskIntoConstraints = false
//        overview.heightAnchor.constraint(equalToConstant: 400).isActive = true
//        overview.widthAnchor.constraint(equalTo: self.widthAnchor, constant: -60).isActive = true
        
//        addContraints(to: id, under: backdrop)
//        addContraints(to: title, under: id)
//        addContraints(to: originalTitle, under: title)
//        addContraints(to: mediaType, under: originalTitle)
//        addContraints(to: voteAverage, under: mediaType)
//        addContraints(to: voteCount, under: voteAverage)
//        addContraints(to: releaseDate, under: voteCount)
//        addContraints(to: popularity, under: releaseDate)
        stackView.translatesAutoresizingMaskIntoConstraints=false
//        stackView.topAnchor.constraint(equalTo: backdrop.bottomAnchor).isActive = true
        stackView.widthAnchor.constraint(equalTo: scrollView.widthAnchor, constant: -10).isActive = true
        stackView.spacing = 30
//        stackView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        stackView.heightAnchor.constraint(greaterThanOrEqualTo: self.heightAnchor).isActive = true
        stackView.axis = .vertical
        stackView.distribution = .fillProportionally
        stackView.setCustomSpacing(2, after: title)

//        stackView.backgroundColor = UIColor.red
//        stackView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
//        stackView.heightAnchor.constraint(equalTo: self.widthAnchor, multiplier: 281/500).isActive = true
        
//        overview.translatesAutoresizingMaskIntoConstraints=false
//        overview.widthAnchor.constraint(equalTo: margins.widthAnchor, constant: -10).isActive = true
//        overview.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
//        overview.topAnchor.constraint(equalTo: popularity.bottomAnchor).isActive = true
//        overview.bottomAnchor.constraint(equalTo: margins.bottomAnchor).isActive = true
//        overview.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0.7970698275)

    }
    
    func addContraints(to view1:UILabel, under view2: UIView ) {
        let margins = self.layoutMarginsGuide
        view1.translatesAutoresizingMaskIntoConstraints=false
        view1.widthAnchor.constraint(equalTo: margins.widthAnchor, constant: -10).isActive = true
        view1.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        view1.topAnchor.constraint(equalTo: view2.bottomAnchor, constant: 2).isActive = true
        view1.heightAnchor.constraint(equalToConstant: view1.font.pointSize).isActive = true
        view1.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0.7970698275)
    }
    
    
    func createLabel<T>(name:String? = nil, content:T?, alignment: NSTextAlignment, fontSize: CGFloat = 20)->UILabel {
        var wrappedContent:String = "no data"
//        if content is Double {
//        }
        if let content {wrappedContent = "\(content)"}
        
        let attText = NSMutableAttributedString()
        let attSpace = NSMutableAttributedString(string: (name == nil) ? "" : ": ")
        let attributes:[NSAttributedString.Key : Any] = [
                   .font : UIFont.boldSystemFont(ofSize: fontSize)
               ]
        
        let attName = NSMutableAttributedString(string:name ?? "", attributes: attributes)
        let attContent = NSMutableAttributedString(string: wrappedContent, attributes: (name == nil) ? attributes : nil)
        
        attText.append(attName)
        attText.append(attSpace)
        attText.append(attContent)
        
              
        let label = UILabel()
       
//        label.text = "\(name): \(wrappedContent)"
        label.attributedText = attText
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.textAlignment = alignment
//        label.adjustsFontSizeToFitWidth = true
//        label.minimumScaleFactor = 0.1
        return label

    }
    
    func loadBackdrop() {
        TMDBService.defaultInstance.requestImage(from: result.backdropPath, then: {result in
            switch result {
                case .success(let data):
                    DispatchQueue.main.async {
                        self.backdrop.image = UIImage(data: data)
                    }
                case .failure(let error):
                    debugPrint(error)
            }
            
        })
    }
    
    
    required init?(coder: NSCoder) {
        self.result = MDBResult(id: 0, originalTitle: nil, mediaType: .movie, title: nil, releaseDate: nil, video: nil, originalLanguage: nil, originalName: nil, popularity: nil, firstAirDate: nil, originCountry: nil)
        super.init(coder: coder)
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        
//        stackView.layoutSubviews()
        scrollView.contentSize = stackView.frame.size
    }
}

