// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

 

contract SimpleStudent {

 

    struct Student {
        string name;
        uint age;
        uint grade;
        bool exists;
    }

  

    mapping(uint => Student) public students;
    uint public studentCount;

   

    event StudentAdded(uint indexed id, string name, uint age, uint grade);

  

    function addStudent(
        uint _id,
        string memory _name,
        uint _age,
        uint _grade
    ) public {
        // Check if student already exists
        require(!students[_id].exists, "Student ID already exists");
        
        // Validate inputs
        require(bytes(_name).length > 0, "Name cannot be empty");
        require(_age > 0 && _age < 150, "Invalid age");
        require(_grade >= 0 && _grade <= 100, "Grade must be 0-100");

        // Store student
        students[_id] = Student({
            name: _name,
            age: _age,
            grade: _grade,
            exists: true
        });

        studentCount++;

        emit StudentAdded(_id, _name, _age, _grade);
    }
 

    // Get full student details
    function getStudent(uint _id) public view returns (
        string memory,
        uint,
        uint,
        bool
    ) {
        require(students[_id].exists, "Student does not exist");
        Student memory s = students[_id];
        return (s.name, s.age, s.grade, s.exists);
    }

    // Get student name only
    function getStudentName(uint _id) public view returns (string memory) {
        require(students[_id].exists, "Student does not exist");
        return students[_id].name;
    }

    // Get student age only
    function getStudentAge(uint _id) public view returns (uint) {
        require(students[_id].exists, "Student does not exist");
        return students[_id].age;
    }

    // Get student grade only
    function getStudentGrade(uint _id) public view returns (uint) {
        require(students[_id].exists, "Student does not exist");
        return students[_id].grade;
    }

    // Check if student exists
    function studentExists(uint _id) public view returns (bool) {
        return students[_id].exists;
    }

    // Get total student count
    function getTotalStudents() public view returns (uint) {
        return studentCount;
    }
}