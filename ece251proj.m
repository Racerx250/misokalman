
%third value starts to include pediatric
total_icu_bed_capacity = [781, 785, 970, 970, 970, 970, 969, 975, 984, 979, ...
    979, 979, 979, 1010, 1057, 1062, 1101, 1164, 1164, 1161, 1158, 1160, 1160, 1160, 1160, 1160];
occupied_icu_bed = [526, 583, 724, 725, 743, 762, 732, 740, 758, 764, 749, ...
    699, 681, 774, 795, 800, 853, 893, 908, 880, 838, 919, 879, 864, 871, 924];
occupied_icu_bed_covid = [193, 250, 263, 252, 272, 307, 315, 328, 386, 382, ...
    373, 426, 409, 426, 421, 449, 460, 450, 477, 426, 446, 462, 482, 465, 473, 465];
occupied_icu_bed_covid_confirmed = [92, 143, 147, 140, 156, 196, 180, 213, ...
    243, 265, 264, 272, 283, 314, 319, 333, 364, 361, 391, 344, 375, 377, 410, 401, 411, 400];
occupied_icu_bed_covid_pui = [101, 107, 116, 112, 116, 111, 135, 115, 143, ...
    117, 109, 154, 126, 112, 102, 116, 96, 89, 86, 82, 71, 85, 72, 64, 62, 65];
occupied_icu_bed_noncovid = [333, 333, 461, 473, 471, 455, 417, 412, 372, ...
    382, 376, 273, 272, 348, 374, 351, 393, 443, 431, 454, 392, 457, 397, 399, 398, 459];
available_icu_bed = [255, 202, 246, 245, 227, 208, 237, 235, 226, 215, 230, ...
    280, 298, 236, 262, 262, 248, 271, 256, 281, 320, 241, 281, 296, 289, 236];
available_bed_adult = [209, 201, 191, 174, 197, 197, 176, 167, 188, 210, 229, ...
    180, 207, 216, 173, 215, 199, 198, 224, 191, 222, 212, 207, 175];
available_bed_pediatric = [37, 44, 36, 34, 40, 38, 50, 48, 42, 70, 69, 56, ...
    55, 46, 75, 56, 57, 83, 96, 50, 59, 84, 82, 61];
adult_icu_surge_capacity = [121, 152, 183, 218, 176, 167, 222, 240, 144, ...
    175, 167, 218, 201, 162, 153, 151, 133, 112, 131, 207, 142, 138, 149, 121];
pediatric_icu_surge_capacity = [36, 35, 17, 8, 24, 24, 26, 33, 30, 54, 24, ...
    35, 24, 28, 30, 32, 40, 35, 24, 24, 24, 38, 35, 35];

% starts on 4/3
non_icu_capacity = [7269, 6543, 6523, 6523, 6617, 6918, 7214, 7182, 7243, 7236, 7268, 7286, 7286, 7289, 7286, 7369, 7369];
non_icu_occupied = [4845, 4490, 4520, 4484, 4559, 5041, 5297, 5343, 5246, 5384, 5497, 5627, 5536, 5385, 5194, 5329, 5605];
non_icu_occupid_covid = [693, 791, 788, 850, 889, 905, 967, 1000, 972, 978, 1032, 1050, 1119, 1082, 1138, 1053, 1008];
non_icu_occupid_noncovid = [4152, 3699, 3732, 3634, 3670, 4136, 4330, 4343, 4274, 4406, 4465, 4577, 4417, 4303, 4056, 4276, 4597];
available_beds = [2424, 2053, 2003, 2039, 2058, 1877, 1917, 1839, 1997, 1852, 1771, 1659, 1750, 1901, 2092, 2040, 1764];

% starts on 4/6
mc_place = [500, 500, 500, 500, 500, 500, 500, 500, 500, 500, 497, 497, 495, 495];

total_ventilators = [1045, 1047, 1053, 1042, 1053, 1078, 1157, 1166, 1210, ...
    1206, 1300, 1230, 1259, 1237, 1250, 1269, 1266, 1291, 1271, 1335, 1341, ...
    1418, 1425, 1403, 1419, 1409];
ventilators_in_use = [476, 423, 422, 479, 495, 544, 597, 610, 603, 611, 649, ...
    662, 656, 639, 637, 645, 652, 626, 714, 638, 658, 733, 686, 671, 712, ...
    725];
