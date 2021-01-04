{\rtf1\ansi\ansicpg1252\cocoartf2512
\cocoatextscaling0\cocoaplatform0{\fonttbl\f0\fswiss\fcharset0
Arial-BoldMT;\f1\froman\fcharset0 TimesNewRomanPSMT;\f2\fswiss\fcharset0
ArialMT; \f3\froman\fcharset0
TimesNewRomanPS-BoldMT;\f4\fswiss\fcharset0
Arial-ItalicMT;\f5\fnil\fcharset134 PingFangSC-Regular; }
{\colortbl;\red255\green255\blue255;\red27\green31\blue34;\red255\green255\blue255;}
{\*\expandedcolortbl;;\cssrgb\c14118\c16078\c18039;\cssrgb\c100000\c100000\c100000;}
{\info
{\author Sampson, Eric}
{\*\company University of California, Berkeley}}\margl1440\margr1440\vieww21480\viewh14700\viewkind1\viewscale170
\deftab720
\pard\pardeftab720\ri0\sl276\slmult1\sa60\qc\partightenfactor0

\f0\b\fs22 \cf0 JASA ACS Reproducibility Initiative - Author
Contributions Checklist Form \f1\b0\fs52\
\pard\pardeftab720\ri0\sl276\slmult1\sb360\sa120\partightenfactor0

\f2\fs32 \cf0 Data \f1\
\pard\pardeftab720\ri0\sl276\slmult1\partightenfactor0

\f0\b\fs22 \cf0 Abstract \f1\b0\
\pard\pardeftab720\ri0\sl276\slmult1\partightenfactor0

\f2 \cf0 The data set is a subset of the data from the randomized
evaluation of the India's National Health Insurance Program (RSBY).\
\pard\pardeftab720\ri0\sl276\slmult1\partightenfactor0

\f1 \cf0\
\f0\b Availability \f3\
\pard\pardeftab720\ri0\sl276\slmult1\partightenfactor0

\f2\b0 \cf0 The data will be made publicly available along with the
necessary computer code upon publication. \f1\
\
\pard\pardeftab720\ri0\sl276\slmult1\partightenfactor0

\f0\b \cf0 Description \f1\b0\
\pard\pardeftab720\ri0\sl276\slmult1\partightenfactor0

\f2 \cf0 We provide the data file india.csv, which contains the
following variables: village id (village\_id), district id (DistrictId),
treatment status (treat), treatment assignment mechanism (mech),
enrollment (enrolled), hospital expenditure (EXPhosp\_1) \f1\
\
\pard\pardeftab720\ri0\sl276\slmult1\sb360\sa120\partightenfactor0

\f2\fs32 \cf0 Code \f1\
\pard\pardeftab720\ri0\sl276\slmult1\partightenfactor0

\f0\b\fs22 \cf0 Abstract \f1\b0\
\pard\pardeftab720\partightenfactor0

\f2 \cf2 \cb3 \expnd0\expndtw0\kerning0 All of the data processing and
analysis for this paper were done in R 3.6.2. \cf0 \cb1
\kerning1\expnd0\expndtw0 We provide the R code that is necessary for
the replication of our empirical results.\
\pard\pardeftab720\ri0\sl276\slmult1\partightenfactor0
\cf0 \
\pard\pardeftab720\ri0\sl276\slmult1\partightenfactor0

\f1 \cf0\
\f0\b Description \f3\
\f1\b0\
\pard\pardeftab720\ri0\sl276\slmult1\partightenfactor0

\f2 \cf0 We provide the R code, india\_analysis.R, that can be used to
reproduce our empirical results. \f1\
\f2\
\pard\pardeftab720\ri0\sl276\slmult1\partightenfactor0

\fs32 \cf0 Instructions for Use \f1\
\pard\pardeftab720\ri0\sl276\slmult1\partightenfactor0

\f0\b\fs22 \cf0 Reproducibility \f1\b0\
\pard\pardeftab720\ri0\sl276\slmult1\partightenfactor0

\f2 \cf0 The proposed methods require the following R software
packages:\
\
1. \f4\i experiment, \f2\i0 version \f4\i : 1.1-4 \f5\i0 , which relies
on packages \f4\i boot \f5\i0 (version 1.3.23) and \f4\i MASS \f5\i0
(version 7.3.51.4).\
\f2 2. \f4\i plyr \f2\i0 , version 1.8.5\
3. \f4\i AER \f2\i0 , version 1.2.9\
\
\pard\pardeftab720\ri0\sl276\slmult1\partightenfactor0

\f5 \cf0 All the packages are \f4\i  available at CRAN \f2\i0 .\
\
The file \`\`india\_analysis.R'92'92 generates all the numbers in Tables
2 \f5 , A1 and A2 \f1 . \f2 It takes as input: india.csv. The user time
is 16.053 on a laptop with 2.3 GHz Intel Core i5.\
\f1\
\
}
