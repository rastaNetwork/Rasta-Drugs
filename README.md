Just a script I'm using to learn how to code efficently.

QB-Core Script. Requested by a City I Dev For.

Overdose Mechanism: Upon consuming a pill, there's a random chance that the player character will overdose, leading to immediate "death" in-game (health set to 0). This adds a risk element to pill consumption.
Health Regeneration: If the player does not overdose, they experience health regeneration over 20 minutes, where their health incrementally increases by 8-16% of their maximum health every 2 minutes. 
This simulates the healing or beneficial effects of the pill.

Screen Effects: Alongside the health regeneration, a visual effect (DrugsTrevorClownsFight) is applied to the player's screen to simulate the in-game character experiencing the effects of the pill. This screen effect is re-applied with each health regeneration cycle and is stopped when the 20-minute duration ends, returning the player's screen to normal.


ITEMS!!!

    ['fentanyl_pill']   = {['name'] = 'fentanyl_pill',      ['label'] = 'Fentanyl Pill',    ['weight'] = 150, ['type'] = 'item', ['image'] = 'fentanyl_pill.png', ['unique'] = false, ['useable'] = true, ['shouldClose'] = true, ['combinable'] = nil, ['description'] = 'A powerful painkiller with a high risk of overdose.'},
    ['jiggas_pill']     = {['name'] = 'jiggas_pill',        ['label'] = 'Jiggas Pill',      ['weight'] = 150, ['type'] = 'item', ['image'] = 'jiggas_pill.png',   ['unique'] = false, ['useable'] = true, ['shouldClose'] = true, ['combinable'] = nil, ['description'] = 'A mysterious pill that relaxes your body and mind.'},

IMAGES COMING LATER!
