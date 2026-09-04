// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;


// Create your own cryptocurrency/token.

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract LoremToken is ERC20 {

    constructor() ERC20("Lorem Token", "LRM") {

        // Create 1,000,000 tokens
        // 18 decimals is the standard ERC-20 decimal count
        _mint(msg.sender, 1000000 * 10 ** decimals());
    }
}

/*
ERC-20 token functo
| Function         | Simple meaning                               | Example                         |
| ---------------- | -------------------------------------------- | ------------------------------- |
| `totalSupply()`  | How many tokens exist?                       | `1,000,000 LRM`                 |
| `balanceOf()`    | How many tokens does this wallet have?       | Alice → `500 LRM`               |
| `transfer()`     | Send my tokens to someone                    | Alice → Bob `100 LRM`           |
| `approve()`      | Give someone permission to spend my tokens   | Alice → Marketplace `300 LRM`   |
| `allowance()`    | Check remaining permission                   | Marketplace can spend `200 LRM` |
| `transferFrom()` | Approved address spends tokens for the owner | Marketplace → Bob `100 LRM`     |


totalSupply
    ↓
How many exist?

balanceOf
    ↓
How many do I have?

transfer
    ↓
Send MY tokens

approve
    ↓
Give permission

allowance
    ↓
Check permission

transferFrom
    ↓
Use that permission
*/