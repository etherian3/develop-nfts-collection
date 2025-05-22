// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import {Test} from "forge-std/Test.sol";
import {DeployNft} from "../script/DeployNft.s.sol";
import {BasicNft} from "../src/BasicNft.sol";

contract BasiqNftTest is Test {
    DeployNft public deployer;
    BasicNft public basicNft;

    function setUp() public {
        deployer = new DeployNft();
        basicNft = deployer.run();
    }

    function testNameIsCorrect() public view {
        string memory expectedName = "Doggs";
        string memory actualName = basicNft.name();
        // assertEq(expectedName == actualName);
        assert(
            keccak256(abi.encodePacked(expectedName)) ==
                keccak256(abi.encodePacked(actualName))
        );
    }
}
