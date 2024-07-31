// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import { console } from "forge-std/console.sol";
import { RandomNumberGenerator } from "../src/RandomNumberGenerator.sol";
import { BaseScript } from "./Base.s.sol";

contract RandomNumberGeneratorScript is BaseScript {
    function run() public broadcast {
  
        RandomNumberGenerator randomNumberGenerator = new RandomNumberGenerator();

        console.logAddress(address(randomNumberGenerator));
    }
}
