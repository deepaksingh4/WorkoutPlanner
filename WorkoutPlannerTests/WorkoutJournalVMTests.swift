//
//  WorkoutJournalVMTests.swift
//  WorkoutPlannerTests
//
//  Created by Deepak Singh07 on 14/04/2023.
//

import XCTest
@testable import WorkoutPlanner

final class WorkoutJournalVMTests: XCTestCase {

    var sut: WorkoutJournalViewModel!
    override func setUpWithError() throws {
        sut = WorkoutJournalViewModel()
    }

    override func tearDownWithError() throws {
        sut = nil
    }

    func test_fetchWorkouts(){
        sut.fetchWorkoutPlans()
    }
    

}
