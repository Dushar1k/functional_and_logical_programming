open System

// Function that allows the user to enter a list from the console
let list_input =
    let rec l_i list =
        let input = Convert.ToInt32(Console.ReadLine())
        if input = 0 then list
        else l_i (list@[input])
    l_i []

// A function that looks for the element that is repeated most often
let most_q list =
    let rec m_q list x max =
        match list with
        | [] -> x
        | H::T -> 
            if max < (List.filter(fun x -> x = H) list).Length then m_q T H ((List.filter(fun x -> x = H) list).Length) else m_q T x max
    m_q list (list.Head) 1

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