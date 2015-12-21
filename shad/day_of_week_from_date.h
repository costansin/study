const int month_corr[12] = {0,3,3,6,1,4,6,2,5,0,3,5};

bool IsLeapYear(int year){
    return !(year%4)&&(year%100)||!(year%400);
}

int DayByDate(int day, int month, int year){
    --month;
    --day;
    year = year%400;
    int year_in_century = year%100;
    day = (day + month_corr[month] + (IsLeapYear(year) && (month>1)) + year_in_century + 6 + (year_in_century+3)/4 - year/100 * 2 + (!(year_in_century)&&year))%7;
    return day;
}