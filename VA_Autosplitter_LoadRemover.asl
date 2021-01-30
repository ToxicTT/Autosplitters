// Velvet Assassin (PC, Steam) autosplitter
// by ToxicTT (Discord: ToxicTT#4487)
// v1.00 (09082019)
state("replay")
{
    string16 levelname   : 0x004F1018, 0x20;
    string33 startpoint  : 0x004DA8E0, 0x38;
    string23 loadedasset : 0x005378D0;
    bool isLoading       : 0x005378C4;
}

init
{
    vars.split = 0;
}

update
{
    vars.split = 0;
}

split
{
    if ((current.levelname != old.levelname) || (current.loadedasset == "fade_to_grey2_cutscene2"))
    {
        vars.split += 1;
        return true;
    }
}

start
{
    return current.startpoint == "VIOLETTE_BRIEFING_THE_LOST_PART_1";
}

reset
{
    return current.loadedasset == "intro:sound";
}

isLoading
{
   return current.isLoading;
}