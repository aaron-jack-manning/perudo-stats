open General

type bet =
    {
        quantity : int;
        face : int;
    }

type state =
    {
        total_dice : int;
        hand : int list;
    }