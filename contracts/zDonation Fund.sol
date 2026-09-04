// SPDX-License-Identifier: MIT

pragma solidity ^0.8.24;


/*
    ============================================================
                       DONATION FUND
    ============================================================

    This contract demonstrates common blockchain patterns.

    Concepts:

    - Restricted access
    - Withdrawal pattern
    - payable
    - receive
    - fallback
    - events
    - error handling
    - require
    - custom errors
*/


contract DonationFund {


    // =========================================================
    // OWNER
    // =========================================================

    address public owner;


    // =========================================================
    // DONATION TRACKING
    // =========================================================

    mapping(address => uint256) public donations;


    // =========================================================
    // EVENTS
    // =========================================================

    event DonationReceived(
        address indexed donor,
        uint256 amount
    );

    event DonationWithdrawn(
        address indexed owner,
        uint256 amount
    );


    // =========================================================
    // CUSTOM ERRORS
    // =========================================================

    error NotOwner();

    error NoFunds();

    error TransferFailed();


    // =========================================================
    // CONSTRUCTOR
    // =========================================================

    constructor() {

        owner = msg.sender;
    }


    // =========================================================
    // ONLY OWNER MODIFIER
    // =========================================================

    modifier onlyOwner() {

        if (msg.sender != owner) {

            revert NotOwner();
        }

        _;

    }


    // =========================================================
    // DONATE
    // =========================================================

    /*
        Anyone can call this function.

        Because it is payable, users can send Ether.
    */

    function donate()
        public
        payable
    {

        require(
            msg.value > 0,
            "Donation must be greater than zero"
        );


        // Record how much this address donated.
        donations[msg.sender] += msg.value;


        // Emit an event.
        emit DonationReceived(
            msg.sender,
            msg.value
        );
    }


    // =========================================================
    // WITHDRAWAL PATTERN
    // =========================================================

    /*
        IMPORTANT:

        We use the withdrawal pattern instead of
        automatically sending funds somewhere.

        The owner explicitly calls withdraw().
    */

    function withdraw()
        public
        onlyOwner
    {

        uint256 amount = address(this).balance;


        if (amount == 0) {

            revert NoFunds();
        }


        /*
            Transfer Ether to the owner.

            call() is commonly preferred over transfer()
            for modern Solidity code because of gas behavior.
        */

        (bool success, ) = payable(owner).call{
            value: amount
        }("");


        if (!success) {

            revert TransferFailed();
        }


        emit DonationWithdrawn(
            owner,
            amount
        );
    }


    // =========================================================
    // CHECK BALANCE
    // =========================================================

    function getBalance()
        public
        view
        returns (uint256)
    {

        return address(this).balance;
    }


    // =========================================================
    // RECEIVE FUNCTION
    // =========================================================

    /*
        receive() executes when:

        Ether is sent directly to this contract

        AND

        no function data is included.
    */

    receive()
        external
        payable
    {

        donations[msg.sender] += msg.value;


        emit DonationReceived(
            msg.sender,
            msg.value
        );
    }


    // =========================================================
    // FALLBACK FUNCTION
    // =========================================================

    /*
        fallback() executes when:

        1. Someone calls a function that doesn't exist

        OR

        2. Data is sent that doesn't match any function.
    */

    fallback()
        external
        payable
    {

        // We could log or handle unknown calls here.
    }
}