//
//  CheckValid.swift
//  TwitterApp
//
//  Created by KO on 11/09/2019.
//  Copyright © 2019 Ahmet Tuztașı. All rights reserved.
//

import Foundation

enum ServiceError: Error {
    case Failure(errmsg: String)
}

enum Check: Error{
    case Id(errmsg: String)
}


