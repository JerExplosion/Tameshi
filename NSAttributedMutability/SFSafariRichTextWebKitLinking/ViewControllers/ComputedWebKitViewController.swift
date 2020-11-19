//
//  ComputedWebKitViewController.swift
//  SFSafariRichTextWebKitLinking
//
//  Created by Jerry Ren on 11/18/20.
//

import WebKit

// MARK: - Deprecated approach (WkWebView) 

//class ComputedWebKitViewController: UIViewController, WKNavigationDelegate {
//
//    private let computedWebView: WKWebView = {
//
//        let preferenceSettings = WKWebpagePreferences.init()
//        preferenceSettings.allowsContentJavaScript = true
//        let configurationSettings = WKWebViewConfiguration.init()
//        configurationSettings.defaultWebpagePreferences = preferenceSettings
//
//        let webkitView = WKWebView(frame: .zero, configuration: configurationSettings)
//        return webkitView
//    }()
//
//    private let wkUrl: URL
//
//    init(url: URL, titleString: String) {
//        self.wkUrl = url
//        super.init(nibName: nil, bundle: nil)
//        self.title = titleString
//    }
//    required init?(coder: NSCoder) {
//        fatalError("why does there have to be a fatalError smh")
//    }
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        print("making sure it's called")
//        view.backgroundColor = .systemBackground
//        view.addSubview(computedWebView)
//        computedWebView.load(URLRequest(url: wkUrl))
//    }
//
//    override func viewDidLayoutSubviews() {
//        super.viewDidLayoutSubviews()
//        computedWebView.frame = view.bounds
//        settingUpNavBarButtos()
//    }
//
//    func settingUpNavBarButtos() {
//        navigationItem.rightBarButtonItem = UIBarButtonItem.init(title: "Done π", style: .done, target: self, action: #selector(donePresser))
//        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .refresh, target: self, action: #selector(refresherPresser))
//    }
//
//    @objc func donePresser() {
//        self.dismiss(animated: true, completion: nil)
//    }
//
//    @objc func refresherPresser() {
//        computedWebView.load(URLRequest(url: wkUrl))
//    }
//    // ind-onnanoko's rcmdtion
//    func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
//        print(navigationAction.request.url)
//    }
//}
