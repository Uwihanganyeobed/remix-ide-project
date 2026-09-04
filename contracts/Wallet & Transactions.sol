// SPDX-License-Identifier: MIT

pragma solidity ^0.8.24;


/*
    ============================================================
                    WALLET & TRANSACTIONS
    ============================================================

    This contract teaches:

    - Functions
    - public
    - view
    - pure
    - payable
    - returns
    - modifiers
    - Ether units
    - msg.sender
    - msg.value
    - block.timestamp
    - address(this).balance
    - errors
*/


contract Wallet {

    // =========================================================
    // STATE VARIABLES
    // =========================================================

    address public owner;

    uint256 public balance;


    // =========================================================
    // CUSTOM ERROR
    // =========================================================

    /*
        Custom errors are a gas-efficient way of
        reporting failures.
    */

    error NotOwner();

    error InsufficientBalance();


    // =========================================================
    // CONSTRUCTOR
    // =========================================================

    constructor() {

        // The person deploying the contract becomes owner.
        owner = msg.sender;
    }


    // =========================================================
    // MODIFIER
    // =========================================================

    /*
        A modifier allows us to reuse permission logic.

        onlyOwner means:

        Only the owner can execute the function.
    */

    modifier onlyOwner() {

        if (msg.sender != owner) {

            revert NotOwner();
        }

        // "_" means:
        // Execute the original function here.
        _;
    }


    // =========================================================
    // DEPOSIT FUNCTION
    // =========================================================

    /*
        payable means:

        This function is allowed to receive Ether.
    */

    function deposit()
        public
        payable
    {

        /*
            msg.value contains the amount of Ether
            sent with this transaction.

            Example:

            If user sends 1 ETH:

            msg.value =
            1000000000000000000 wei
        */

        balance += msg.value;
    }


    // =========================================================
    // WITHDRAW FUNCTION
    // =========================================================

    function withdraw(
        uint256 _amount
    )
        public
        onlyOwner
    {

        if (_amount > address(this).balance) {

            revert InsufficientBalance();
        }


        /*
            payable(msg.sender)

            converts the address into an address
            capable of receiving Ether.
        */

        payable(msg.sender).transfer(_amount);
    }


    // =========================================================
    // VIEW FUNCTION
    // =========================================================

    /*
        view means:

        The function can READ blockchain state
        but cannot MODIFY it.
    */

    function getBalance()
        public
        view
        returns (uint256)
    {

        return address(this).balance;
    }


    // =========================================================
    // PURE FUNCTION
    // =========================================================

    /*
        pure means:

        The function does not read or modify
        blockchain state.

        It only works with the values given to it.
    */

    function add(
        uint256 a,
        uint256 b
    )
        public
        pure
        returns (uint256)
    {

        return a + b;
    }


    // =========================================================
    // ETHER UNITS
    // =========================================================

    /*
        Solidity provides Ether units:

            wei
            gwei
            ether

        1 ether = 1,000,000,000,000,000,000 wei
    */

    function etherUnits()
        public
        pure
        returns (
            uint256,
            uint256,
            uint256
        )
    {

        uint256 oneWei = 1 wei;

        uint256 oneGwei = 1 gwei;

        uint256 oneEther = 1 ether;


        return (
            oneWei,
            oneGwei,
            oneEther
        );
    }


    // =========================================================
    // SPECIAL BLOCKCHAIN VARIABLES
    // =========================================================

    function blockchainInformation()
        public
        view
        returns (
            address,
            uint256,
            uint256,
            uint256
        )
    {

        /*
            msg.sender
            = person calling this function

            block.timestamp
            = current block timestamp

            block.number
            = current block number

            block.chainid
            = blockchain network ID
        */

        return (
            msg.sender,
            block.timestamp,
            block.number,
            block.chainid
        );
    }
}