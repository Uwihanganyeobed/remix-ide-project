// SPDX-License-Identifier: MIT

pragma solidity ^0.8.24;


/*
    ============================================================
                     UNIVERSITY SYSTEM
    ============================================================

    Advanced Solidity concepts:

    - Contracts
    - Inheritance
    - Constructors
    - Abstract contracts
    - Interfaces
    - Libraries
    - Function overriding
    - Events
    - Structs
    - Mappings
    - Assembly
*/


// =============================================================
// 1. LIBRARY
// =============================================================

/*
    A library contains reusable functions.

    Libraries are useful when the same logic is needed
    in multiple contracts.
*/

library StudentLibrary {


    // Check whether a student is an adult.
    function isAdult(
        uint256 age
    )
        internal
        pure
        returns (bool)
    {

        return age >= 18;
    }
}


// =============================================================
// 2. INTERFACE
// =============================================================

/*
    An interface defines functions that another contract
    must implement.

    Think of it as a contract specification.
*/

interface IUniversity {


    function getUniversityName()
        external
        view
        returns (string memory);


    function getStudentCount()
        external
        view
        returns (uint256);
}


// =============================================================
// 3. ABSTRACT CONTRACT
// =============================================================

/*
    An abstract contract cannot normally be deployed directly.

    It is designed to be inherited by another contract.
*/

abstract contract UniversityBase {


    string public universityName;


    // Constructor
    constructor(
        string memory _name
    ) {

        universityName = _name;
    }


    /*
        virtual means:

        A child contract can provide its own
        implementation of this function.
    */

    function getUniversityName()
        public
        view
        virtual
        returns (string memory);
}


// =============================================================
// 4. MAIN CONTRACT
// =============================================================

/*
    This contract inherits:

        UniversityBase

    and implements:

        IUniversity
*/

contract University
    is UniversityBase, IUniversity
{


    // =========================================================
    // LIBRARY
    // =========================================================

    /*
        "using ... for ..."

        allows us to use library functions
        with uint256 values.
    */

    using StudentLibrary for uint256;


    // =========================================================
    // STATE VARIABLES
    // =========================================================

    address public owner;

    uint256 public studentCount;


    // =========================================================
    // STRUCT
    // =========================================================

    struct Student {

        string name;

        uint256 age;

        bool active;
    }


    // =========================================================
    // MAPPING
    // =========================================================

    mapping(
        uint256 => Student
    ) public students;


    // =========================================================
    // EVENT
    // =========================================================

    event StudentAdded(
        uint256 indexed id,
        string name,
        uint256 age
    );


    // =========================================================
    // MODIFIER
    // =========================================================

    modifier onlyOwner() {

        require(
            msg.sender == owner,
            "Only owner"
        );

        _;
    }


    // =========================================================
    // CONSTRUCTOR
    // =========================================================

    /*
        The constructor of the parent contract
        must be initialized.

        UniversityBase(_universityName)
    */

    constructor(
        string memory _universityName
    )
        UniversityBase(_universityName)
    {

        owner = msg.sender;
    }


    // =========================================================
    // ADD STUDENT
    // =========================================================

    function addStudent(
        uint256 _id,
        string memory _name,
        uint256 _age
    )
        public
        onlyOwner
    {

        require(
            !students[_id].active,
            "Student already exists"
        );


        students[_id] = Student({

            name: _name,

            age: _age,

            active: true
        });


        studentCount++;


        emit StudentAdded(
            _id,
            _name,
            _age
        );
    }


    // =========================================================
    // INHERITANCE + OVERRIDE
    // =========================================================

    /*
        The parent contract declared:

            virtual

        Therefore this contract can implement it
        using:

            override
    */

    function getUniversityName()
    public
    view
    override(IUniversity, UniversityBase)
    returns (string memory)
{
    return universityName;
}


    // =========================================================
    // INTERFACE FUNCTION
    // =========================================================

    /*
        This function satisfies the interface:

            IUniversity

    */

    function getStudentCount()
        public
        view
        override
        returns (uint256)
    {

        return studentCount;
    }


    // =========================================================
    // LIBRARY FUNCTION
    // =========================================================

    function checkStudentAge(
        uint256 _age
    )
        public
        pure
        returns (bool)
    {

        /*
            Because of:

                using StudentLibrary for uint256;

            we can write:

                _age.isAdult()

            instead of:

                StudentLibrary.isAdult(_age)
        */

        return _age.isAdult();
    }


    // =========================================================
    // ASSEMBLY
    // =========================================================

    /*
        Assembly provides low-level access to the
        Ethereum Virtual Machine (EVM).

        It should be used carefully.

        This example simply returns the current
        block timestamp using EVM's timestamp opcode.
    */

    function getTimestampAssembly()
    public
    view
    returns (uint256 currentTime)
{
    assembly {
        currentTime := timestamp()
    }
}
}