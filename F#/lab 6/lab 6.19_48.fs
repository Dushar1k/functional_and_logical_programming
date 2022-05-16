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

let head list =
    match list with
    | H::T -> H
    | [] -> 0

let filter list pr =
    let rec f list_in list_out =
        match list_in with
        | H::T -> if pr H then f T (list_out@H) else f T list_out
        | [] -> list_out
    f list []

// A function that looks for the element that is repeated most often
let most_q list =
    let rec m_q list x max =
        match list with
        | [] -> x
        | H::T -> 
            if max < length (filter list (fun x -> x = H)) then m_q T H (length (filter list (fun x -> x = H))) else m_q T x max
    m_q list (head list) 1

// A function that returns a list of indexes of the cleanest element of the original list
let f list =
    let rec cr_l list list2 i x =
        match list with
        | [] -> list2
        | H::T -> if H = x then cr_l T (list2@[i]) (i+1) x else cr_l T list2 (i+1) x
    cr_l list [] 0 (most_q list)

[<EntryPoint>]
let main args = 
    let list = list_input
    printfn "%A" (f list)
    0
