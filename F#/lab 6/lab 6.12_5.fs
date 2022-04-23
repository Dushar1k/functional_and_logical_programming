open System

// Function that allows the user to enter a list from the console
let list_input =
    let rec l_i list =
        let input = Convert.ToInt32(Console.ReadLine())
        if input = 0 then list
        else l_i (list@[input])
    l_i []

// A function that checks if the element at the given index is the global minimum
let is_global_min list i =
    let rec i_g_m list min index index1 =
        match list with
        | [] -> index1 = i
        | H::T -> if H < min then i_g_m T H (index + 1) index elif H = min && i = index then i_g_m T H (index + 1) index else i_g_m T min (index+1) index1
    i_g_m list (List.head(list)) 0 0 

[<EntryPoint>]
let main args =
    printfn "%A" (is_global_min list_input (Convert.ToInt32(Console.ReadLine())))

    0