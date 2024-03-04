# Learn Solidity

- object oriented
- state vairable
  > stored in blockchain itself
- static type language
- function
- modifiers
- rewriting data on chain costs gas
- constructor
- deploy on a chain

## `public` variable

```Solidity
uint256 public  count = 0;
```

deployed, gives us a free function called `count`.

## Vairables

### socpe

- state vairables
- local vairables

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
