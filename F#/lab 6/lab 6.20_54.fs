open System

// Function that allows the user to enter a list from the console
let list_input =
    let rec l_i list =
        let input = Convert.ToInt32(Console.ReadLine())
        if input = 0 then list
        else l_i (list@[input])
    l_i []

let length list =
    let rec l list n =
        match list with
        | H::T -> l T (n+1)
        | [] -> n
    l list 0

let filter list pr =
    let rec f list_in list_out =
        match list_in with
        | H::T -> if pr H then f T (list_out@H) else f T list_out
        | [] -> list_out
    f list []

let exists list pr =
    let rec ex list =
        match list with
        | H::T -> if pr H then true else ex T
        | [] -> false
    ex list

// Looks for the element that occurs most often
let number_of_times list n = length (filter list (fun x -> x = n))

// Creates a list consisting of the indexes at which the most frequent element is located
let f list =
    let rec cr_l list list2 =
        match list with
        | H::T -> if number_of_times list H > 3 && not(exists list2 (fun x -> x = H)) then cr_l T (list2@[H]) else cr_l T list2
        | [] -> list2
    cr_l list []

[<EntryPoint>]
let main args = 
    let list = list_input
    printfn "%A" (f list)
    0
