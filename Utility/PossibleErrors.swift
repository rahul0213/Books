//
//  PossibleErrors.swift
//  Books
//
//  Created by Rahul on 18/08/18.
//  Copyright © 2018 Rahul. All rights reserved.
//

import Foundation

// These Are all Possible Error That Can Occur

enum PossibleError
{
    case ReaderAlreadyExists
    case BookShelfAlreadyExists
    case InvalidEmailID
    case EnterName
    case EnterEmailID
    case EnterPassword
    case EnterAge
    case ReaderDoesNotExists
    case Unexpected
    case AuthenticationError
    case BadRequest
    case Outdated
    case NoInternetConnection
}

enum Success
{
    case UserCreated
    
}
