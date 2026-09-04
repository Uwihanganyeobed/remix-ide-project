// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

contract SendMoney {

    address public owner;

    constructor() {
        owner = msg.sender;
    }

    // Allow the contract to receive ETH
    receive() external payable {}

    // Send ETH to another user
    function sendMoney(address payable _to, uint256 _amount)
        public
    {
        require(msg.sender == owner, "Only owner can send");

        // Send ETH
        (bool success, ) = _to.call{value: _amount}("");

        require(success, "Transfer failed");
    }

    // Check contract balance
    function getBalance()
        public
        view
        returns (uint256)
    {
        return address(this).balance;
    }
}