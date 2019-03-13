//
//  KNDBoxPlot.swift
//  KNDBoxPlot_Example
//
//  Created by Rogelio Contreras on 2/27/19.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import UIKit

@IBDesignable
class KNDBoxPlot: UIView {

    @IBOutlet weak var currentPositionView: UIView!
    @IBOutlet weak var roundedTopView: UIView!
    
    @IBOutlet weak var barLenght: UIView!
    @IBOutlet weak var boxPlot: UIView!
    @IBOutlet var contentView: UIView!
    @IBOutlet weak var leftLine: UIView!
    @IBOutlet weak var rightLine: UIView!
    @IBOutlet weak var startValueLabel: UILabel!
    @IBOutlet weak var endValueLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var boxHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var boxWidthConstraint: NSLayoutConstraint!
    @IBOutlet weak var boxLeftSpaceConstraint: NSLayoutConstraint!
    @IBOutlet weak var currentPosLeftSpaceConstraint: NSLayoutConstraint!
    
    @IBInspectable
    public var boxRadius : CGFloat = 2.0 {
        didSet{
            self.boxPlot.layer.cornerRadius = boxRadius
        }
    }
    
    @IBInspectable
    public var showBoxPlot : Bool = true {
        didSet {
            self.boxPlot.isHidden = !showBoxPlot
        }
    }
    
    @IBInspectable
    public var boxColor : UIColor = UIColor.blue {
        didSet {
            self.boxPlot.backgroundColor = boxColor
        }
    }
    
    @IBInspectable
    public var currentColor : UIColor = UIColor.darkGray {
        didSet {
            self.currentPositionView.backgroundColor = currentColor
            self.roundedTopView.backgroundColor = currentColor
            self.startValueLabel.textColor = currentColor
            self.endValueLabel.textColor = currentColor
            self.titleLabel.textColor = currentColor
        }
    }
    
    @IBInspectable
    public var linesColor : UIColor = UIColor.darkGray {
        didSet {
            self.barLenght.backgroundColor = linesColor
            self.leftLine.backgroundColor = linesColor
            self.rightLine.backgroundColor = linesColor
        }
    }
    
    @IBInspectable
    public var currentPosition : CGFloat = 1 {
        didSet {
            setup()
        }
    }
    
    @IBInspectable
    public var startValue : CGFloat = 1 {
        didSet {
            setup()
        }
    }
    
    @IBInspectable
    public var endValue : CGFloat = 10 {
        didSet {
            setup()
        }
    }
    
    @IBInspectable
    public var boxHeight : CGFloat = 40 {
        didSet {
            self.boxHeightConstraint.constant = boxHeight
            setup()
        }
    }
    
    @IBInspectable
    public var showLegend : Bool = true {
        didSet {
            self.startValueLabel.isHidden = !showLegend
            self.endValueLabel.isHidden = !showLegend
            self.titleLabel.isHidden = !showLegend
        }
    }
    
    @IBInspectable
    public var title : String = "Box Plot" {
        didSet {
            self.titleLabel.text = title
        }
    }
    
    func setup() {
        self.barLenght.updateConstraints()
        
        let start = ((self.frame.width*0.95)/100) * startValue
        let width = ((self.frame.width*0.95)/100) * endValue
        let startPosition = ((self.frame.width*0.95)/100) * currentPosition
        
        self.boxLeftSpaceConstraint.constant = start
        self.boxWidthConstraint.constant = width-start
        self.currentPosLeftSpaceConstraint.constant = startPosition
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setup()
        super.layoutSubviews()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    private func commonInit() {
        Bundle.main.loadNibNamed("BoxPlot2", owner: self, options: nil)
        addSubview(contentView)
        contentView.frame = self.bounds
        contentView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
    }
}
