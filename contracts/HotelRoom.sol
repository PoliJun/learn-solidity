// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract HotelRoom {
    // Ether payments
    // Modifiers
    // Visibility
    // Events
    // Enums

    enum Statuses {
        Vacant,
        Occupied
    }
    Statuses currentStatus;

    address payable public owner;

    event Occupy(address _occupant, uint _value);

    constructor() {
        owner = payable(msg.sender);
        currentStatus = Statuses.Vacant;
    }
    modifier onlyWhileVacant() {
        require(currentStatus == Statuses.Vacant, "Currently occupied.");
        _;
    }
    modifier costs(uint _amount) {
        require(msg.value >= _amount, "Not enough ether provided.");
        _;
    }
    function book() public payable onlyWhileVacant costs(2 ether) {
        // Check price
        // require(msg.value >= 2 ether, "Not enough ether provided.");
        // Check status
        // require(currentStatus == Statuses.Vacant, "Currently occupied.");
        currentStatus = Statuses.Occupied;
        // owner.transfer(msg.value);
        (bool sent, bytes memory data) = owner.call{value: msg.value}("");
        require(sent, "Failed to send ether");
        emit Occupy(msg.sender, msg.value);
    }
}
