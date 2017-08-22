/*
 * CollectionViewItem.swift
 * SlidesMagic
 *
 * Created by Gabriel Miro on Oct 2016.
 * Copyright (c) 2016 Razeware LLC
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 * THE SOFTWARE.
 */

import Cocoa

class CollectionViewItem: NSCollectionViewItem {
    
    override var isSelected: Bool {
        didSet {
            view.layer?.borderWidth = isSelected ? 5.0 : 0.0
            //print(textField?.stringValue)
        }
    }
    
    func setHighlight(selected: Bool) {
        view.layer?.borderWidth = selected ? 5.0 : 0.0
    }

    
    var imageFile: ImageFile? {
        didSet {
            guard isViewLoaded else { return }
            if let imageFile = imageFile {
                imageView?.image = imageFile.thumbnail
                textField?.stringValue = imageFile.fileName
            } else {
                imageView?.image = nil
                textField?.stringValue = ""
            }
        }
    }
    
    //MARK: Event Handling
    
    // When a slide is double-clicked, open the image file.
    override func mouseDown(with theEvent: NSEvent) {
        if theEvent.clickCount == 2 {
            //self.sourceC.mainwindowC
            self.openImageFile(self)
        } else {
            super.mouseDown(with: theEvent)
        }
    }
    
    
    //MARK: Actions
    
    // Open the image file, using the default app for files of its type.
    @IBAction func openImageFile(_: AnyObject) {
//        if let url = self.imageFile?.url {
//            NSWorkspace.shared().open(url as URL)
 //       }
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.wantsLayer = true
        view.layer?.backgroundColor = NSColor.lightGray.cgColor
        view.layer?.borderColor = NSColor.white.cgColor
        view.layer?.borderWidth = 0.0
    }
    
}
