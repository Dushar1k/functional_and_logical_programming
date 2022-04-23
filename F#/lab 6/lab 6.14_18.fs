open System



// Function that allows the user to enter a list from the console

let list_input =

    let rec l_i list =

        let input = Convert.ToInt32(Console.ReadLine())

        if input = 0 then list

        else l_i (list@[input])

    l_i []



let min list =

    let rec m list min =

        match list with

        | [] -> min

        | H::T -> if H < min then m T H else m T min

    m list list.Head



let first_in_index list x =

    let rec fin list i =

        match list with

        | [] -> -1

        | H::T -> if H = x then i else fin T (i+1)

    fin list 0


// Cuts off the tail of the list from the given index

let cut_tail list i =

    let rec rmt list list1 i =

        match list with

        | [] -> list1

        | H::T -> if i = 0 then list1 else rmt T (list1@[H]) (i-1)

    rmt list [] i



[<EntryPoint>]

let main args =

    let list = list_input

    printfn "%A" ( cut_tail list ( first_in_index list ( min list ) ) )

    0