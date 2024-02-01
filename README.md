## Audit Report Solidity

## Introduction
This audit report highlights the overall security of the Smart Contract. With this report, I have tried to ensure the reliability of the smart contract by completing the assessment of smart contract codebase.

## Auditing approach and Methodologies applied

In this audit, I consider the following crucial features of the code.
● Whether the implementation of protocol standards.
● Whether the code is secure.
● Whether the code meets the best coding practices.
## The audit has been performed according to the following procedure:

* Manual audit
1. Inspecting the code line by line and revert the initial algorithms of the protocoland 
then compare them with the specification
2. Manually analyzing the code for security vulnerabilities.
3. Assessing the overall project structure, complexity & quality.
4. Unit testing by writing custom unit testing for each function.
5. Checking whether all the libraries used in the code of the latest version.
6. Analysis of security on-chain data.
7. Analysis of the failure preparations to check how the smart contract performs incase of 
bugs and vulnerability.

* Automated analysis
  
1. Scanning the project's code base with Mythril, Slither, Echidna , Manticoreother’s.
2. Manually verifying (reject or confirm) all the issues found by tools.
3. Performing Unit testing.
4. Manual Security Testing (Overflow)
5. Running the tests and checking their coverage.

## Report: All the gathered information is described in this report.

## Security

Every issue in this report was assigned a severity level from the following:

## High severity issues

Issues mentioned here are critical to smart contract performance and functionality and should be fixed before moving to mainnet.

## Medium severity issues

This could potentially bring the problem in the future and should be fixed.

## Low severity issues 

These are minor details and warnings that can remain unfixed but would be better if it got fixed in the future.

## No. of issue per severity
| Severity | High | Medium | Low |
| -------- | ---- | ------ | --- |
| Open | 1 | 1 | 3 |

## Manual audit

* Following are the reports from our manual analysis.

## High severity issues
* One High Severity Issue found.
  
## Medium severity issues
* One Medium Severity Issue found.
  
## Low Severity Issues :
*There were 3 low severity issues found in protocol and in contract.
