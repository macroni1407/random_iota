// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import { console } from "forge-std/console.sol";
import { RandomNumberGenerator } from "../src/RandomNumberGenerator.sol";
import { BaseScript } from "./Base.s.sol";

contract RandomNumberGeneratorScript is BaseScript {
    function run() public broadcast {
            
        RandomNumberGenerator randomNumberGenerator = new RandomNumberGenerator();
        randomNumberGenerator.generateRandomNumber(1);

        // console.logAddress(address(randomNumberGenerator));
    }
}
//  forge script ./script/RandomNumberGenerator.s.sol --via-ir -vvvvv --private-key 0xdbe37ce115e5f5b9a72f5bf62ae251388638b8e5545956c3c45f1d087e7b7290 --rpc-url iotatestnet  