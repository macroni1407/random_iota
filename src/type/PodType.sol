// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.19;

struct Item {
  Type types;
  uint256[] rates;
}

struct ResultItem {
  Type types;
  uint256 rate;
}

struct DataItem {
  uint256 tokenId;
  string types;
  uint256 rate;
  string tokenUrl;
  address user;
}

enum Type {
  K9,
  SEELS
}
