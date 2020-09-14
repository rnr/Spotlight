//
//  AntiSpotlightView.swift
//  Spotlight
//
//  Created by Anton Yarmolenko on 9/14/20.
//  Copyright © 2020 Lekshmi Raveendranathapanicker. All rights reserved.
//

import UIKit

class AntiSpotlightView: SpotlightView {
    override func appearAnimation(_ duration: TimeInterval, node: SpotlightNode) -> CAAnimation {
        let beginPath = invert(path: maskPath(node.target.infinitesmalPath(node: node, translater: self)))
        let endPath = invert(path: maskPath(node.target.path(node: node, translater: self)))
        return pathAnimation(duration, beginPath: beginPath, endPath: endPath)
    }

    override func disappearAnimation(_ duration: TimeInterval, node: SpotlightNode) -> CAAnimation {
        let endPath = invert(path: maskPath(node.target.infinitesmalPath(node: node, translater: self)))
        return pathAnimation(duration, beginPath: nil, endPath: endPath)
    }

    override func moveAnimation(_ duration: TimeInterval, toNode: SpotlightNode) -> CAAnimation {
        let endPath = invert(path: maskPath(toNode.target.path(node: toNode, translater: self)))
        return pathAnimation(duration, beginPath: nil, endPath: endPath)
    }
    
    func invert(path: UIBezierPath) -> UIBezierPath {
        let revertedPath = path.reversing()
        let resultPath = UIBezierPath(rect: bounds)
        resultPath.append(revertedPath)
        return resultPath
    }
}
