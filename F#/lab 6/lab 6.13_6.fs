open System



// Function that allows the user to enter a list from the console

let list_input =

    let rec l_i list =

        let input = Convert.ToInt32(Console.ReadLine())

        if input = 0 then list

        else l_i (list@[input])

    l_i []



let rec cyclic_shift_l list n =

    if n = 0 then list

    else

        match list with

        | H::T -> cyclic_shift_l (T@[H]) (n-1)

        | [] -> list



[<EntryPoint>]

let main args = 

    let list = list_input

    printfn "%A" (cyclic_shift_l list 3)

    0