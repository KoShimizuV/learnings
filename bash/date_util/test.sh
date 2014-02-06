#!/bin/sh
#                                2014                               
# 
#          1月                    2月                    3月        
# 日 月 火 水 木 金 土   日 月 火 水 木 金 土   日 月 火 水 木 金 土
#           1  2  3  4                      1                      1
#  5  6  7  8  9 10 11    2  3  4  5  6  7  8    2  3  4  5  6  7  8
# 12 13 14 15 16 17 18    9 10 11 12 13 14 15    9 10 11 12 13 14 15
# 19 20 21 22 23 24 25   16 17 18 19 20 21 22   16 17 18 19 20 21 22
# 26 27 28 29 30 31      23 24 25 26 27 28      23 24 25 26 27 28 29
#                                               30 31
#          4月                    5月                    6月        
# 日 月 火 水 木 金 土   日 月 火 水 木 金 土   日 月 火 水 木 金 土
#        1  2  3  4  5                1  2  3    1  2  3  4  5  6  7
#  6  7  8  9 10 11 12    4  5  6  7  8  9 10    8  9 10 11 12 13 14
# 13 14 15 16 17 18 19   11 12 13 14 15 16 17   15 16 17 18 19 20 21
# 20 21 22 23 24 25 26   18 19 20 21 22 23 24   22 23 24 25 26 27 28
# 27 28 29 30            25 26 27 28 29 30 31   29 30
# 
#          7月                    8月                    9月        
# 日 月 火 水 木 金 土   日 月 火 水 木 金 土   日 月 火 水 木 金 土
#        1  2  3  4  5                   1  2       1  2  3  4  5  6
#  6  7  8  9 10 11 12    3  4  5  6  7  8  9    7  8  9 10 11 12 13
# 13 14 15 16 17 18 19   10 11 12 13 14 15 16   14 15 16 17 18 19 20
# 20 21 22 23 24 25 26   17 18 19 20 21 22 23   21 22 23 24 25 26 27
# 27 28 29 30 31         24 25 26 27 28 29 30   28 29 30
#                        31
#         10月                   11月                   12月        
# 日 月 火 水 木 金 土   日 月 火 水 木 金 土   日 月 火 水 木 金 土
#           1  2  3  4                      1       1  2  3  4  5  6
#  5  6  7  8  9 10 11    2  3  4  5  6  7  8    7  8  9 10 11 12 13
# 12 13 14 15 16 17 18    9 10 11 12 13 14 15   14 15 16 17 18 19 20
# 19 20 21 22 23 24 25   16 17 18 19 20 21 22   21 22 23 24 25 26 27
# 26 27 28 29 30 31      23 24 25 26 27 28 29   28 29 30 31
#                        30
# 

cd `dirname $0`
. ${PWD}/util.sh

echo "add_day"
if [ `add_day 20140207 +1` -eq 20140208 ] ; then echo -n "."; else echo "NG"; fi
if [ `add_day 20140207 +2` -eq 20140209 ] ; then echo -n "."; else echo "NG"; fi
if [ `add_day 20140207 -1` -eq 20140206 ] ; then echo -n "."; else echo "NG"; fi
if [ `add_day 20140207 -2` -eq 20140205 ] ; then echo -n "."; else echo "NG"; fi
if [ `add_day 20140201 -1` -eq 20140131 ] ; then echo -n "."; else echo "NG"; fi
echo ";"

echo "weekend"
if [ `is_weekend 20140207` -eq 0 ] ; then echo -n "."; else echo "NG"; fi
if [ `is_weekend 20140208` -eq 1 ] ; then echo -n "."; else echo "NG"; fi
if [ `is_weekend 20140209` -eq 1 ] ; then echo -n "."; else echo "NG"; fi
if [ `is_weekend 20140210` -eq 0 ] ; then echo -n "."; else echo "NG"; fi
if [ `is_weekend 20140211` -eq 0 ] ; then echo -n "."; else echo "NG"; fi
echo ";"

echo "add_week_day"
if [ `add_week_day 20140207 +1` -eq 20140210 ] ; then echo -n "."; else echo "NG"; fi
if [ `add_week_day 20140207 +2` -eq 20140210 ] ; then echo -n "."; else echo "NG"; fi
if [ `add_week_day 20140207 +3` -eq 20140210 ] ; then echo -n "."; else echo "NG"; fi
if [ `add_week_day 20140208  0` -eq 20140210 ] ; then echo -n "."; else echo "NG"; fi
if [ `add_week_day 20140208 +1` -eq 20140210 ] ; then echo -n "."; else echo "NG"; fi
if [ `add_week_day 20140209 +1` -eq 20140210 ] ; then echo -n "."; else echo "NG"; fi
if [ `add_week_day 20140207 -1` -eq 20140206 ] ; then echo -n "."; else echo "NG"; fi
if [ `add_week_day 20140201 -1` -eq 20140131 ] ; then echo -n "."; else echo "NG"; fi
if [ `add_week_day 20140203 -1` -eq 20140131 ] ; then echo -n "."; else echo "NG"; fi
if [ `add_week_day 20140208 -1` -eq 20140207 ] ; then echo -n "."; else echo "NG"; fi
if [ `add_week_day 20140209 -1` -eq 20140207 ] ; then echo -n "."; else echo "NG"; fi
if [ `add_week_day 20140210 -1` -eq 20140207 ] ; then echo -n "."; else echo "NG"; fi
if [ `add_week_day 20140210 -2` -eq 20140207 ] ; then echo -n "."; else echo "NG"; fi
if [ `add_week_day 20140210 -3` -eq 20140207 ] ; then echo -n "."; else echo "NG"; fi
echo ";"