ventilators_covid = [134, 127, 137, 170, 180, 211, 215, 219, 246, 279, 275, ...
    312, 303, 323, 326, 306, 306, 313, 316, 316, 325, 318, 331, 331, 313, 315];
ventilator_covid_confirmed = [81, 88, 89, 108, 121, 149, 140, 163, 187, 200, ...
    196, 224, 223, 233, 252, 245, 251, 269, 275, 264, 270, 265, 290, 296, 276, 278];
ventilator_covid_pui = [53, 39, 48, 62, 59, 62, 75, 56, 59, 79, 79, 88, 80, ...
    90, 74, 61, 55, 44, 41, 52, 55, 53, 41, 35, 37, 37];
ventilator_noncovid = [342, 296, 285, 309, 315, 333, 382, 391, 357, 332, 374, ...
    350, 353, 316, 311, 339, 346, 313, 398, 322, 333, 415, 355, 340, 399, 410];
available_ventilators = [569, 624, 631, 563, 558, 534, 560, 556, 607, 595, 651, ...
    568, 603, 598, 613, 624, 613, 665, 557, 697, 683, 685, 739, 732, 707, 684];
available_ventilators_hospital = [445, 500, 507, 439, 434, 410, 436, 432, 483, ...
    471, 527, 518, 553, 548, 563, 574, 563, 615, 557, 647, 633, 635, 689, 682, 657, 634];
available_ventilators_eams = [124, 124, 124, 124, 124, 124, 124, 124, 124, 124, ...
    124, 50, 50, 50, 50, 50, 50, 50, 0, 50, 50, 50, 50, 50, 50, 50];
ventilator_surge_capacity = [231, 235, 213, 196, 214, 206, 270, 266, 236, 247, ...
    226, 237, 237, 260, 266, 297, 291, 252, 322, 260, 314, 321, 244];

fileID = fopen("asdf.txt",'r');
formatSpec = '%f';
A = fscanf(fileID,formatSpec);

for i = 1:length(A)
    val = A(i);
    
    if mod(i - 1, 27) == 0
        total_icu_bed_capacity = [total_icu_bed_capacity val];
    end
    if mod(i - 1, 27) == 1
        occupied_icu_bed = [occupied_icu_bed val];
    end
    if mod(i - 1, 27) == 2
        occupied_icu_bed_covid = [occupied_icu_bed_covid val];
    end
    if mod(i - 1, 27) == 3
        occupied_icu_bed_covid_confirmed = [occupied_icu_bed_covid_confirmed val];
    end
    if mod(i - 1, 27) == 4
        occupied_icu_bed_covid_pui = [occupied_icu_bed_covid_pui val];
    end
    if mod(i - 1, 27) == 5
        occupied_icu_bed_noncovid = [occupied_icu_bed_noncovid val];
    end
    if mod(i - 1, 27) == 6
        available_icu_bed = [available_icu_bed val];
    end
    if mod(i - 1, 27) == 7
        pediatric_icu_surge_capacity = [pediatric_icu_surge_capacity val];
    end
    if mod(i - 1, 27) == 8
        available_bed_adult = [available_bed_adult val];
    end
    if mod(i - 1, 27) == 9
        available_bed_pediatric = [available_bed_pediatric val];
    end
    if mod(i - 1, 27) == 10
        adult_icu_surge_capacity = [adult_icu_surge_capacity val];
    end
    if mod(i - 1, 27) == 11
        non_icu_capacity = [non_icu_capacity val];
    end
    if mod(i - 1, 27) == 12
        non_icu_occupied = [non_icu_occupied val];
    end
    if mod(i - 1, 27) == 13
        non_icu_occupid_covid = [non_icu_occupid_covid val];
    end
    if mod(i - 1, 27) == 14
        non_icu_occupid_noncovid = [non_icu_occupid_noncovid val];
    end
    if mod(i - 1, 27) == 15
        available_beds = [available_beds val];
    end
    if mod(i - 1, 27) == 16
        mc_place = [mc_place val];
    end
    if mod(i - 1, 27) == 17
        total_ventilators = [total_ventilators val];
    end
    if mod(i - 1, 27) == 18
        ventilators_in_use = [ventilators_in_use val];
    end
    if mod(i - 1, 27) == 19
        ventilators_covid = [ventilators_covid val];
    end
    if mod(i - 1, 27) == 20
        ventilator_covid_confirmed = [ventilator_covid_confirmed val];
    end
    if mod(i - 1, 27) == 21
        ventilator_covid_pui = [ventilator_covid_pui val];
    end
    if mod(i - 1, 27) == 22
        ventilator_noncovid = [ventilator_noncovid val];
    end
    if mod(i - 1, 27) == 23
        available_ventilators = [available_ventilators val];
    end
    if mod(i - 1, 27) == 24
        available_ventilators_hospital = [available_ventilators_hospital val];
    end
    if mod(i - 1, 27) == 25
        available_ventilators_eams = [available_ventilators_eams val];
    end
    if mod(i - 1, 27) == 26
        ventilator_surge_capacity = [ventilator_surge_capacity val];
    end
