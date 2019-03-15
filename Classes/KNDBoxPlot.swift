//
//  KNDBoxPlot.swift
//  KNDBoxPlot_Example
//
//  Created by Rogelio Contreras on 2/27/19.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import UIKit

@IBDesignable
public class KNDBoxPlotController: UIView {

    /// The position of main value
    @IBOutlet weak var currentPositionView: UIView!
    /// Used to show a rounded mark at the top of the main position
    @IBOutlet weak var roundedTopView: UIView! {
        didSet {
            roundedTopView.layer.cornerRadius = roundedTopView.frame.width/2
        }
    }
    
    /// The Horizontal line of the chart
    @IBOutlet weak var barLenght: UIView!
    /// The box of the graph.
    @IBOutlet weak var boxPlot: UIView!
    /// Background of the control
    @IBOutlet var contentView: UIView!
    /// Left border
    @IBOutlet weak var leftLine: UIView!
    /// Right Border
    @IBOutlet weak var rightLine: UIView!
    /// Initial value below left border
    @IBOutlet weak var startValueLabel: UILabel!
    /// Final value below right border
    @IBOutlet weak var endValueLabel: UILabel!
    /// Title for the control
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var boxHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var boxWidthConstraint: NSLayoutConstraint!
    @IBOutlet weak var boxLeftSpaceConstraint: NSLayoutConstraint!
    @IBOutlet weak var currentPosLeftSpaceConstraint: NSLayoutConstraint!
    
    /// Border radius of the Box Plot
    @IBInspectable
    public var boxRadius : CGFloat = 2.0 {
        didSet{
            self.boxPlot.layer.cornerRadius = boxRadius
        }
    }
    
    /// Use this option if you want to hide the box.
    @IBInspectable
    public var showBoxPlot : Bool = true {
        didSet {
            self.boxPlot.isHidden = !showBoxPlot
        }
    }
    
    /// Change main color of the box. Default is blue.
    @IBInspectable
    public var boxColor : UIColor = UIColor.blue {
        didSet {
            self.boxPlot.backgroundColor = boxColor
        }
    }
    
    /// Change the color of main position mark. Default is dark gray.
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
    
    /// Change the color of lines of the chart.
    @IBInspectable
    public var linesColor : UIColor = UIColor.darkGray {
        didSet {
            self.barLenght.backgroundColor = linesColor
            self.leftLine.backgroundColor = linesColor
            self.rightLine.backgroundColor = linesColor
        }
    }
    
    /// Main Position
    @IBInspectable
    public var currentPosition : CGFloat = 1 {
        didSet {
            setup()
        }
    }
    
    /// Start position on X of the box plot. Percentage 0 to 100.
    @IBInspectable
    public var startValue : CGFloat = 1 {
        didSet {
            setup()
        }
    }
    
    /// End position on X of the box plot. Percentage 0 to 100.
    @IBInspectable
    public var endValue : CGFloat = 10 {
        didSet {
            setup()
        }
    }
    
    /// Height of box plot in points.
    @IBInspectable
    public var boxHeight : CGFloat = 40 {
        didSet {
            self.boxHeightConstraint.constant = boxHeight
            setup()
        }
    }
    
    /// Display or hide labels.
    @IBInspectable
    public var showLegend : Bool = true {
        didSet {
            self.startValueLabel.isHidden = !showLegend
            self.endValueLabel.isHidden = !showLegend
            self.titleLabel.isHidden = !showLegend
        }
    }
    
    /// Title of the chart.
    @IBInspectable
    public var title : String = "Box Plot" {
        didSet {
            self.titleLabel.text = title
        }
    }
    
    /// Value of Start Label. Isn't show if Show Legend is false
    @IBInspectable
    public var initialChartValue : String = "0" {
        didSet {
            self.startValueLabel.text = initialChartValue
        }
    }
    
    /// Value of End Label. Isn't show if Show Legend is false
    @IBInspectable
    public var finalChartValue : String = "100" {
        didSet {
            self.endValueLabel.text = finalChartValue
        }
    }
    
    /// Calculates box plot size.
    func setup() {
        self.barLenght.updateConstraints()
        
        let start = ((self.frame.width*0.95)/100) * startValue
        let width = ((self.frame.width*0.95)/100) * endValue
        let startPosition = ((self.frame.width*0.95)/100) * currentPosition
        
        self.boxLeftSpaceConstraint.constant = start
        self.boxWidthConstraint.constant = width-start
        self.currentPosLeftSpaceConstraint.constant = startPosition
    }
    
    override public func layoutSubviews() {
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
    
    /// Check pod bundle and load xib file.
    private func commonInit() {
        let podBundle = Bundle(for: self.classForCoder)
        if let bundle = Bundle(url: podBundle.bundleURL) {
            bundle.loadNibNamed("BoxPlot2", owner: self, options: nil)
            addSubview(contentView)
            contentView.frame = self.bounds
            contentView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        }else {
            assertionFailure("Could not load the bundle")
        }
    }
}
