#!/usr/bin/env bash
mkdir -p build/template
echo "first pass"
node node_modules/.bin/c-preprocessor --config pre-firstpass-config.json template/TemplateCrowdsale.sol build/template/TemplateCrowdsale.sol
node node_modules/.bin/c-preprocessor --config pre-firstpass-config.json template/BonusableCrowdsale.sol build/template/BonusableCrowdsale.sol
node node_modules/.bin/c-preprocessor --config pre-firstpass-config.json template/MainToken.sol build/template/MainToken.sol
echo "second pass"
node node_modules/.bin/c-preprocessor --config $1 build/template/TemplateCrowdsale.sol contracts/TemplateCrowdsale.sol
node node_modules/.bin/c-preprocessor --config $1 template/Consts.sol contracts/Consts.sol
node node_modules/.bin/c-preprocessor --config $1 build/template/BonusableCrowdsale.sol contracts/BonusableCrowdsale.sol
node node_modules/.bin/c-preprocessor --config $1 build/template/MainToken.sol contracts/MainToken.sol