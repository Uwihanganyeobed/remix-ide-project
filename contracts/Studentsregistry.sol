// SPDX-License-Identifier: MIT

// Solidity compiler version
pragma solidity ^0.8.24;


/*
    ============================================================
                    STUDENT REGISTRY
    ============================================================

    This contract demonstrates:

    1. Strings
    2. Arrays
    3. Structs
    4. Enums
    5. Mappings
    6. Functions
    7. Modifiers
    8. Events
    9. Constructor
    10. Special variables
*/


contract StudentRegistry {

    // =========================================================
    // 1. ENUM
    // =========================================================

    /*
        An enum allows us to create a list of possible values.

        A student can be:

        Active
        Graduated
        Suspended
    */

    enum Status {
        Active,
        Graduated,
        Suspended
    }


    // =========================================================
    // 2. STRUCT
    // =========================================================

    /*
        A struct allows us to create our own data type.

        Instead of storing:

            name
            age
            status
            registered

        separately, we group them into one Student object.
    */

    struct Student {

        string name;        // Student's name
        uint256 age;        // Student's age
        bool registered;    // Is the student registered?
        Status status;      // Student's current status
    }


    // =========================================================
    // 3. MAPPING
    // =========================================================

    /*
        A mapping works like a key-value database.

        Example:

        wallet address
                ↓
             Student

        Each blockchain address can have one Student.
    */

    mapping(address => Student) public students;


    // =========================================================
    // 4. ARRAY
    // =========================================================

    /*
        This array stores all student addresses.

        Example:

        studentAddresses[0]
        studentAddresses[1]
        studentAddresses[2]
    */

    address[] public studentAddresses;


    // =========================================================
    // 5. STATE VARIABLES
    // =========================================================

    address public owner;

    uint256 public studentCount;


    // =========================================================
    // 6. EVENT
    // =========================================================

    /*
        Events allow us to record important actions
        in blockchain transaction logs.
    */

    event StudentRegistered(
        address student,
        string name,
        uint256 age
    );


    // =========================================================
    // 7. CONSTRUCTOR
    // =========================================================

    /*
        The constructor runs ONLY ONCE:

        when the contract is deployed.

        msg.sender = the address that deployed the contract.
    */

    constructor() {

        owner = msg.sender;
    }


    // =========================================================
    // 8. REGISTER STUDENT
    // =========================================================

    function registerStudent(
        string memory _name,
        uint256 _age
    )
        public
    {

        // Make sure this address hasn't registered before.
        require(
            !students[msg.sender].registered,
            "Student already registered"
        );


        // Create a Student object.
        students[msg.sender] = Student({

            name: _name,

            age: _age,

            registered: true,

            status: Status.Active
        });


        // Add student's address to the array.
        studentAddresses.push(msg.sender);


        // Increase number of students.
        studentCount++;


        // Create a blockchain event.
        emit StudentRegistered(
            msg.sender,
            _name,
            _age
        );
    }


    // =========================================================
    // 9. GET STUDENT
    // =========================================================

    /*
        view means:

        "This function can READ blockchain data,
        but it cannot modify it."
    */

    function getStudent(
        address _student
    )
        public
        view
        returns (
            string memory,
            uint256,
            bool,
            Status
        )
    {

        Student memory student = students[_student];

        return (
            student.name,
            student.age,
            student.registered,
            student.status
        );
    }


    // =========================================================
    // 10. GET NUMBER OF STUDENTS
    // =========================================================

    function getStudentCount()
        public
        view
        returns (uint256)
    {
        return studentAddresses.length;
    }
}