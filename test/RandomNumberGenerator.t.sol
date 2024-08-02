// SPDX-License-Identifier: MIT
// pragma solidity ^0.8.19;
pragma solidity ^0.8.5;

import "forge-std/Test.sol";
import "../src/RandomNumberGenerator.sol";
import "forge-std/console.sol";
import {ISCSandbox} from "@iota/iscmagic/ISC.sol";

import "@iota/iscmagic/ISC.sol";

contract Random {
    event Int(uint256);
    event Bytes(bytes);

    uint256 private _nonce;

    function getNonce() internal returns (bytes32) {
        return bytes32(_nonce++);
    }

    function getInt() public returns (uint256) {
        bytes32 entropy = ISC.sandbox.getEntropy();
        bytes32 nonce = getNonce();
        bytes32 digest = keccak256(bytes.concat(entropy, nonce));

        uint256 value = uint256(digest);

        emit Int(value);
        return value;
    }

    function getBytes(uint length) public returns (bytes memory) {
        bytes32 entropy = ISC.sandbox.getEntropy();
        bytes32 nonce = getNonce();
        bytes32 digest = keccak256(bytes.concat(entropy, nonce));

        bytes memory value = new bytes(length);
        for (uint i = 0; i < length; i += 32) {
            digest = keccak256(bytes.concat(digest));
            for (uint j = 0; j < 32 && i + j < length; j++) {
                value[i + j] = digest[j];
            }
        }

        emit Bytes(value);
        return value;
    }
}

contract RandomNumberGeneratorTest is Test {
    RandomNumberGenerator rng;
  Random random; 
    address constant ISC_MAGIC_ADDRESS = 0x1074000000000000000000000000000000000000;


    modifier setFork(uint256 _fork) {
        vm.selectFork(_fork);
        _;
    }

    function setUp() public {
      uint256 fork = vm.createFork(vm.envString("IOTA_RPC_URL"));
 
      vm.selectFork(fork);
    //   ISCSandbox(ISC_MAGIC_ADDRESS).getEntropy();
    //   random = new Random(); 
    //   random.getInt();
      rng =  RandomNumberGenerator(0x9E77470de8D3c4c6Bb28e7966F7adf335eaDE997);
    }


    function testGenerateRandomNumber() public {
        uint256 randomNum = rng.generateRandomNumber(1);
        // rng.getInt();

        // console.log(randomNum);
        // emit log_uint(randomNum);
        // assert(randomNum > 0);
    }


    function testGenerateRandomNumberWithLimit() public {
        uint256 randomNum = rng.generateRandomNumberWithLimit(1, 100);
        console.log(randomNum);
        // emit log_uint(randomNum);
        // assert(randomNum >= 0 && randomNum < 100);
    }
}