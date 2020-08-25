//
//  ViewController.swift
//  SwiftUIARView
//
//  Created by Jose Fernandez del Valle on 8/24/20.
//  Copyright © 2020 me.fernandez.jose. All rights reserved.
//

import UIKit
import SceneKit
import ARKit
import SwiftUI

class ViewController: UIViewController, ARSCNViewDelegate {

    @IBOutlet var sceneView: ARSCNView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set the view's delegate
        sceneView.delegate = self
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Create a session configuration
        let configuration = ARImageTrackingConfiguration()
        
        if let imagesToTrack = ARReferenceImage.referenceImages(inGroupNamed: "AR Resources", bundle: Bundle.main) {
            
            configuration.trackingImages = imagesToTrack
            
            //this tells AR how many images to track simultaneously
            configuration.maximumNumberOfTrackedImages = 1
            
            
        }

        // Run the view's session
        sceneView.session.run(configuration)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // Pause the view's session
        sceneView.session.pause()
    }

    // MARK: - ARSCNViewDelegate
    

    // Override to create and configure nodes for anchors added to the view's session.
    func renderer(_ renderer: SCNSceneRenderer, nodeFor anchor: ARAnchor) -> SCNNode? {
        let node = SCNNode()
        
        // cast the found anchor as an image anchor
        guard let imageAnchor = anchor as? ARImageAnchor else {return nil}
        
        // get the name of the image from the anchor
        guard let imageName = imageAnchor.name else { return nil}
        
        // check if the name of the detected image is the one I want
        if imageName == "profile" {
            
            let plane = SCNPlane(width: imageAnchor.referenceImage.physicalSize.width,
                                 height: imageAnchor.referenceImage.physicalSize.height)
            
            let planeNode = SCNNode(geometry: plane)
            
            //when a plane geometry is created by default it is oriente vertical so we have to rotate on x axis by 90 degrees to make it flat to the image
            planeNode.eulerAngles.x = -.pi / 2
            
            createHostingController(for: planeNode)
            
            node.addChildNode(planeNode)
            
            return node
            
        } else {
     
        return nil
    }

    }
    
    
    
    func createHostingController(for node: SCNNode) {
        
        // create a hosting controller with swiftUI view
        let arVC = UIHostingController(rootView: SwiftUIViewARCardView())
        
        // do this on the main thread
        DispatchQueue.main.async {
            arVC.willMove(toParent: self)
            //make the hosting VC a child to the main controller
            self.addChild(arVC)
            
            
            //set the pixel size of the card view
            arVC.view.frame = CGRect(x: 0, y: 0, width: 500, height: 500)
            
            // add the card view as a subview to the main view
            self.view.addSubview(arVC.view)
            
            //render the view on the plain geometry as a material
            self.show(hostingVC: arVC, on: node)
            
        }
        
        
    }
    
    
    func show(hostingVC: UIHostingController<SwiftUIViewARCardView>, on node: SCNNode) {
        
        //create a new material
        let material = SCNMaterial()
        
        // this allows the card to render transparent cards the right way
        hostingVC.view.isOpaque = false
        
        // set the difuse of the material to the view of the hosting controller
        material.diffuse.contents = hostingVC.view
        
        // set the material to the geometry of the node
        node.geometry?.materials = [material]
        
        hostingVC.view.backgroundColor = UIColor.clear
        
    }
    
    
    
    
    
    func session(_ session: ARSession, didFailWithError error: Error) {
        // Present an error message to the user
        
    }
    
    func sessionWasInterrupted(_ session: ARSession) {
        // Inform the user that the session has been interrupted, for example, by presenting an overlay
        
    }
    
    func sessionInterruptionEnded(_ session: ARSession) {
        // Reset tracking and/or remove existing anchors if consistent tracking is required
        
    }
}
