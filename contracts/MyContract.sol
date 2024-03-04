// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract MyContract {
    // State Variables
    uint256 myUint = 1;

    string public myString = "Hello";
    string public myString2 =
        "Hello"
        "World";

    address public myAddress = 0x5B38Da6a701c568545dCfcB03FcB875f56beddC4;

    struct MyStruct {
        uint256 myUint;
        string myString;
    }

    MyStruct public myStruct = MyStruct(1, "Hello");
    uint256[] public myArray = [1, 2, 3];
    string[] public stringArr = ["apple", "banana", "carrot"];
    string[] public values;
    uint256[][] public array2D = [[1, 2, 3], [4, 5, 6]];

    function addValue(string memory _value) public {
        values.push(_value);
    }

    function valueCount() public view returns (uint256) {
        return values.length;
    }

    // Local Variable
    function getValue() public pure returns (uint256) {
        uint256 value = 1;
        return value;
    }

    // map
    mapping(address => uint256) myMapping;
    mapping(uint => string) names;
}
