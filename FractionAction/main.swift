//
//  main.swift
//  FractionAction
//
//  Created by Gordon, Russell on 2018-04-04.
//  Copyright © 2018 Gordon, Russell. All rights reserved.
//

import Foundation

// INPUT

// PART A: Get the numerator
var providedNumerator = -1 // Temporarily set the numerator

// Loop forever until a valid numerator is provided
while true {
    
    // Prompt the user
    print("Numerator?")
    
    // Wait for input
    // and
    // Test #1: Make sure input is not nil
    guard let givenInput = readLine() else {
        
        // Input is nil – return to start of loop and prompt again
        continue
    }
    
    // Test #2: Is the input an integer?
    guard let integerInput = Int(givenInput) else {
        
        // Input is not an integer - return to start of loop and prompt again
        continue
    }
    
    // Test #3: Is the input non-negative?
    if integerInput < 0 {
        
        // Input is negative - return to start of loop and prompt again
        continue
    }
    
    // Success: all tests passed, so assign the numerator
    providedNumerator = integerInput
    break
    
}

// PART B: Get the denominator
var providedDenominator = -1 // Temporarily set the denominator

// Loop forever until a valid denominator is provided
while true {
    
    // Prompt the user
    print("Denominator?")
    
    // Wait for input
    // and
    // Test #1: Make sure input is not nil
    guard let givenInput = readLine() else {
        
        // Input is nil – return to start of loop and prompt again
        continue
    }
    
    // Test #2: Is the input an integer?
    guard let integerInput = Int(givenInput) else {
        
        // Input is not an integer - return to start of loop and prompt again
        continue
    }
    
    // Test #3: Is the input positive?
    if integerInput <= 0 {
        
        // Input is zero or negative - return to start of loop and prompt again
        continue
    }
    
    // Success: all tests passed, so assign the numerator
    providedDenominator = integerInput
    break
    
}



// PROCESS and OUTPUT

// Get the quotient and initialOutputNumerator
// e.g.:
// providedNumerator = 44
// providedDenominator = 12
let quotient = providedNumerator / providedDenominator               // 3
let initialOutputNumerator = providedNumerator % providedDenominator // 8
let initialOutputDenominator = providedDenominator                   // 12

// If we provided output at this point, we would print:
//
// quotient initialOutputNumerator / initialOutputDenominator
//
// 3 8/12
//
// ...from example. This is not fully reduced.

// Print the start of the output
print("The result is:")

// Is the result a whole number?
if initialOutputNumerator == 0 {
    
    // We have a whole number, we are done
    print(quotient)
    
} else {
    
    // We might have to reduce
    
    // FIRST: Check whether the initial output numerator is the GCF
    if initialOutputDenominator % initialOutputNumerator == 0 {
        
        // OK, the numerator is the GCF
        //
        // e.g: 7 / 14
        //
        // reduces to
        //
        // 1 / 2
        
        // Get the reduced numerator and denominator
        let reducedOutputNumerator = 1
        let reducedOutputDenominator = initialOutputDenominator / initialOutputNumerator
        
        // Print the reduced fraction
        if quotient > 0 {
            print("\(quotient) \(reducedOutputNumerator)/\(reducedOutputDenominator)")
        } else {
            // Don't show the quotiet when it is 0, i.e.: don't print 0 2/3, just print 2/3
            print("\(reducedOutputNumerator)/\(reducedOutputDenominator)")
        }

    } else {
        
        // We must reduce by finding a GCF (greatest common factor) of the numerator and denominator
        //
        // Loop backwards from the halfway point of the numerator
        // e.g. 3 8 / 12
        //      Loop backwards from halfway point of 8
        //      4, 3, 2
        //
        var greatestCommonFactor = -1 // not the real GCF yet
        for possibleFactor in stride(from: initialOutputNumerator / 2, through: 2, by: -1) {
            
            // When the counter variable "possibleFactor" evenly divides into both
            // the initial output numerator and the provided denominator
            // ... we have the GCF
            //
            // e.g.:
            //
            //                      8 % 4 == 0                                  12 % 4 == 0
            if initialOutputNumerator % possibleFactor == 0 && providedDenominator % possibleFactor == 0 {
                
                // Now we know that "possibleFactor" is the greatest common factor (GCF)
                greatestCommonFactor = possibleFactor
                break // stop the loop
            }
        }
        
        // Get the parts of the reduced fraction
        let reducedOutputNumerator = initialOutputNumerator / greatestCommonFactor
        let reducedOutputDenominator = providedDenominator / greatestCommonFactor
        
        // Print the reduced fraction
        if quotient > 0 {
            print("\(quotient) \(reducedOutputNumerator)/\(reducedOutputDenominator)")
        } else {
            // Don't show the quotiet when it is 0, i.e.: don't print 0 2/3, just print 2/3
            print("\(reducedOutputNumerator)/\(reducedOutputDenominator)")
        }
        
    }
    
}
