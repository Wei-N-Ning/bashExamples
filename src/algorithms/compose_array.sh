gen_list() {
    local ids=(
477020
463925
462430
462368
462333
461899
461581
459742
459421
458989
455680
455676
455669
454747
450384
450263
450258
449538
449323
449317
437832
436836
431543
422080
421788
421774
420558
418316
418312
418297
418285
417729
416695
414546
414379
413438
413140
413139
413136
413134
413128
413127
412679
412672
412585
412383
412379
411517
411493
411470
408894
408671
408573
403118
403109
398910
387247
387119
383003
382987
381985
381098
380879
380213
380194
378844
378297
378296
376286
375988
375976
372082
371906
367539
363419
359922
358659
358655
358653
358269
357933
356471
348442
343000
342541
342535
342457
341976
330592
320999
320893
310116
309757
307407
299187
298216
297417
294130
278134
278130
277272
277244
276728
276716
276569
276565
276555
272290
271287
268262
267698
267696
263209
263181
262424
262421
262419
262256
260506
259437
259368
259273
259245
259182
259168
259160
258882
258880
258871
258868
257832
255849
254992
254011
253507
253266
252946
252924
252913
252904
252530
252516
252063
252012
251084
251039
250349
249238
249170
249116
247706
247687
247682
247425
247207
244658
243965
243960
243822
243613
241569
240581
240265
240254
240055
239100
237493
236453
229851
228086
227219
225455
225130
224589
224585
222574
221767
221758
221752
221748
221743
221452
221088
220319
220256
218929
217536
217028
216346
216075
207728
206105
204958
204942
203695
201806
201509
201402
200395
200175
200128
198928
195617
195489
195455
195448
195447
195443
195440
195438
195436
195435
195434
184054
184053
183702
183347
183176
180150
178991
172593
170396
170386
168504
164418
163596
163589
163411
163408
163330
163198
163059
162925
161908
160110
159535
158996
158222
158142
158139
157814
157810
157785
157758
156919
156883
156472
156357
156351
156327
155585
154069
154050
154009
153645
153639
153633
153632
153631
152511
152502
152500
152475
152433
152419
152346
152068
152048
151896
150708
150387
150238
148936
148918
148664
148638
147675
147054
147037
146082
145650
145182
145179
145114
145099
142538
142509
142503
142055
142054
142025
141683
141377
140716
140711
140702
138127
137360
137175
137173
135842
135133
135057
132607
132064
132050
130413
130408
130404
130403
129527
129524
128602
128600
127603
127168
126693
126452
125305
125277
124952
124079
124073
123994
123993
123554
123549
120696
119253
119252
118792
117309
116813
116812
116811
116076
116075
116001
115998
115902
115901
115897
115896
115894
115892
115891
115889
115887
114906
114684
114361
112487
112452
111983
111919
111141
110970
110694
110693
110673
110668
110662
110643
110614
109421
109403
109399
107436
104793
104789
104788
102028
97173
95847
95846
93948
93733
93613
93554
93526
93521
93479
93472
93469
93456
93449
93448
93443
93442
93441
93440
93439
93435
93433
93429
93427
93423
93422
93421
93420
93418
93417
93373 )
    for each_id in ${ids[@]}
    do
        echo "https://hackerone.com/reports/${each_id}" 
    done
}

gen_list >/tmp/ticket_list.txt