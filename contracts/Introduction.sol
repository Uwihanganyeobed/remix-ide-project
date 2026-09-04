// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Introduction {
    // IO stream to make variables/functions be
    //  visible on deployed contract make the public
    bool public hasSent = true;
    int public age = 20;
    string public name = "Obed";

    // why?
    //Solidity automatically creates a getter function behind the scenes, roughly equivalent to:
    // function getHasEntry() public view returns (bool) {
    //     return hasEntry;
    // }

    //A program to use function and return our values
    function getValues() public view returns (bool, int) {
        return (hasSent, age);
    }

    //Variable types
    //Solidity requires memory keywords for strings, explicit function mutability (view or pure when not changing state), 
    //and specific helper methods to concatenate strings.
    /*
    | Type                 | Description                                | Example                                     |
| -------------------- | ------------------------------------------ | ------------------------------------------- |
| `bool`               | Stores `true` or `false`                   | `bool isActive = true;`                     |
| `uint`               | Stores positive whole numbers              | `uint age = 20;`                            |
| `uint8` – `uint256`  | Unsigned integers with different sizes     | `uint8 score = 100;`                        |
| `int`                | Stores positive and negative whole numbers | `int temperature = -5;`                     |
| `int8` – `int256`    | Signed integers with different sizes       | `int8 value = -10;`                         |
| `address`            | Stores an Ethereum/blockchain address      | `address owner = msg.sender;`               |
| `address payable`    | Address that can receive Ether             | `address payable wallet;`                   |
| `string`             | Stores text                                | `string name = "Obed";`                     |
| `bytes`              | Stores raw binary data                     | `bytes data = "Hello";`                     |
| `bytes1` – `bytes32` | Fixed-size binary data                     | `bytes32 id;`                               |
| `enum`               | Defines a custom set of choices            | `enum Status { Pending, Approved }`         |
| `array`              | Stores multiple values                     | `uint[] numbers;`                           |
| `mapping`            | Stores key-value pairs                     | `mapping(address => uint) balances;`        |
| `struct`             | Creates a custom data structure            | `struct Student { string name; uint age; }` |

    */

    //Function Attributes.......................................
    /*
    | Keyword    | Simple meaning                  |
| ---------- | ------------------------------- |
| `public`   | Anyone can call                 |
| `private`  | Only this contract              |
| `internal` | This + child contracts          |
| `external` | Called from outside             |
| `view`     | Read data, don't change it      |
| `pure`     | Don't read/change contract data |
| `payable`  | Can receive ETH                 |
| `returns`  | What the function gives back    |
| `memory`   | Temporary data                  |
| `storage`  | Permanent blockchain data       |
| `calldata` | Temporary read-only input       |

    */

    // Variable categories
    uint oldSum=20;//state variable
    function add() public pure returns(uint256){
        uint256 a=10;//
        uint256 b=20;//local variables
        uint256 result = a+b;
        return  result;
    }
    address public user = msg.sender; //Global Variable
    // Stores the address of whoever calls the contract

    
    /*
    State Variables − Variables whose values are permanently stored in a contract storage.
    - from top example oldSum is a state variables
    Local Variables − Variables whose values are present till function is executing.
    -  from top a, b and result are all local variables
    Global Variables − Special variables exists in the global namespace used to get information about the blockchain.
    These are special variables which exist in global workspace and provide information about the blockchain and transaction properties.
    example:
    block.difficulty (uint)	        Current block difficulty
    block.gaslimit (uint)	        Current block gaslimit
    block.number (uint)	            Current block number,.....
    */

    //simple contract that takes an input parameter (argument) and returns it directly back to the UI.
    uint256 public inputNumber;
    // 'pure' means it doesn't read or write any blockchain data, making it free to call
    function showNumber(uint256 myNumber ) public pure returns (uint256){
        return myNumber;

        // uint256 newvalue=100+inputNumber; 
        //return newValue ::::::::  error since pure can't edit block-chain state data

    }
    /*
    Keyword         Reads Data?         Writes Data?            Accepts Ether ($)?          UI Cost
    pure                ❌No            ❌ No                   ❌ No                        Free
    view                Yes             ❌ No                   ❌ No                        Free
    (None)              Yes                Yes                   ❌ No                       Costs Gas
    payable             Yes                Yes                      Yes                       Costs Gas
    */
   
}

 /*
    ------------------Scope of local variables-----------------
    Public − Public state variables can be accessed internally as well as via messages. For a public state variable, an automatic getter function is generated.

    Internal − Internal state variables can be accessed only internally from the current contract or contract deriving from it without using this.

    Private − Private state variables can be accessed only internally from the current contract they are defined not in the derived contract from it.
    
    example let's create 3 contracts with inheritance below
    */

// contract Main{
//     string public roadLights="We have public lights on Road";
//     string internal roomTv="I have my own Living room TV in house";
//     string private me="Hello";

//     function PublicAccess() public returns (string memory){
//         roadLights="I Can Internally Access public lights near my house";
//         return  roadLights;
//     }
// }

// contract CallerOne{
//     Main m = new Main();
//     function ExternalAccess() public view returns (string memory){
//         // return m.me(); //error since its private
//         return  m.roadLights();
//     }
// }
// contract CallerTwo is Main{
//     function InternalAccess() public returns (string memory){
//         roomTv="Access my TV internally";
//         return roomTv;
//     }

//     function getResults() public pure returns(string memory){
//         // Add 'memory' keywords and used string.concat() to join strings
//         string memory publicLight = "Road Lights";
//         string memory publicTV = "HDTV";
//         string memory alldata = string.concat(publicLight, " ",publicTV);
//         return  alldata;
//     }
// }


