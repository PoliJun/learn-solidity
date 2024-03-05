# Learn Solidity

-   object oriented
-   state vairable
    > stored in blockchain itself
-   static type language
-   function
-   modifiers
-   rewriting data on chain costs gas
-   constructor
-   deploy on a chain

## `public` variable

```Solidity
uint256 public  count = 0;
```

deployed, gives us a free function called `count`.

## Vairables

### socpe

-   state vairables
-   local vairables

### private and public

In Solidity, `uint256 myUint = 1;` declares a private variable `myUint` of type `uint256` with an initial value of 1. This means that the variable `myUint` can only be accessed within the contract it is defined in.

On the other hand, `uint256 public myUint = 1;` declares a public variable `myUint` of type `uint256` with an initial value of 1. This means that the variable `myUint` can be accessed from outside the contract, allowing other contracts or external entities to read its value.

In general, it is a good practice to use `public` visibility for variables that need to be accessed externally, as it provides transparency and allows other contracts to interact with the contract more easily.

### signed and unsigned

unsigned vairables can't be negative.

### Size

default is 256: uint256

### String

[String Literals and Types](https://docs.soliditylang.org/en/v0.8.24/types.html#string-literals-and-types)
String literals are written with either double or single-quotes ("foo" or 'bar'), and they can also be split into multiple consecutive parts ("foo" "bar" is equivalent to "foobar") which can be helpful when dealing with long strings. They do not imply trailing zeroes as in C; "foo" represents three bytes, not four. As with integer literals, their type can vary, but they are implicitly convertible to bytes1, …, bytes32, if they fit, to bytes and to string.

For example, with bytes32 samevar = "stringliteral" the string literal is interpreted in its raw byte form when assigned to a bytes32 type.

String literals can only contain printable ASCII characters, which means the characters between and including 0x20 .. 0x7E.

Additionally, string literals also support the following escape characters:

    \<newline> (escapes an actual newline)

    \\ (backslash)

    \' (single quote)

    \" (double quote)

    \n (newline)

    \r (carriage return)

    \t (tab)

    \xNN (hex escape, see below)

    \uNNNN (unicode escape, see below)

\xNN takes a hex value and inserts the appropriate byte, while \uNNNN takes a Unicode codepoint and inserts an UTF-8 sequence.

### addresses

```Solidity
    address public myAddress = 0x5B38Da6a701c568545dCfcB03FcB875f56beddC4;
```

## struct

```Solidity
struct MyStruct {
        uint256 myUint;
        string myString;
    }

MyStruct public myStruct = MyStruct(1, "Hello");
```

## Arrays

```Solidity
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
```

## Mappings

`mapping(Key => Value) modifier variable`

```solidity
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract myMapping {
    // Mappings
    mapping(uint => string) public names;
    mapping(uint => Book) public books;
    // Nested Mapping
    mapping(address => mapping(uint => Book)) public myBooks;

    struct Book {
        string title;
        string author;
    }

    constructor() {
        names[1] = "Adam";
        names[2] = "Bruce";
    }
    function addBook(
        uint _id,
        string memory _title,
        string memory _author
    ) public {
        books[_id] = Book(_title, _author);
    }

    function addMyBook(
        uint _id,
        string memory _title,
        string memory _author
    ) public {
        myBooks[msg.sender][_id] = Book(_title, _author);
    }
}
```

### `msg.sender`

The `msg.sender` you see in the code snippet is a global variable in Solidity, the language used to write smart contracts on the Ethereum blockchain.

In the context of a smart contract, `msg.sender` represents the address of the caller of the current function. If a function is called from a transaction (i.e., initiated by an EOA or Externally Owned Account), `msg.sender` would be the address of the account that started the transaction.

However, if the function is called from another function within a different contract, `msg.sender` would be the address of the contract that made the call, not the original EOA. This is an important distinction to make, as it can affect the control flow in your contract.

In summary, `msg.sender` is a crucial part of Solidity's security model. It allows a contract to verify who is calling a function and enables the implementation of access control mechanisms, such as only allowing the owner of a contract to call a certain function.

## Conditionals

```solidity
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract MyConditionals {
    // conditions
    uint256[] public numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
    address public owner;

    constructor() {
        owner = msg.sender;
    }

    function isEven(uint256 _number) public pure returns (bool) {
        if (_number % 2 == 0) {
            return true;
        } else {
            return false;
        }
    }

    // loops

    // for loop
    function countEvenNumbers() public view returns (uint256) {
        uint256 count = 0;
        for (uint256 i = 0; i < numbers.length; i++) {
            if (isEven(numbers[i])) {
                count++;
            }
        }
        return count;
    }

    function isOwner() public view returns (bool) {
        return (msg.sender == owner);
    }
}
```

## HotelRoom example

### payable

```solidity
address payable public owner;
```

### require function

Checks if the condition is true, if not, it throws an error.

```solidity
require(msg.value >= 2 ether, "Not enough ether provided.");
```

### modifiers

```solidity
modifier onlyWhileVacant {
        require(isVacant, "Currently occupied.");
        _;
    }
```

### don't use `transfer()`

[Transfer() in Solidity: Why you should STOP using it?](https://www.immunebytes.com/blog/transfer-in-solidity-why-you-should-stop-using-it/)

Preventive Measure

We recommend stopping using the transfer() in your code and switching to using call() instead, the most customized method of all.

```solidity
function sendMoney() public payable {
    require(msg.value >= 2 ether, "Not enough ether provided.");
    // using call() instead
    (bool success, ) = owner.call{ value: msg.value }("");
    require(success, "Transaction failed.");
}
```

## Inheritance

-   Inheritance
-   Factories
-   Interactions

```solidity
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Ownable {
    address owner;

    modifier onlyOwner() {
        require(msg.sender == owner, "You are not the owner.");
        _;
    }

    constructor() {
        owner = msg.sender;
    }
}
contract SecretVault {
    string secret;
    constructor(string memory _secret) {
        secret = _secret;
    }
    function getSecret() public view returns (string memory) {
        return secret;
    }
}
contract DemoContract is Ownable {
    // Inheritance
    // Factories
    // Interactions

    address secretVault;

    constructor(string memory _secret) public {
        SecretVault _secretVault = new SecretVault(_secret);
        secretVault = address(_secretVault);
        super;
    }

    function getSecret() public view onlyOwner returns (string memory) {
        // call another contract
        return SecretVault(secretVault).getSecret();
    }
}
```

### `is`

`contract DemoContract is Ownable`

### `super`
