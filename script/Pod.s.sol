// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import { console } from "forge-std/console.sol";
import { Pod } from "../src/Pod.sol";
import { BaseScript } from "./Base.s.sol";

contract PodScript is BaseScript {
    function run() public broadcast {
        // address owner = vm.envAddress("OWNER_ADDRESS");

        // Pod pod = new Pod(owner, "", "");

        // console.logAddress(address(pod));
    }
}