echo "is_holiday"
if [ `is_holiday 20140208` -eq 1 ] ; then echo -n "."; else echo "NG"; fi
if [ `is_holiday 20140209` -eq 1 ] ; then echo -n "."; else echo "NG"; fi
if [ `is_holiday 20140211` -eq 1 ] ; then echo -n "."; else echo "NG"; fi
echo ";"

echo "add_biz_day"
if [ `add_biz_day 20140207  0` -eq 20140207 ] ; then echo -n "."; else echo "NG"; fi
if [ `add_biz_day 20140207 +1` -eq 20140210 ] ; then echo -n "."; else echo "NG"; fi
if [ `add_biz_day 20140208  0` -eq 20140210 ] ; then echo -n "."; else echo "NG"; fi
if [ `add_biz_day 20140208 +1` -eq 20140210 ] ; then echo -n "."; else echo "NG"; fi
if [ `add_biz_day 20140209  0` -eq 20140210 ] ; then echo -n "."; else echo "NG"; fi
if [ `add_biz_day 20140209 +1` -eq 20140210 ] ; then echo -n "."; else echo "NG"; fi
if [ `add_biz_day 20140207 -1` -eq 20140206 ] ; then echo -n "."; else echo "NG"; fi
if [ `add_biz_day 20140201 -1` -eq 20140131 ] ; then echo -n "."; else echo "NG"; fi
if [ `add_biz_day 20140203 -1` -eq 20140131 ] ; then echo -n "."; else echo "NG"; fi
if [ `add_biz_day 20140208 -1` -eq 20140207 ] ; then echo -n "."; else echo "NG"; fi
if [ `add_biz_day 20140209 -1` -eq 20140207 ] ; then echo -n "."; else echo "NG"; fi

if [ `add_biz_day 20140210 +1` -eq 20140212 ] ; then echo -n "."; else echo "NG"; fi
if [ `add_biz_day 20140211  0` -eq 20140212 ] ; then echo -n "."; else echo "NG"; fi
if [ `add_biz_day 20140211 +1` -eq 20140212 ] ; then echo -n "."; else echo "NG"; fi
if [ `add_biz_day 20140212 -1` -eq 20140210 ] ; then echo -n "."; else echo "NG"; fi
echo ";"

echo "first day of month"
if [ `first_day_of_month 201402` -eq 20140201 ] ; then echo -n "."; else echo "NG"; fi
echo ";"

echo "first weekday of month"
if [ `first_weekday_of_month 201402` -eq 20140203 ] ; then echo -n "."; else echo "NG"; fi
echo ";"

echo "first bizday of month"
if [ `first_bizday_of_month 201401` -eq 20140106 ] ; then echo -n "."; else echo "NG"; fi
if [ `first_bizday_of_month 201402` -eq 20140203 ] ; then echo -n "."; else echo "NG"; fi
echo ";"

echo "last day of month"
if [ `last_day_of_month 201401` -eq 20140131 ] ; then echo -n "."; else echo "NG"; fi
if [ `last_day_of_month 201402` -eq 20140228 ] ; then echo -n "."; else echo "NG"; fi
if [ `last_day_of_month 201202` -eq 20120229 ] ; then echo -n "."; else echo "NG"; fi
echo ";"

echo "last weekday of month"
if [ `last_weekday_of_month 201401` -eq 20140131 ] ; then echo -n "."; else echo "NG"; fi
if [ `last_weekday_of_month 201402` -eq 20140228 ] ; then echo -n "."; else echo "NG"; fi
if [ `last_weekday_of_month 201403` -eq 20140331 ] ; then echo -n "."; else echo "NG"; fi
if [ `last_weekday_of_month 201405` -eq 20140530 ] ; then echo -n "."; else echo "NG"; fi
echo ";"

echo "last bizday of month"
if [ `last_bizday_of_month 201405` -eq 20140530 ] ; then echo -n "."; else echo "NG"; fi
if [ `last_bizday_of_month 201412` -eq 20141230 ] ; then echo -n "."; else echo "NG"; fi
echo ";"


echo "first day of week"
if [ `first_day_of_week 20140203` -eq 20140203 ] ; then echo -n "."; else echo "NG"; fi
if [ `first_day_of_week 20140204` -eq 20140203 ] ; then echo -n "."; else echo "NG"; fi
if [ `first_day_of_week 20140205` -eq 20140203 ] ; then echo -n "."; else echo "NG"; fi
if [ `first_day_of_week 20140206` -eq 20140203 ] ; then echo -n "."; else echo "NG"; fi
if [ `first_day_of_week 20140207` -eq 20140203 ] ; then echo -n "."; else echo "NG"; fi
if [ `first_day_of_week 20140208` -eq 20140203 ] ; then echo -n "."; else echo "NG"; fi
if [ `first_day_of_week 20140209` -eq 20140203 ] ; then echo -n "."; else echo "NG"; fi
echo ";"

echo "last day of week"
if [ `last_day_of_week 20140203` -eq 20140207 ] ; then echo -n "."; else echo "NG"; fi
if [ `last_day_of_week 20140204` -eq 20140207 ] ; then echo -n "."; else echo "NG"; fi
if [ `last_day_of_week 20140205` -eq 20140207 ] ; then echo -n "."; else echo "NG"; fi
if [ `last_day_of_week 20140206` -eq 20140207 ] ; then echo -n "."; else echo "NG"; fi
if [ `last_day_of_week 20140207` -eq 20140207 ] ; then echo -n "."; else echo "NG"; fi
echo ";"

