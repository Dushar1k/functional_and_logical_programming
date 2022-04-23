open System

// Function that allows the user to enter a list from the console
let list_input =
    let rec l_i list =
        let input = Convert.ToInt32(Console.ReadLine())
        if input = 0 then list
        else l_i (list@[input])
    l_i []

// Searches for the element with the given index
let rec list_ind (list: int list) i =
    if i >= list.Length then 0
    else
        match list with
        | H::T -> if i = 0 then H else list_ind T (i-1)

// Checks if the element at the specified index is a local maximum
let is_local_max (list:int list) i =
    if list.Length > (i-1) && i > 0 && list_ind list i >= list_ind list (i+1) && list_ind list i >= list_ind list (i-1) then true
    elif i = 0 && list_ind list 0 >= list_ind list 1 then true
    elif i = list.Length && list_ind list i >= list_ind list (i-1) then true
    else false

[<EntryPoint>]
let main args = 
    let list = list_input
    let i = Convert.ToInt32(Console.ReadLine())
    printfn "%A" (is_local_max list i)
    0