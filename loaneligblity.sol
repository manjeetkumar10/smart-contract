// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract LoanEligibility 
{
    uint256 public creditScore = 500;
    address public owner;

    // Event to modify old credit score by current credit score
    event creditScoreChanged(uint256 currentCreditScore);

    // Modifier to restrict access to the owner
    modifier onlyOwner() 
    {
        require(msg.sender == owner, "Caller is not the owner");
        _;
    }

    constructor() 
    {
        // Set the contract deployer as the owner
        owner = msg.sender;
    }

    // Function to check eligibility for Education Loan
    function checkForEducationLoan(uint256 currentCreditScore) external onlyOwner 
    {
        require(currentCreditScore > 600, "You are not eligible for a Education Loan. Your credit score must be above 600.");

        creditScore = currentCreditScore;
        emit creditScoreChanged(currentCreditScore);
    }

    // Function to check eligibility for Agriculture Loan
    function checkForAgricultreLoan(uint256 currentCreditScore) external onlyOwner 
    {
        require(currentCreditScore > 700, "You are not eligible for a Agriculture Loan. Your credit score must be above 700.");

        creditScore = currentCreditScore;
        emit creditScoreChanged(currentCreditScore);
    }

    // Function to check eligibility for Personal Loan
    function checkForPersonalLoan(uint256 currentCreditScore) external onlyOwner
    {
        require(currentCreditScore > 550, "You are not eligible for a Personal Loan. Your credit score must be above 550.");

        creditScore = currentCreditScore;
        emit creditScoreChanged(currentCreditScore);
    }

    // Function that uses assert statement for getting minimum credit score
    function checkMinimumCreditScore() external view 
    {
        assert(creditScore >= 300); // This should always be true
        // Note: Assert statements do not provide error messages, so no additional message is given here.
    }

    // Function to demonstrate revert statement to check eligibility for any loan
    function checkForAnyLoan(uint256 currentCreditScore) external onlyOwner 
    {
        if (currentCreditScore <= 500) {
            revert("You do not have the minimum credit score for any loan. Your credit score must be above 500.");
        }
        creditScore = currentCreditScore;
        emit creditScoreChanged(currentCreditScore);
    }
}
