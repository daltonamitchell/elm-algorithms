module BubbleSort exposing (..)

import List exposing (length, reverse)


sort : List Int -> List Int
sort list =
    case list of
        [] ->
            list

        [ _ ] ->
            list

        x :: y :: rest ->
            let
                thisSort =
                    (min x y) :: sort ((max x y) :: rest)
            in
                if (sorted thisSort) then
                    thisSort
                else
                    sort thisSort


sorted : List Int -> Bool
sorted list =
    case list of
        [] ->
            True

        [ _ ] ->
            True

        x :: y :: rest ->
            if x <= y then
                sorted (y :: rest)
            else
                False
