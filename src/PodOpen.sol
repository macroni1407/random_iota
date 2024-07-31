// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import "./interfaces/IRandomNumberGenerator.sol";
import {Pod} from "./Pod.sol";
// import {Item, RetrieveItem} from './type/PodType.sol';

contract PodOpener {
    // uint256 private nonce;
    // IRandomNumberGenerator private randomNumberGenerator;
    // Pod private pod;

    // mapping(address => RetrieveItem[] retrieveItems) userItems;

    // constructor(address _podContract, address _randomNumberGenerator, uint256 _initialNonce) {
    //     pod = Pod(_podContract);  
    //     nonce = _initialNonce;
    //     randomNumberGenerator = IRandomNumberGenerator(_randomNumberGenerator);
    // }

    // function openPod(uint256 _itemId) public {
    //     require(pod.ownerOf(_itemId) == msg.sender, "Caller is not the owner of item");

    //     Item[] memory items = pod.getItems(_itemId);
    //     RetrieveItem[] storage retrieveItems;
    //     RetrieveItem storage item;

    //     for(uint8 i; i < items.length; ++i){
    //       item.types = items[i].types;
    //       uint64 number = randomNumberGenerator.generateRandomNumber(nonce);
    //       uint256 value = randomNumberGenerator.generateRandomNumberWithLimit(number, 100);
    //       for(uint8 j; j < items[i].rates.length; ++j){
    //         if(value <= items[i].rates[j]){
    //           item.rate = value;
    //           break;
    //         }
    //       }
    //       retrieveItems[i] = item;
    //     }

    //     userItems[msg.sender] = retrieveItems;
    //     nonce++;
    //     pod.burn(podId);
    // }
}
