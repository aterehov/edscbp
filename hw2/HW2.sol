// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0;

/**
 * @title Storage
 * @dev Store & retrieve value in a variable
 * @custom:dev-run-script ./scripts/deploy_with_ethers.ts
 */
struct TestStruct {
    uint256 amount;
    string purpose;
    address recepient;
    uint32 blocknum;
}

contract Storage {

    uint256 number;
    mapping(address => TestStruct) public last_transaction;
    event tx_sent(address sender, address recepient, string purpose, uint256 amount);
    event tx_cleared(address sender);

    function addtx(address sender, TestStruct calldata transaction) public {
        last_transaction[sender] = transaction;
        emit tx_sent(sender, transaction.recepient, transaction.purpose, transaction.amount);
    }

    function cleartx(address sender) public {
        delete last_transaction[sender];
        emit tx_cleared(sender);
    }

    /**
     * @dev Store value in variable
     * @param num value to store
     */
    function store(uint256 num) public {
        number = num;
    }

    /**
     * @dev Return value 
     * @return value of 'number'
     */
    function retrieve() public view returns (uint256){
        return number;
    }
}
