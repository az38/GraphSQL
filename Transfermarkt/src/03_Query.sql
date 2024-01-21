select 
distinct
    -- need to exlucde opposite way duplication
    case when Clubs1.Name < Clubs2.Name then Clubs1.Name else Clubs2.Name end as club1
    , case when Clubs1.Name < Clubs2.Name then Clubs2.Name else Clubs1.Name end as club2
    , Players.Name as Player
from 
    Players
    , Squad as Squad1
    , Squad as Squad2 
    , Clubs as Clubs1
    , Clubs as Clubs2
where 
    MATCH (Clubs1-(Squad1)->Players<-(Squad2)-Clubs2) 
    and Clubs2.Name != Clubs1.Name

