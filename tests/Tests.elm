module Tests exposing (..)

import Test exposing (Test, describe, test, fuzz)
import Fuzz exposing (list, int)
import Expect
import BubbleSort


all : Test
all =
    describe "Sample Test Suite"
        [ describe "bubble sort tests" bubbleSort ]


bubbleSort : List Test
bubbleSort =
    [ test "it has no effect on an empty list" <|
        \() ->
            let
                list =
                    []
            in
                Expect.equal list (BubbleSort.sort list)
    , test "it has no effect on a list with a single item" <|
        \() ->
            let
                list =
                    [ 1 ]
            in
                Expect.equal list (BubbleSort.sort list)
    , test "it sorts a small list of numbers" <|
        \() ->
            let
                list =
                    [ 5, 4, 3, 2, 1 ]

                expected =
                    [ 1, 2, 3, 4, 5 ]
            in
                Expect.equal expected (BubbleSort.sort list)
    , fuzz (list int) "it always sorts correctly" <|
        \fuzzList ->
            let
                expected =
                    List.sort fuzzList
            in
                Expect.equal expected (BubbleSort.sort fuzzList)
    ]
