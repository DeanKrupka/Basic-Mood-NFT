//SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import {Script, console} from "forge-std/Script.sol";
import {MoodNft} from "../src/MoodNft.sol";
import {Base64} from "@openzeppelin/contracts/utils/Base64.sol";

contract DeployMoodNft is Script {
    function run() external returns (MoodNft){
        string memory sadSvg = vm.readFile("./img/sad.svg");
        string memory happySvg = vm.readFile("./img/happy.svg");

        vm.startBroadcast();
        MoodNft moodNft = new MoodNft();
        (svgToImageUri(sadSvg), svgToImageUri(happySvg));
        return moodNft;
    }

    function svgToImageUri(
        string memory svg
    ) public pure returns (string memory) {
        // This takes in something like:
        // <svg viewBox="0 0 ... >
        // --------------------------------------
        // And returns something like:
        // data:image/svg+xml;base64,PHN2Z... ...
        // -------------------------------------- 
        string memory baseUrl = "data:image/svg+xml;base64,";
        string memory svgBase64encoded = Base64.encode(
            bytes(sting(abi.encodePacked(svg)))
        );
        return string(abi.encodePacked(baseUrl, svgBase64encoded));
    }
}