open System

// Function that allows the user to enter a list from the console
let list_input =
    let rec l_i list =
        let input = Convert.ToInt32(Console.ReadLine())
        if input = 0 then list
        else l_i (list@[input])
    l_i []

let find_missed_int (H::T) =
    let rec fmi list list1 i =
        match list with
        | [] -> list1
        | H::T -> if H = i then fmi T list1 (i+1) else fmi list (list1@[i]) (i+1)
    fmi (H::T) [] H

[<EntryPoint>]
let main args =
    let list = list_input
    printfn "%A" (find_missed_int list)
    0
