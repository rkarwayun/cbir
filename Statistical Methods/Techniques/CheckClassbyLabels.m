function bool = CheckClassbyLabels( query_num, result_num )
%CHECKCLASSBYLABELS Summary of this function goes here
%   Detailed explanation goes here

if (query_num >=0 && query_num<=99) queryclass = 1;
end
if (query_num >=100 && query_num<=199) queryclass = 2;
end
if (query_num >=200 && query_num<=299) queryclass = 3;
end
if (query_num >=300 && query_num<=399) queryclass = 4;
end
if (query_num >=400 && query_num<=499) queryclass = 5;
end
if (query_num >=500 && query_num<=599) queryclass = 6;
end
if (query_num >=600 && query_num<=699) queryclass = 7;
end
if (query_num >=700 && query_num<=799) queryclass = 8;
end
if (query_num >=800 && query_num<=899) queryclass = 9;
end
if (query_num >=900 && query_num<=999) queryclass = 10;
end

if (result_num >=0 && result_num<=99) resultclass = 1;
end
if (result_num >=100 && result_num<=199) resultclass = 2;
end
if (result_num >=200 && result_num<=299) resultclass = 3;
end
if (result_num >=300 && result_num<=399) resultclass = 4;
end
if (result_num >=400 && result_num<=499) resultclass = 5;
end
if (result_num >=500 && result_num<=599) resultclass = 6;
end
if (result_num >=600 && result_num<=699) resultclass = 7;
end
if (result_num >=700 && result_num<=799) resultclass = 8;
end
if (result_num >=800 && result_num<=899) resultclass = 9;
end
if (result_num >=900 && result_num<=999) resultclass = 10;
end

if (queryclass == resultclass) 
    bool = 1;
    else bool = 0;
end

end

