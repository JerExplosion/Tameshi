//
//  GloballyApplied.swift
//  SFSafariRichTextWebKitLinking
//
//  Created by Jerry Ren on 11/18/20.
//

import Foundation

struct GloballyApplied {
    static let gitHubWebsiteLink = "https://github.com/JerExplosion" 
    static let mockableChunkOfText = "       GitHub hosts 85M code repositories and has 28M users, which is more than the population of Australia. In this article, we will find out exactly why GitHub is so popular.     https://www.github.com/explo   GitHub is the world’s largest software development platform. It provides cloud storage for source code, supports all popular programming languages, and streamlines the iteration process. At its core, the platform uses the Git system which controls revisions and runs in the command line interface.  "
    
    static let mockHtmlStr = """
    <html>
    <body>
    <h2>     my name is jerry     </h2>
    </body>
    <a href="https://github.com/JerExplosion">link text</a>
    <table>
    <tbody>
    <tr>
    <th>My github accounts are </th>
    </tr>
    <tr>
    <td>https://github.com/JerExplosion</td>
    </tr>
    <td>https://github.com/JerExplosionNextGeneration</td>
    </tbody>
    </table>
    </html>
    """
    static let personallyPreferredFont = "Georgia"
}
