// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract myMapping {
    // Mappings
    mapping(uint => string) public names;
    mapping(uint => Book) public books;

    struct Book {
        string title;
        string author;
    }

    constructor() {
        names[1] = "Adam";
        names[2] = "Bruce";
    }
    function addBook(uint _id, string memory _title, string memory _author) public {
        books[_id] = Book(_title, _author);
    }
}
