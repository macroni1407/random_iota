// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import { console } from "forge-std/console.sol";
// import { IRandomNumberGenerator } from "../src/interfaces/IRandomNumberGenerator.sol";
import { RandomNumberGenerator } from "../src/RandomNumberGenerator.sol";
import { BaseScript } from "./Base.s.sol";

contract RandomNumberGeneratorScript is BaseScript {

    // IRandomNumberGenerator randomNumberGenerator;
    RandomNumberGenerator randomNumberGenerator;
    function run() public broadcast {
            
        randomNumberGenerator = RandomNumberGenerator(0x657509345569785547B7FB7e407CF3F2D34E5c57);
        // randomNumberGenerator = new RandomNumberGenerator();
        console.log("address", address(randomNumberGenerator));
        uint256 value = randomNumberGenerator.generateRandomNumber();
        console.log("randomNumberGenerator", value);
        console.log("randomNum", randomNumberGenerator.randomNum());
        
            
        // console.logAddress(address(randomNumberGenerator));
    }
}
//  forge script ./script/RandomNumberGenerator.s.sol --via-ir -vvvvv --private-key 0xdbe37ce115e5f5b9a72f5bf62ae251388638b8e5545956c3c45f1d087e7b7290 --rpc-url iotatestnet  