open System

// Function that allows the user to enter a list from the console
let list_input =
    let rec l_i list =
        let input = Convert.ToInt32(Console.ReadLine())
        if input = 0 then list
        else l_i (list@[input])
    l_i []

// Looks for the element that occurs most often
let number_of_times list n = (List.filter(fun x -> x = n) list).Length

// Creates a list consisting of the indexes at which the most frequent element is located
let f list =
    let rec cr_l list list2 =
        match list with
        | H::T -> if number_of_times list H > 3 && not(List.exists(fun x -> x = H) list2) then cr_l T (list2@[H]) else cr_l T list2
        | [] -> list2
    cr_l list []

[<EntryPoint>]
let main args = 
    let list = list_input
    printfn "%A" (f list)
    0