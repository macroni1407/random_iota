// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import { Test } from "forge-std/Test.sol";
import {Pod} from "../src/Pod.sol";
import {Item, Type, ResultItem} from '../src/type/PodType.sol';
import {RandomNumberGenerator} from "../src/RandomNumberGenerator.sol";
import {BaseTest} from "./Base.t.sol";
import "forge-std/console.sol";

contract PodTest is BaseTest {
  Pod pod;
  RandomNumberGenerator randomNumberGenerator;
  uint256[]  input1 = [5,10,30,55];
  uint256[]  input2 = [10,20,30,40];
  // Item[] items = [Item(Type.K9, input1), Item(Type.SEELS, input2)];
  Item[] items;
  uint256[] rates;


  function setUp() public {
    randomNumberGenerator = new RandomNumberGenerator();
    
    pod = new Pod(users.admin, "Pod", "P", address(randomNumberGenerator));
  }

  // function test_PodOpen() public {
  //   console.log(address(randomNumberGenerator));
  //   console.log(randomNumberGenerator.generateRandomNumber(1));
  // //   vm.prank(users.admin);
  // //   pod.mint(users.alice, items);

  // //   vm.prank(users.alice);
  // //   pod.openPod(1);

  //   // ResultItem[] memory results = pod.getResultItems(users.admin);

  //   // assertEq(results.length, 2);

  //   // assertEq(pod.getRandomNum(), 82412660611285413818962361592001088798161264669000717231526876367575115561014);
  //   // uint256 number = randomNumberGenerator.generateRandomNumber(1);
  //   // assertEq(number, randomNumberGenerator.generateRandomNumber(1));
  // }

    function testMintAndOpenPod() public {
        rates = [10,20,30,40];
        items = [Item({ types: Type.K9, rates: rates })];

        vm.prank(users.admin);
        pod.mint(address(this), items); 

        
            ResultItem[] memory userItems = pod.getResultItems(address(this));
            for (uint256 i = 0; i < userItems.length; i++) {
                console.log("User item rate:", userItems[i].rate);
            }
        
    }
}