//
//  Model.swift
//  SwiftUI-MVVM
//
//  Created by Tian Tong on 7/26/20.
//  Copyright © 2020 TTDP. All rights reserved.
//

import Foundation

/*
 {
     "id": 2,
     "email": "janet.weaver@reqres.in",
     "first_name": "Janet",
     "last_name": "Weaver",
     "avatar": "https://s3.amazonaws.com/uifaces/faces/twitter/josephstein/128.jpg"
 }
 */

struct Player: Identifiable, Decodable {
    let id: Int
    let email: String
    let firstName: String
    let lastName: String
    let avatar: String
}

struct ReqResList: Decodable {
    let page: Int
    let perPage: Int
    let total: Int
    let totalPages: Int
    let data: [Player]
}

/*
 {
     "page": 1,
     "per_page": 6,
     "total": 12,
     "total_pages": 2,
     "data": [
         {
             "id": 1,
             "email": "george.bluth@reqres.in",
             "first_name": "George",
             "last_name": "Bluth",
             "avatar": "https://s3.amazonaws.com/uifaces/faces/twitter/calebogden/128.jpg"
         },
         {
             "id": 2,
             "email": "janet.weaver@reqres.in",
             "first_name": "Janet",
             "last_name": "Weaver",
             "avatar": "https://s3.amazonaws.com/uifaces/faces/twitter/josephstein/128.jpg"
         },
         {
             "id": 3,
             "email": "emma.wong@reqres.in",
             "first_name": "Emma",
             "last_name": "Wong",
             "avatar": "https://s3.amazonaws.com/uifaces/faces/twitter/olegpogodaev/128.jpg"
         },
         {
             "id": 4,
             "email": "eve.holt@reqres.in",
             "first_name": "Eve",
             "last_name": "Holt",
             "avatar": "https://s3.amazonaws.com/uifaces/faces/twitter/marcoramires/128.jpg"
         },
         {
             "id": 5,
             "email": "charles.morris@reqres.in",
             "first_name": "Charles",
             "last_name": "Morris",
             "avatar": "https://s3.amazonaws.com/uifaces/faces/twitter/stephenmoon/128.jpg"
         },
         {
             "id": 6,
             "email": "tracey.ramos@reqres.in",
             "first_name": "Tracey",
             "last_name": "Ramos",
             "avatar": "https://s3.amazonaws.com/uifaces/faces/twitter/bigmancho/128.jpg"
         }
     ],
     "ad": {
         "company": "StatusCode Weekly",
         "url": "http://statuscode.org/",
         "text": "A weekly newsletter focusing on software development, infrastructure, the server, performance, and the stack end of things."
     }
 }
 */