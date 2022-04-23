open System

// Function that allows the user to enter a list from the console
let list_input =
    let rec l_i list =
        let input = Convert.ToInt32(Console.ReadLine())
        if input = 0 then list
        else l_i (list@[input])
    l_i []

// Will return a list of elements less than avg
let less_then_avg (list:int list) =
    let rec avg list (i:double) (sum:double) =
        match list with
        | (H:int)::T -> avg T (i+1.) (sum + Convert.ToDouble(H))
        | [] -> sum / i
    let av = avg list 0. 0.
    let rec lta list list1 =
        match list with
        | (H:int)::T -> lta T (if Convert.ToDouble(H) < av then (list1@[H]) else list1)
        | [] -> list1
    lta list []

[<EntryPoint>]
let main args = 
    let list = list_input
    printfn "%A" (less_then_avg list)
    0