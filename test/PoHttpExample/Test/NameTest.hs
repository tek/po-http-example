module PoHttpExample.Test.NameTest where

import Hedgehog (TestT, (===))

import PoHttpExample (name)

test_name :: TestT IO ()
test_name = "po-http-example" === name
