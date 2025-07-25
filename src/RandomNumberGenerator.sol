// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import "@iota/iscmagic/ISC.sol";
import "forge-std/console.sol";

/**
 * @title Random Number Generator Contract
 * @dev This contract leverages the IOTA Smart Contract Protocol's ISCSandbox to generate verifiable random numbers.
 *      It is designed to support decentralized applications by providing high-quality randomness with two main functionalities:
 *      generating unbounded random numbers and generating random numbers within a specified range. The randomness is derived
 *      from the ISCSandbox's getEntropy method, ensuring unpredictability and verifiable randomness.
 */
contract RandomNumberGenerator {

    uint256 private nonce = 0;
    uint256 public randomNum;

    constructor() {}
    /**
     * @notice Generates a random number derived from user-provided nonce and intrinsic blockchain entropy.
     * @dev This method generates an unbounded random number by hashing the combined entropy of the ISCSandbox, sender's address,
     *      and a user-provided nonce.
     * @return A pseudo-random number generated using blockchain entropy and user-provided nonce.
     */
    function generateRandomNumber() public returns (uint256) {
        ++nonce;
        bytes32 entropy = ISC.sandbox.getEntropy();
        // console.logBytes32(entropy);  // Log entropy for debugging
        bytes32 combined = keccak256(abi.encode(entropy, msg.sender, nonce));
        uint256 randomWord = uint256(combined);
        randomNum = uint256(keccak256(abi.encode(randomWord)));
        return uint256(keccak256(abi.encode(randomWord)));
    }

    /**
     * @notice Generates a bounded random number derived from user-provided nonce and intrinsic blockchain entropy.
     * @dev This method generates a random number within a specified range by first producing an unbounded random number
     *      and then applying a modulo operation to limit its range.
     * @param _lessThan The exclusive upper limit for the random number generation.
     * @return A pseudo-random number less than the specified upper limit, ensuring it fits within the desired range.
     */
    function generateRandomNumberWithLimit(uint256 _lessThan) public returns (uint256) {
        ++nonce;
        console.log(uint256(333));       
        bytes32 entropy = ISC.sandbox.getEntropy();
        console.log(uint256(123));
        console.logBytes32(entropy);  // Log entropy for debugging
        bytes32 combined = keccak256(abi.encode(entropy, msg.sender, nonce));
        uint256 randomWord = uint256(combined);
        uint256 newRand = uint256(keccak256(abi.encode(randomWord)));
        return newRand % _lessThan;
    }

}