end

fileID = fopen("asdf2.txt",'r');
formatSpec = '%f';
A = fscanf(fileID,formatSpec);

for i = 1:length(A)
    val = A(i);
    
    if mod(i - 1, 29) == 0
        total_icu_bed_capacity = [total_icu_bed_capacity val];
    end
    if mod(i - 1, 29) == 1
        occupied_icu_bed = [occupied_icu_bed val];
    end
    if mod(i - 1, 29) == 2
        occupied_icu_bed_covid = [occupied_icu_bed_covid val];
    end
    if mod(i - 1, 29) == 3
        occupied_icu_bed_covid_confirmed = [occupied_icu_bed_covid_confirmed val];
    end
    if mod(i - 1, 29) == 4
        occupied_icu_bed_covid_pui = [occupied_icu_bed_covid_pui val];
    end
    if mod(i - 1, 29) == 5
        occupied_icu_bed_noncovid = [occupied_icu_bed_noncovid val];
    end
    if mod(i - 1, 29) == 6
        available_icu_bed = [available_icu_bed val];
    end
    if mod(i - 1, 29) == 7
        pediatric_icu_surge_capacity = [pediatric_icu_surge_capacity val];
    end
    if mod(i - 1, 29) == 8
        available_bed_adult = [available_bed_adult val];
    end
    if mod(i - 1, 29) == 9
        available_bed_pediatric = [available_bed_pediatric val];
    end
    if mod(i - 1, 29) == 10
        adult_icu_surge_capacity = [adult_icu_surge_capacity val];
    end
    if mod(i - 1, 29) == 11
        non_icu_capacity = [non_icu_capacity val];
    end
    if mod(i - 1, 29) == 12
        non_icu_occupied = [non_icu_occupied val];
    end
    if mod(i - 1, 29) == 13
        non_icu_occupid_covid = [non_icu_occupid_covid val];
    end
    if mod(i - 1, 29) == 14
        non_icu_occupid_noncovid = [non_icu_occupid_noncovid val];
    end
    if mod(i - 1, 29) == 17
        available_beds = [available_beds val];
    end
    if mod(i - 1, 29) == 18
        mc_place = [mc_place val];
    end
    if mod(i - 1, 29) == 19
        total_ventilators = [total_ventilators val];
    end
    if mod(i - 1, 29) == 20
        ventilators_in_use = [ventilators_in_use val];
    end
    if mod(i - 1, 29) == 21
        ventilators_covid = [ventilators_covid val];
    end
    if mod(i - 1, 29) == 22
        ventilator_covid_confirmed = [ventilator_covid_confirmed val];
    end
    if mod(i - 1, 29) == 23
        ventilator_covid_pui = [ventilator_covid_pui val];
    end
    if mod(i - 1, 29) == 24
        ventilator_noncovid = [ventilator_noncovid val];
    end
    if mod(i - 1, 29) == 25
        available_ventilators = [available_ventilators val];
    end
    if mod(i - 1, 29) == 26
        available_ventilators_hospital = [available_ventilators_hospital val];
    end
    if mod(i - 1, 29) == 27
        available_ventilators_eams = [available_ventilators_eams val];
    end
    if mod(i - 1, 29) == 28
        ventilator_surge_capacity = [ventilator_surge_capacity val];
    end
end
