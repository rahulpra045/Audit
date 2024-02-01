SMART
CONTRAT
AUDIT
REPORT
By: Rahul Prasad
 (IIIT BHOPAL) 
1
Introduction
This audit report highlights the overall security of the Smart Contract. With this report, I have 
tried to ensure the reliability of the smart contract by completing the assessment of smart 
contract codebase.
Auditing approach and Methodologies applied
In this audit, I consider the following crucial features of the code.
● Whether the implementation of protocol standards.
● Whether the code is secure.
● Whether the code meets the best coding practices.
The audit has been performed according to the following procedure:
• Manual audit
1. Inspecting the code line by line and revert the initial algorithms of the protocoland 
then compare them with the specification
2. Manually analyzing the code for security vulnerabilities.
3. Assessing the overall project structure, complexity & quality.
4. Unit testing by writing custom unit testing for each function.
5. Checking whether all the libraries used in the code of the latest version.
6. Analysis of security on-chain data.
7. Analysis of the failure preparations to check how the smart contract performs incase of 
bugs and vulnerability.
• Automated analysis
1. Scanning the project's code base with Mythril, Slither, Echidna , Manticoreother’s.
2. Manually verifying (reject or confirm) all the issues found by tools.
3. Performing Unit testing.
4. Manual Security Testing (Overflow)
5. Running the tests and checking their coverage.
Report: All the gathered information is described in this report.
2
Audit details
Language: Solidity
Platform and tools: Remix, VScode, securify and other tools mentioned in the automated 
analysis section.
Audit Goals
The focus of this audit was to verify whether the smart contract is secure, resilient, and working 
properly according to the specs. The audit activity can be grouped in three categories.
Security: Identifying the security-related issue within each contract and system of contracts.
Sound architecture: Evaluating the architect of a system through the lens of established smart 
contract best practice and general software practice.
Code correctness and quality: A full review of contract source code. The primary area of focus 
includes.
● Correctness.
● Section of code with high complexity.
● Readability.
● Quantity and quality of test coverage.
3
Security
Every issue in this report was assigned a severity level from the following:
High severity issues
Issues mentioned here are critical to smart contract performance and functionality and should be 
fixed before moving to mainnet.
Medium severity issues
This could potentially bring the problem in the future and should be fixed.
Low severity issues
These are minor details and warnings that can remain unfixed but would be better if itgot 
fixed in the future.
No. of issue per severity
Severity High Medium Low
Open 1 1 3
Manual audit
Following are the reports from our manual analysis.
High severity issues
One High Severity Issue found.
Medium severity issues
One Medium Severity Issue found.
Low Severity Issues :
There were 3 low severity issues found in protocol and in contract.
4
Chances of Reentrancy Attack
A reentrancy attack is an exploit that takes advantage of a computer program or smart 
contract vulnerability. It allows an attacker to execute malicious code multiple times before 
the original function has been completed, potentially causing damage to the program or 
allowing the attacker to steal resources or data. In a reentrancy attack, an attacker exploits 
a vulnerability in the smart contract code that allows them to call the same function 
repeatedly before it has finished executing. In a reentrancy attack, an attacker exploits a 
vulnerability in the smart contract code that allows them to call the same function 
repeatedly before it has finished executing.
It allows an attacker to execute malicious code multiple times before the original function 
has been completed, potentially causing damage to the program or allowing the attacker to 
steal resources or data. One way that reentrancy attacks can be carried out is through the 
use of recursive calls. When a smart contract function calls another function, it may be 
possible for the second function to call the first function again before the first function has 
finished executing. If this happens, the second function can execute malicious code before 
the first function has a chance to complete. Another way that reentrancy attacks can be 
carried out is through the use of external calls.
When a smart contract calls an external contract or function, it may be possible for the
external contract or function to call the original contract again before the original contract
has finished executing. This can create a loop that allows the attacker to repeatedly execute
malicious code. To prevent reentrancy attacks, it is important for developers to carefully 
review their code and identify any vulnerabilities. One way to do this is through the use of 
automated tools that can detect potential weaknesses in the code. Additionally, developers 
should avoid using external calls whenever possible and should carefully manage the flow 
of control within their smart contracts. Another way is to use mutex.
In our code on from line 16 to 27 this attack can happen.
5
Attacker can use the below code part to run as loop in for the smart contract to send 
ether continuously until accounts balance <1.
To overcome this attack we have used a lock variable which closes the function 
once any address enters the function and unlock it only when address execute the 
line no 25.
Require Statement Without Error Message
There is a require statement on line 23 with no failure message. Consider adding a 
message to inform users in case of a revert. This msg will be displayed during failed 
operation.
6
Protecting Time Dependence
Smart contracts that rely on timestamps to make decisions or execute logic are vulnerable to 
these attacks. While it's difficult for miners to directly manipulate the value of 
block.timestamp, it's theoretically possible for them to manipulate the timestamp to some 
extent. Miners could manipulate the clock on their mining nodes to set a timestamp that's 
earlier or later than the actual current time. By doing so, they could potentially affect the 
outcome of time-dependent operations in a smart contract.
To mitigate the risk of miner manipulation of timestamps, it's important to design contracts 
that are
robust against potential timestamp manipulations. This can be done by using alternative 
time sources or by implementing mechanisms to detect and handle incorrect timestamps. 
For example, a contract could use an external time oracle to obtain the current time instead 
of relying solely on block.timestamp.
Additionally, a contract could implement checks to ensure that the timestamp is within a 
reasonable range and reject transactions with timestamps that are too far off from the 
expected value.
Timestamp can easily be manipulated by attackers, so it’s a bad practice to use it in the 
contract directly.
To protect this I used block number as block numbers cannot be manipulated by attackers.
7
Floating Points and Precision Attack
As in solidity floating point are not fully supported so precision can be lost while 
performing
Arithmetic operations. Which we can see at line no. 29 Because of this the loss of ethers 
took placed or can be any unexpected behavior, including vulnerabilities in
smart contracts.
In order to overcome this we can firstly use multiplication (*) in the arithmetic equation so 
the precision error could be minimized.
Secondly we use token in number of wei so fraction part could be erased totally.
8
Surya’s Description Report
Sūrya's Description Report
Files Description Table
| File Name | SHA-1 Hash |
|-------------|--------------|
| c:\Users\Rahul Prasad\Downloads\Vulnerable.sol | 
b63e2a99668985a91fc16671d125af461f21bcfe |
| c:\Users\Rahul Prasad\Downloads\Problem.sol | 
ed492a833a033383595e6e0ab59859a1735010ce |
| c:\Users\Rahul Prasad\Downloads\Problem (1).sol | 
75c799c8b65b5279fac7cdd60da0f6406f2398be |
| c:\Users\Rahul Prasad\Downloads\Problem (2).sol | 
f092e6a17f7343c04afb510eed31a772cd8e95be |
| c:\Users\Rahul Prasad\Downloads\Solution.sol | 
7eb07562286a1e40a8f63b81422ae0bf2f57a0c4 |
| c:\Users\Rahul Prasad\Downloads\Solution (1).sol | 
4f874c759200105f43d40d69a53df6d2b53fa1cf |
| d:\vs code\Blockchain\Audit\test\Vulnerable.sol | 
9f3b9f90f5397c801a9ac8697097c480600f08b3 |
| c:\Users\Rahul Prasad\Downloads\Solution (2).sol | 
8c138acf0b6c65a08de014c54ec71a863748fa07 |
| d:\vs code\Blockchain\Audit\contracts\Lock.sol | 
55e48ff572269ca3bf84f3809959667dbd137db9 |
Contracts Description Table
| Contract | Type | Bases | | 
|
|:----------:|:-------------------:|:----------------:|:----------------:|:--------
-------:|
| └ | **Function 
Name** | **Visibility** | **Mutability** | **Modifiers** |
||||||
| **Vulnerable** | Implementation | |||
| └ | deposit | Public ❗️ | 💵 |NO❗️ |
| └ | withdraw | Public ❗️ | 🛑 |NO❗️ |
| └ | callerAddress | Public ❗️ | |NO❗️ |
||||||
| **FoatingIssue** | Implementation | |||
| └ | buyTokens | Public ❗️ | 🛑 |NO❗️ |
9
| └ | sellTokens | Public 
❗️ | 
🛑 |NO
❗️ |
||||||
| **TimeDependence** | Implementation | |||
| └ | winnerCheck | External 
❗️ | 
🛑 |NO
❗️ |
||||||
| **TODExample** | Implementation | |||
| └ | deposit | Public 
❗️ | 
💵 |NO
❗️ |
| └ | withdraw | Public 
❗️ | 
🛑 |NO
❗️ |
||||||
| **FoatingIssue** | Implementation | |||
| └ | buyTokens | Public 
❗️ | 
💵 |NO
❗️ |
| └ | sellTokens | Public 
❗️ | 
🛑 |NO
❗️ |
||||||
| **TimeDependenceExample** | Implementation | |||
| └ | setReward | Public 
❗️ | 
🛑 |NO
❗️ |
| └ | claimReward | Public 
❗️ | 
🛑 |NO
❗️ |
||||||
| **Vulnerable** | Implementation | |||
| └ | deposit | Public 
❗️ | 
💵 |NO
❗️ |
| └ | withdraw | Public 
❗️ | 
🛑 |NO
❗️ |
| └ | buyTokens | Public 
❗️ | 
💵 |NO
❗️ |
| └ | sellTokens | Public 
❗️ | 
🛑 |NO
❗️ |
| └ | winnerCheck | External 
❗️ | 
🛑 |NO
❗️ |
||||||
| **Vulnerable** | Implementation | |||
| └ | deposit | Public 
❗️ | 
💵 |NO
❗️ |
| └ | withdraw | Public 
❗️ | 
🛑 |NO
❗️ |
| └ | callerAddress | Public 
❗️ | |NO
❗️ |
||||||
| **Lock** | Implementation | |||
| └ | <Constructor> | Public 
❗️ | 
💵 |NO
❗️ |
| └ | withdraw | Public 
❗️ | 
🛑 |NO
❗️ |
Legend
| Symbol | Meaning |
|:--------:|-----------|
| 
🛑 | Function can modify state |
| 
💵 | Function is payable |
10
Various Causes to Lack Efficiency
1. Costly loop
Ethereum is a very resource-constrained environment. Prices per computational step are 
orders of magnitude higher than with centralized providers. Moreover, Ethereum miners 
impose a limit on the total number of gas consumed in a block. If array.length is large 
enough, the function exceeds the block gas limit, and transactions calling it will never be 
confirmed:
for (uint256 i = 0; i < array.length ; i++) 
{cosltyFunc();
}
This becomes a security issue, if an external actor influences array.length. E.g., if the array 
enumerates all registered addresses, an adversary can register many addresses, causing the 
problem described above.
2. Pure-functions should not read/change state
In Solidity, functions that do not read from the state or modify it can be declared as pure.
Recommendation:
Do not declare functions that read from or modify the state as pure.The 
following statements are considered modifying the state:
1. Writing to state variables
2. Emitting events;
3. Creating other contracts;
4. Using selfdestruct;
5. Sending Ether via calls;
6. Calling any function not marked view or pure;
7. Using low-level calls;
8. Using inline assembly that contains certain opcodes.
The following statements are considered reading from the state:
1. Reading from state variables;
11
2. Accessing this.balance or <adress>.balance;
3. Accessing any of the members of block, tx, msg (with the exception of msg.sigand 
msg.data);
4. Calling any function not marked pure;
5. Using inline assembly that contains certain opcodes
Recommendation:
It is required to check the address. Also, it is required to check the code of the called contract 
for vulnerabilities.
If possible, avoid changing the length of the dynamic array directly.
 Use uint[] storage arrayName = new uint[](7) to create a dynamic array of the 
