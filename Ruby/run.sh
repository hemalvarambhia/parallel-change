#!/usr/bin/env bash

rspec &&
  ruby ./authentication_service.rb &&
  ruby ./shopping_cart.rb
