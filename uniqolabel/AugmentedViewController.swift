//
//  AugmentedViewController.swift
//  uniqolabel
//
//  Created by Choudhary, Subham on 23/12/18.
//  Copyright © 2018 Choudhary, Subham. All rights reserved.
//

import UIKit
import ARKit

class AugmentedViewController: UIViewController {

    //MARK: OUTLETS
    @IBOutlet weak var scnView: ARSCNView!
    
    //MARK: VARS AND LETS
    var pointerNode = SCNNode()
    var sceneNode: SCNNode?
    
    var session: ARSession {
        return scnView.session
    }
    var screenCenter: CGPoint {
        let bounds = scnView.bounds
        return CGPoint(x: bounds.midX, y: bounds.midY)
    }
    
    //MARK: VIEW LIFE CYCLE
    override func viewDidLoad() {
        super.viewDidLoad()
        setupAR()
        setupPointerNode()
    }

    // MARK: BUTTON ACTIONS
    @IBAction func showAction(_ sender: Any) {
        if let _ = sceneNode {
            sceneNode!.position = pointerNode.position
        } else {
            setupChairNode()
        }
    }
    
    // MARK: CUSTOM FUNCTIONS
    func setupAR() {
        self.scnView.autoenablesDefaultLighting = true
        let configuration = ARWorldTrackingConfiguration()
        configuration.planeDetection = [.horizontal]
        self.scnView.session.run(configuration)
    }
    
    func setupPointerNode() {
        pointerNode = SCNNode(geometry: SCNPlane(width: 0.4, height: 0.4))
        pointerNode.geometry?.firstMaterial?.diffuse.contents = UIImage.init(imageLiteralResourceName: "pointer4")
        pointerNode.eulerAngles = SCNVector3Make(0,.pi/2,.pi/2)
        scnView.scene.rootNode.addChildNode(pointerNode)
    }
    
    func resetPointerNode() {
        DispatchQueue.main.async {
            if let hitTestResult = self.scnView.hitTest(self.screenCenter, types: [.existingPlane,.estimatedHorizontalPlane]).first {
                let transform = hitTestResult.worldTransform
                let thirdColumn = transform.columns.3
                self.pointerNode.position = SCNVector3Make(thirdColumn.x, thirdColumn.y, thirdColumn.z)
            }
        }
    }
    
    func setupChairNode() {
        let scene = SCNScene(named: "chair/chair.scn")
        if let scnnode = scene?.rootNode.childNode(withName: "chair", recursively: true) {
            sceneNode = scnnode
            sceneNode!.scale = SCNVector3(0.5, 0.5, 0.5)
            sceneNode!.position = pointerNode.position
            scnView.scene.rootNode.addChildNode(sceneNode!)
        }
    }
}

extension AugmentedViewController: ARSCNViewDelegate {
    
    func renderer(_ renderer: SCNSceneRenderer, updateAtTime time: TimeInterval) {
        resetPointerNode()
    }
}
