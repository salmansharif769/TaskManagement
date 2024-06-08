//
//  Json Data.swift
//  TCP Salman Test Task
//
//  Created by Salman Sharif on 08/06/2024.
//

import Foundation
var json = """
{
    "tasks": [
        {
            "id": "be06c9b6b02a499daa6f4a9bc12d6d43",
            "TargetDate": "2024-08-25",
            "DueDate": "2024-08-31",
            "Title": "SDK update",
            "Description": "Update Android SDK to the latest version. More info at https://developer.android.com/studio/intro/update",
            "Priority": 0
        },
        {
            "id": "d4fe42a94af24fce8beccbed9fffa7a2",
            "TargetDate": "2024-08-25",
            "DueDate": "2024-09-10",
            "Title": "Setup Jenkins",
            "Description": "Setup Jenkins environment for SomeCoolApp. Feel free to ask Jeff for help (jeffthemighty@example.com)",
            "Priority": 1
        },
        {
            "id": "9b5b7336f55b44dba613af85026d2fa8",
            "TargetDate": "2024-08-28",
            "DueDate": "2024-09-05",
            "Title": "Deprecate V2 API",
            "Description": "Ditch the API V2 and migrate to V3. Report found V3 issues to the backend team.",
            "Priority": 2
        },
        {
            "id": "31c89a8a03ba4214a2c846561e640282",
            "TargetDate": "2024-08-28",
            "DueDate": "2024-09-12",
            "Title": "Calendar UI Components - Research",
            "Description": "Investigate the calendar UI components. Create the documents where top 10s are listed with its pros and cons.",
            "Priority": 2
        },
        {
            "id": "dfd482aee1d742ee95b9f101417a3292",
            "TargetDate": "2024-09-01",
            "DueDate": "2024-09-05",
            "Title": "[MOBILE-12345] User 153565 is complaining that it takes to long for login to finish while being on cellural connection - SomeCoolApp (version 3.0)",
            "Description": "Nothing to add here, everything is said in the task title",
            "Priority": 0
        },
        {
            "id": "39ec1706a7c74fba991a0d8bc8e7724b",
            "TargetDate": "2024-09-03",
            "DueDate": "2024-09-10",
            "Title": "Finish basic APM implementation",
            "Description": "Put traces onto login and dashboard flows. Break the traces into sequences representing fetching, parsing and storing data.",
            "Priority": 0
        },
        {
            "id": "62004ba7df8b490e95b5ce3de2b2887c",
            "TargetDate": "2024-09-10",
            "DueDate": "2024-09-23",
            "Title": "CTO presentation",
            "Description": "Prepare the Youtube API feature PoC for CTO meeting we have this week.",
            "Priority": 3
        },
        {
            "id": "70dba677ff494f429e2b33a5acb43c6d",
            "TargetDate": "2024-09-10",
            "DueDate": "2024-09-30",
            "Title": "Crashes on Crashlytics",
            "Description": "Examine trending crashes on SomeCoolApp v3.0. Create JUIRA asks for each of them and add Jane as a watcher.",
            "Priority": 2
        },
        {
            "id": "83c8ac61afac4ae6a4330b538e729a60",
            "TargetDate": "2024-09-10",
            "DueDate": "2024-09-11",
            "Title": "Unit tests - coverage",
            "Description": "Increase the test coverage of PermissionResolver class up to 95%",
            "Priority": 3
        },
        {
            "id": "9932a30579414127bc26dea367b3d0a7",
            "TargetDate": "2024-08-27",
            "DueDate": "2024-08-29",
            "Title": "Architectural review",
            "Description": "Create the document which will enlist the top 10 architectural problems we do have in SomeCoolApp codebase.",
            "Priority": 0
        },
        {
            "id": "d29537593da84227a5f2f56e9616a4b7",
            "TargetDate": "2024-08-27",
            "DueDate": "2024-08-31",
            "Title": "Onboarding - QA",
            "Description": "Prepare onboarding sessions for new QA member to come. Previous onboarding sessoin could be find at www.example.com",
            "Priority": 1
        },
        {
            "id": "49dc9474cc5d4d0c9548c3953447f938",
            "TargetDate": "2024-08-24",
            "DueDate": "2024-08-29",
            "Title": "Onboarding - Dev",
            "Description": "Prepare onboarding sessions for new Dev member to come. Previous onboarding sessions could be find at www.example.com",
            "Priority": 3
        },
        {
            "id": "a4a044856fca4362a8b72070329c9afd",
            "TargetDate": "2024-08-24",
            "DueDate": "2024-08-24",
            "Title": "Organize team building for mobile team",
            "Description": "Find us some cool place for team building - place reservation for December 5th",
            "Priority": 0
        },
        {
            "id": "4b71e368afe44fd48c7a02c931c174a4",
            "TargetDate": "2024-10-10",
            "DueDate": null,
            "Title": "SomeCoolFeature - go live preparation",
            "Description": "Finish the implementation of SomeCoolFeature. It will go live with SomeCoolApp v4.0 release.",
            "Priority": 0
        },
        {
            "id": "169aad1b4f6c41689f8adccf4b187a98",
            "TargetDate": "2024-10-10",
            "Title": "SomeCoolFeature - go live preparation",
            "Description": "Finish the implementation of SomeCoolFeature. It will go live with SomeCoolApp v4.0 release.",
            "Priority": 0
        },
        {
            "id": "88cc4c190b86456a842292ffcf50f814",
            "TargetDate": "2024-09-05",
            "DueDate": "2024-09-09",
            "Title": "FRP presentation",
            "Description": "Prepare short presentation about functional reactive programming paradigm. This app might help you - https://apps.apple.com/us/app/rxmarbles/id1087272442"
        },
        {
            "id": "8feb2cc984244a72a0bcd1bf63778cb5",
            "TargetDate": "2024-09-01",
            "DueDate": "2024-12-31",
            "Title": "French localization",
            "Description": "Collect the strings needed to be translated into French and upload it on the Lokalize platform.",
            "Priority": 0
        },
        {
            "id": "fca73de5cef94181be714a325a31abec",
            "TargetDate": "2024-09-02",
            "DueDate": "2024-09-10",
            "Title": "MVVM migration",
            "Description": "Migrate the login scene into MVVM. The scope of the task is also to address all bugs sitting in backlog associated with the login flow.",
            "Priority": 0
        }
    ]
}
"""
