// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import { ERC721 } from "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import { Ownable } from "@openzeppelin/contracts/access/Ownable.sol";
import "./interfaces/IRandomNumberGenerator.sol";
import {Item, Type, ResultItem} from './type/PodType.sol';
import "forge-std/console.sol";

contract Pod is ERC721, Ownable{
  uint256 itemId;

  uint256 private nonce;
  IRandomNumberGenerator private randomNumberGenerator;

  mapping(uint256 itemId => Item[] items) itemInfo;
  mapping(address => ResultItem[] resultItems) userItems;

  constructor(address _initialOwner, string memory _name, string memory _symbol, 
    address _randomNumberGenerator, uint256 _initialNonce
  ) 
  Ownable(_initialOwner) 
  ERC721(_name, _symbol){
    nonce = _initialNonce;
    randomNumberGenerator = IRandomNumberGenerator(_randomNumberGenerator);
  }

  function mint (address user, Item[] memory _items) external onlyOwner{
    ++itemId;
    for (uint256 i; i < _items.length; i++) {
      uint256 sumRate;
      for(uint256 j; j < _items[i].rates.length; ++j){
        sumRate += _items[i].rates[j];
      }

      if(sumRate != 100){
        revert("Sum of rates item not equal 100");
      }
    }

    Item[] storage items = itemInfo[itemId];
    for (uint256 i = 0; i < _items.length; i++) {
        items.push(_items[i]);
    }
    _mint(user, itemId);
  }

  // function openPod(uint256 _itemId) external {
  //   require(ownerOf(_itemId) == msg.sender, "Caller is not the owner of item");

  //   Item[] memory retrieveItems = getItems(_itemId);
  //   ResultItem[] storage resultItems = userItems[msg.sender];

  //   for(uint256 i; i < retrieveItems.length; ++i){
  //     ResultItem memory item;
  //     item.types = retrieveItems[i].types;
  //     // uint256 number = randomNumberGenerator.generateRandomNumber(nonce);
  //     uint256 value = randomNumberGenerator.generateRandomNumberWithLimit(nonce, 100);
  //     console.log("value:", value);
      
  //     uint256[] memory retrieveRates = retrieveItems[i].rates;
  //     for(uint256 j; j < retrieveRates.length; ++j){
  //       if(value <= retrieveRates[j]){
  //         item.rate = retrieveRates[j];
  //         break;
  //       }
  //     }
  //     resultItems.push(item);
  //   }
  //   // console.log("resultItems:", resultItems);

  //   nonce++;
  //   delete itemInfo[_itemId];
  //   _burn(_itemId);
  // }

  function getItems(uint256 _itemId) external view returns (Item[] memory){
    return itemInfo[_itemId];
  }

  function getResultItems(address user) external view returns(ResultItem[] memory){
    return userItems[user];
  }

  function getRandomNum() external returns (uint256){
    return randomNumberGenerator.generateRandomNumber(nonce);
  }
}