desired length.
 Use delete arrayName to clear a dynamic array.
 Use .push() (instead of .length++) to write to the end of the dynamic array.
 Starting with version 0.5.0 of the Solidity compiler, use .pop() (instead of .length--
) to delete the last element of the dynamic array.
Multiplication after division
Solidity operates only with integers. Thus, if the division is done before the multiplication, 
the rounding errors can increase dramatically.
●contracts/Vulnerable.sol [line: 29]
Recommendation:
Multiplication before division may increase the rounding precision.
Using approve function of the ERC-20 token standard
The approve function of ERC-20 is vulnerable. Using front-running attack one can spend 
approved tokens before change of allowance value.
●contracts/CErc20Delegator.sol [line: 183-186]
●contracts/CToken.sol [line: 158-163]
12
Recommendation:
Only use the approve function of the ERC-20 standard to change the allowed amount to0 or 
from 0 (wait till transaction is mined and approved).
Extra gas consumption
State variable, .balance, or .length of non-memory array is used in the condition of for orwhile 
loop. In this case, every iteration of loop consumes extra gas.
Recommendation:
If a state variable, .balance, or .length is used several times, holding its value in a local
variable is more gas efficient. If .length of calldata-array is placed into a local variable, the 
optimisation will be less significant.
Costly Loop
Ethereum is a very resource-constrained environment. Prices per computational step are 
orders of magnitude higher than with centralized providers. Moreover, Ethereum miners 
impose a limit on the total number of gas consumed in a block. If array.length is large enough, 
the function exceeds the block gas limit, and transactions calling it will never be confirmed:
for (uint256 i = 0; i < array.length ; i++) 
{cosltyFunc();
}
This becomes a security issue, if an external actor influences array.length. E.g., if array
enumerates all registered addresses, an adversary can register many addresses, causing the 
problem described above.
Recommendation:
Avoid loops with a big or unknown number of steps.
13
Locked money
●contracts/Unitroller.sol [Line 10-148]
Contracts programmed to receive ether should implement a way to withdraw it, i.e., call
transfer (recommended), send, or call.value at least once.
Recommendation
Implement a withdraw function or reject payments (contracts without a fallback functiondo it 
automatically).
msg.value == 0 check
The msg.value == 0 condition check is meaningless in most cases.
Recommendation:
Avoid meaningless checks.
Overpowered role
This function is callable only from one address. Therefore, the system depends heavily on this
address. In this case, there are scenarios that may lead to undesirable consequences for investors, 
e.g. if the private key of this address becomes compromised.
Recommendation
We recommend designing contracts in a trustless manner. For instance, this functionality can be 
implemented in the contract's constructor. Another option is to use MultiSig wallet at this address.
Compiler version not fixed
Solidity source files indicate the versions of the compiler they can be compiled with.
pragma solidity ^0.4.17; // bad: compiles w 0.4.17 and abovepragma 
solidity 0.4.24; // good : compiles w 0.4.24 only
It is recommended to follow the latter example, as future compiler versions may handlecertain 
language constructions in a way the developer did not foresee.
14
Recommendation:
Specify the exact compiler version (pragma solidity x.y.z;).
Disclaimer
The audit does not give any warranties on the security of the code. One audit cannot be
considered enough. We always recommend proceeding with several independent audits and
a public bug bounty program to ensure the security of the code. Besides, a security audit,
please don’t consider this report as investment advice.
Summary
The use of smart contracts is simple and the code is relatively small. Altogether the code is written
and demonstrates effective use of abstraction, separation of concern, and modularity. But there are a
few issues/vulnerabilities to be tackled at various security levels, it is recommended to fix them before 
deploying the contract on the main network. Given the subjective nature of some assessments, it will 
be up to the team to decide whether any changes should be made.
