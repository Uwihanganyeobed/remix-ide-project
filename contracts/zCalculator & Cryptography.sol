// SPDX-License-Identifier: MIT

pragma solidity ^0.8.24;


/*
    ============================================================
                CALCULATOR & CRYPTOGRAPHY
    ============================================================

    Concepts:

    - Mathematical functions
    - Function overloading
    - Cryptography
    - keccak256
    - sha256
    - bytes
    - bytes32
    - Type conversions
*/


contract CalculatorCrypto {


    // =========================================================
    // ADD TWO NUMBERS
    // =========================================================

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
    // FUNCTION OVERLOADING
    // =========================================================

    /*
        Solidity allows multiple functions to have
        the same name if their parameters are different.

        This is called FUNCTION OVERLOADING.
    */

    function add(
        uint256 a,
        uint256 b,
        uint256 c
    )
        public
        pure
        returns (uint256)
    {

        return a + b + c;
    }


    // =========================================================
    // MULTIPLICATION
    // =========================================================

    function multiply(
        uint256 a,
        uint256 b
    )
        public
        pure
        returns (uint256)
    {

        return a * b;
    }


    // =========================================================
    // DIVISION
    // =========================================================

    function divide(
        uint256 a,
        uint256 b
    )
        public
        pure
        returns (uint256)
    {

        require(
            b != 0,
            "Cannot divide by zero"
        );

        return a / b;
    }


    // =========================================================
    // MODULO
    // =========================================================

    /*
        % returns the remainder.

        Example:

        10 % 3 = 1
    */

    function remainder(
        uint256 a,
        uint256 b
    )
        public
        pure
        returns (uint256)
    {

        return a % b;
    }


    // =========================================================
    // KECCAK256
    // =========================================================

    /*
        keccak256 creates a cryptographic hash.

        Example:

            "Hello"

                 ↓

            keccak256()

                 ↓

            0x.......
    */

    function createHash(
        string memory _text
    )
        public
        pure
        returns (bytes32)
    {

        return keccak256(
            abi.encodePacked(_text)
        );
    }


    // =========================================================
    // SHA256
    // =========================================================

    function createSHA256(
        string memory _text
    )
        public
        pure
        returns (bytes32)
    {

        return sha256(
            abi.encodePacked(_text)
        );
    }


    // =========================================================
    // HASH MULTIPLE VALUES
    // =========================================================

    function hashUser(
        string memory _name,
        uint256 _age
    )
        public
        pure
        returns (bytes32)
    {

        return keccak256(
            abi.encodePacked(
                _name,
                _age
            )
        );
    }


    // =========================================================
    // STRING → BYTES
    // =========================================================

    /*
        A string can be converted to bytes.

        string:
            "Hello"

        bytes:
            binary representation
    */

    function convertToBytes(
        string memory _text
    )
        public
        pure
        returns (bytes memory)
    {

        return bytes(_text);
    }


    // =========================================================
    // UINT256 → UINT8
    // =========================================================

    /*
        Explicit type conversion.

        uint256:
            large integer

        uint8:
            smaller integer

        Be careful!

        If the number is too large, conversion can
        produce an incorrect value.
    */

    function convertNumber(
        uint256 _number
    )
        public
        pure
        returns (uint8)
    {

        require(
            _number <= 255,
            "Number too large"
        );

        return uint8(_number);
    }


    // =========================================================
    // UINT → STRING
    // =========================================================

    /*
        Solidity does not have a simple built-in:

            uint → string

        conversion.

        In real applications you can use
        libraries such as OpenZeppelin.
    */

    // This example focuses on explicit numeric conversion.
}