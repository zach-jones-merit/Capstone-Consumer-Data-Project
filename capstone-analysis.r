{
 "cells": [
  {
   "cell_type": "raw",
   "id": "1317ef35",
   "metadata": {
    "_execution_state": "idle",
    "_uuid": "051d70d956493feee0c6d64651c6a088724dca2a",
    "execution": {
     "iopub.execute_input": "2022-09-24T12:22:43.442821Z",
     "iopub.status.busy": "2022-09-24T12:22:43.441097Z",
     "iopub.status.idle": "2022-09-24T12:22:43.462060Z"
    },
    "papermill": {
     "duration": 0.011859,
     "end_time": "2022-09-24T15:15:38.650125",
     "exception": false,
     "start_time": "2022-09-24T15:15:38.638266",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "# This R environment comes with many helpful analytics packages installed\n",
    "# It is defined by the kaggle/rstats Docker image: https://github.com/kaggle/docker-rstats\n",
    "# For example, here's a helpful package to load\n",
    "\n",
    "library(tidyverse) # metapackage of all tidyverse packages\n",
    "\n",
    "# Input data files are available in the read-only \"../input/\" directory\n",
    "# For example, running this (by clicking run or pressing Shift+Enter) will list all files under the input directory\n",
    "\n",
    "list.files(path = \"../input\")\n",
    "\n",
    "# You can write up to 20GB to the current directory (/kaggle/working/) that gets preserved as output when you create a version using \"Save & Run All\" \n",
    "# You can also write temporary files to /kaggle/temp/, but they won't be saved outside of the current session"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "5276327d",
   "metadata": {
    "papermill": {
     "duration": 0.011107,
     "end_time": "2022-09-24T15:15:38.672296",
     "exception": false,
     "start_time": "2022-09-24T15:15:38.661189",
     "status": "completed"
    },
    "tags": []
   },
   "source": []
  },
  {
   "cell_type": "markdown",
   "id": "55a927d7",
   "metadata": {
    "papermill": {
     "duration": 0.010162,
     "end_time": "2022-09-24T15:15:38.692722",
     "exception": false,
     "start_time": "2022-09-24T15:15:38.682560",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "<span style=\"font-size:32px; color:#4E9258\"> Selecting the Data Sets </span>"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "be29eba9",
   "metadata": {
    "papermill": {
     "duration": 0.010586,
     "end_time": "2022-09-24T15:15:38.713306",
     "exception": false,
     "start_time": "2022-09-24T15:15:38.702720",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "Out of the 18 data sets, the following three have the same parameters and corrilate enough to extract areas of opprotunity. "
   ]
  },
  {
   "cell_type": "markdown",
   "id": "62556bd2",
   "metadata": {
    "papermill": {
     "duration": 0.010319,
     "end_time": "2022-09-24T15:15:38.733795",
     "exception": false,
     "start_time": "2022-09-24T15:15:38.723476",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "| Table Name | Type | Description |\n",
    "| --- | --- | --- |\n",
    "| dailyActivity_merged | Microsoft Excel CSV | Daily Activity over 31 days of 33 users. Tracking daily: Steps, Distance, Intensities, Calories |\n",
    "| hourlySteps_merged | Microsoft Excel CSV | Hourly Steps over 31 days of 33 users |\n",
    "| sleepDay_merged | Microsoft Excel CSV| Daily sleep logs, tracked by: Total count of sleeps a day, Total minutes, Total Time in Bed |"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "3fd87b5a",
   "metadata": {
    "papermill": {
     "duration": 0.010133,
     "end_time": "2022-09-24T15:15:38.753956",
     "exception": false,
     "start_time": "2022-09-24T15:15:38.743823",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "<span style=\"font-size:28px; color:#4E9258\"> Loading R Packages </span> "
   ]
  },
  {
   "cell_type": "markdown",
   "id": "3542af19",
   "metadata": {
    "papermill": {
     "duration": 0.010556,
     "end_time": "2022-09-24T15:15:38.774403",
     "exception": false,
     "start_time": "2022-09-24T15:15:38.763847",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "These are packages were selected to make data cleaning and visulization easier to execute using R programing language."
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 1,
   "id": "c4d5999c",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-09-24T15:15:38.800312Z",
     "iopub.status.busy": "2022-09-24T15:15:38.797398Z",
     "iopub.status.idle": "2022-09-24T15:15:40.474842Z",
     "shell.execute_reply": "2022-09-24T15:15:40.472782Z"
    },
    "papermill": {
     "duration": 1.693157,
     "end_time": "2022-09-24T15:15:40.477431",
     "exception": false,
     "start_time": "2022-09-24T15:15:38.784274",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "name": "stderr",
     "output_type": "stream",
     "text": [
      "── \u001b[1mAttaching packages\u001b[22m ─────────────────────────────────────── tidyverse 1.3.1 ──\n",
      "\n",
      "\u001b[32m✔\u001b[39m \u001b[34mggplot2\u001b[39m 3.3.6     \u001b[32m✔\u001b[39m \u001b[34mpurrr  \u001b[39m 0.3.4\n",
      "\u001b[32m✔\u001b[39m \u001b[34mtibble \u001b[39m 3.1.7     \u001b[32m✔\u001b[39m \u001b[34mdplyr  \u001b[39m 1.0.9\n",
      "\u001b[32m✔\u001b[39m \u001b[34mtidyr  \u001b[39m 1.2.0     \u001b[32m✔\u001b[39m \u001b[34mstringr\u001b[39m 1.4.0\n",
      "\u001b[32m✔\u001b[39m \u001b[34mreadr  \u001b[39m 2.1.2     \u001b[32m✔\u001b[39m \u001b[34mforcats\u001b[39m 0.5.1\n",
      "\n",
      "── \u001b[1mConflicts\u001b[22m ────────────────────────────────────────── tidyverse_conflicts() ──\n",
      "\u001b[31m✖\u001b[39m \u001b[34mdplyr\u001b[39m::\u001b[32mfilter()\u001b[39m masks \u001b[34mstats\u001b[39m::filter()\n",
      "\u001b[31m✖\u001b[39m \u001b[34mdplyr\u001b[39m::\u001b[32mlag()\u001b[39m    masks \u001b[34mstats\u001b[39m::lag()\n",
      "\n",
      "here() starts at /kaggle/working\n",
      "\n",
      "\n",
      "Attaching package: ‘janitor’\n",
      "\n",
      "\n",
      "The following objects are masked from ‘package:stats’:\n",
      "\n",
      "    chisq.test, fisher.test\n",
      "\n",
      "\n",
      "\n",
      "Attaching package: ‘lubridate’\n",
      "\n",
      "\n",
      "The following objects are masked from ‘package:base’:\n",
      "\n",
      "    date, intersect, setdiff, union\n",
      "\n",
      "\n"
     ]
    }
   ],
   "source": [
    "library(tidyverse)\n",
    "library(here)\n",
    "library(skimr)\n",
    "library(janitor)\n",
    "library(lubridate)\n",
    "library(ggrepel)"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "58e49fc5",
   "metadata": {
    "papermill": {
     "duration": 0.011659,
     "end_time": "2022-09-24T15:15:40.500821",
     "exception": false,
     "start_time": "2022-09-24T15:15:40.489162",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "### <span style=\"color:#4E9258\"> Assigning Varables </span>"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "6168a25b",
   "metadata": {
    "papermill": {
     "duration": 0.011591,
     "end_time": "2022-09-24T15:15:40.524011",
     "exception": false,
     "start_time": "2022-09-24T15:15:40.512420",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "> Assigning the **read_csv** function to a varable for easier manipulations with the entire data set."
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 2,
   "id": "288f6263",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-09-24T15:15:40.581876Z",
     "iopub.status.busy": "2022-09-24T15:15:40.549731Z",
     "iopub.status.idle": "2022-09-24T15:15:41.115372Z",
     "shell.execute_reply": "2022-09-24T15:15:41.112577Z"
    },
    "papermill": {
     "duration": 0.58288,
     "end_time": "2022-09-24T15:15:41.119079",
     "exception": false,
     "start_time": "2022-09-24T15:15:40.536199",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "name": "stderr",
     "output_type": "stream",
     "text": [
      "\u001b[1mRows: \u001b[22m\u001b[34m940\u001b[39m \u001b[1mColumns: \u001b[22m\u001b[34m15\u001b[39m\n",
      "\u001b[36m──\u001b[39m \u001b[1mColumn specification\u001b[22m \u001b[36m────────────────────────────────────────────────────────\u001b[39m\n",
      "\u001b[1mDelimiter:\u001b[22m \",\"\n",
      "\u001b[31mchr\u001b[39m  (1): ActivityDate\n",
      "\u001b[32mdbl\u001b[39m (14): Id, TotalSteps, TotalDistance, TrackerDistance, LoggedActivitiesDi...\n",
      "\n",
      "\u001b[36mℹ\u001b[39m Use `spec()` to retrieve the full column specification for this data.\n",
      "\u001b[36mℹ\u001b[39m Specify the column types or set `show_col_types = FALSE` to quiet this message.\n",
      "\u001b[1mRows: \u001b[22m\u001b[34m413\u001b[39m \u001b[1mColumns: \u001b[22m\u001b[34m5\u001b[39m\n",
      "\u001b[36m──\u001b[39m \u001b[1mColumn specification\u001b[22m \u001b[36m────────────────────────────────────────────────────────\u001b[39m\n",
      "\u001b[1mDelimiter:\u001b[22m \",\"\n",
      "\u001b[31mchr\u001b[39m (1): SleepDay\n",
      "\u001b[32mdbl\u001b[39m (4): Id, TotalSleepRecords, TotalMinutesAsleep, TotalTimeInBed\n",
      "\n",
      "\u001b[36mℹ\u001b[39m Use `spec()` to retrieve the full column specification for this data.\n",
      "\u001b[36mℹ\u001b[39m Specify the column types or set `show_col_types = FALSE` to quiet this message.\n",
      "\u001b[1mRows: \u001b[22m\u001b[34m22099\u001b[39m \u001b[1mColumns: \u001b[22m\u001b[34m3\u001b[39m\n",
      "\u001b[36m──\u001b[39m \u001b[1mColumn specification\u001b[22m \u001b[36m────────────────────────────────────────────────────────\u001b[39m\n",
      "\u001b[1mDelimiter:\u001b[22m \",\"\n",
      "\u001b[31mchr\u001b[39m (1): ActivityHour\n",
      "\u001b[32mdbl\u001b[39m (2): Id, StepTotal\n",
      "\n",
      "\u001b[36mℹ\u001b[39m Use `spec()` to retrieve the full column specification for this data.\n",
      "\u001b[36mℹ\u001b[39m Specify the column types or set `show_col_types = FALSE` to quiet this message.\n"
     ]
    }
   ],
   "source": [
    "daily_activities <- read_csv(file= \"../input/fitbit/Fitabase Data 4.12.16-5.12.16/dailyActivity_merged.csv\")\n",
    "sleeps_daily <- read_csv(file= \"../input/fitbit/Fitabase Data 4.12.16-5.12.16/sleepDay_merged.csv\")\n",
    "steps_hourly <- read_csv(\"../input/fitbit/Fitabase Data 4.12.16-5.12.16/hourlySteps_merged.csv\")"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "a48c280c",
   "metadata": {
    "papermill": {
     "duration": 0.011895,
     "end_time": "2022-09-24T15:15:41.143374",
     "exception": false,
     "start_time": "2022-09-24T15:15:41.131479",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "<span style=\"font-size:20px; color:#4E9258\"> Taking a Quick Look Into the Datasets </span> "
   ]
  },
  {
   "cell_type": "markdown",
   "id": "3c9fd906",
   "metadata": {
    "papermill": {
     "duration": 0.011688,
     "end_time": "2022-09-24T15:15:41.166847",
     "exception": false,
     "start_time": "2022-09-24T15:15:41.155159",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "> Using **head** to display the first few rows of the datasets being worked with"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 3,
   "id": "500923f3",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-09-24T15:15:41.194023Z",
     "iopub.status.busy": "2022-09-24T15:15:41.192420Z",
     "iopub.status.idle": "2022-09-24T15:15:41.254312Z",
     "shell.execute_reply": "2022-09-24T15:15:41.252429Z"
    },
    "papermill": {
     "duration": 0.07802,
     "end_time": "2022-09-24T15:15:41.256746",
     "exception": false,
     "start_time": "2022-09-24T15:15:41.178726",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A tibble: 6 × 15</caption>\n",
       "<thead>\n",
       "\t<tr><th scope=col>Id</th><th scope=col>ActivityDate</th><th scope=col>TotalSteps</th><th scope=col>TotalDistance</th><th scope=col>TrackerDistance</th><th scope=col>LoggedActivitiesDistance</th><th scope=col>VeryActiveDistance</th><th scope=col>ModeratelyActiveDistance</th><th scope=col>LightActiveDistance</th><th scope=col>SedentaryActiveDistance</th><th scope=col>VeryActiveMinutes</th><th scope=col>FairlyActiveMinutes</th><th scope=col>LightlyActiveMinutes</th><th scope=col>SedentaryMinutes</th><th scope=col>Calories</th></tr>\n",
       "\t<tr><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><td>1503960366</td><td>4/12/2016</td><td>13162</td><td>8.50</td><td>8.50</td><td>0</td><td>1.88</td><td>0.55</td><td>6.06</td><td>0</td><td>25</td><td>13</td><td>328</td><td> 728</td><td>1985</td></tr>\n",
       "\t<tr><td>1503960366</td><td>4/13/2016</td><td>10735</td><td>6.97</td><td>6.97</td><td>0</td><td>1.57</td><td>0.69</td><td>4.71</td><td>0</td><td>21</td><td>19</td><td>217</td><td> 776</td><td>1797</td></tr>\n",
       "\t<tr><td>1503960366</td><td>4/14/2016</td><td>10460</td><td>6.74</td><td>6.74</td><td>0</td><td>2.44</td><td>0.40</td><td>3.91</td><td>0</td><td>30</td><td>11</td><td>181</td><td>1218</td><td>1776</td></tr>\n",
       "\t<tr><td>1503960366</td><td>4/15/2016</td><td> 9762</td><td>6.28</td><td>6.28</td><td>0</td><td>2.14</td><td>1.26</td><td>2.83</td><td>0</td><td>29</td><td>34</td><td>209</td><td> 726</td><td>1745</td></tr>\n",
       "\t<tr><td>1503960366</td><td>4/16/2016</td><td>12669</td><td>8.16</td><td>8.16</td><td>0</td><td>2.71</td><td>0.41</td><td>5.04</td><td>0</td><td>36</td><td>10</td><td>221</td><td> 773</td><td>1863</td></tr>\n",
       "\t<tr><td>1503960366</td><td>4/17/2016</td><td> 9705</td><td>6.48</td><td>6.48</td><td>0</td><td>3.19</td><td>0.78</td><td>2.51</td><td>0</td><td>38</td><td>20</td><td>164</td><td> 539</td><td>1728</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A tibble: 6 × 15\n",
       "\\begin{tabular}{lllllllllllllll}\n",
       " Id & ActivityDate & TotalSteps & TotalDistance & TrackerDistance & LoggedActivitiesDistance & VeryActiveDistance & ModeratelyActiveDistance & LightActiveDistance & SedentaryActiveDistance & VeryActiveMinutes & FairlyActiveMinutes & LightlyActiveMinutes & SedentaryMinutes & Calories\\\\\n",
       " <dbl> & <chr> & <dbl> & <dbl> & <dbl> & <dbl> & <dbl> & <dbl> & <dbl> & <dbl> & <dbl> & <dbl> & <dbl> & <dbl> & <dbl>\\\\\n",
       "\\hline\n",
       "\t 1503960366 & 4/12/2016 & 13162 & 8.50 & 8.50 & 0 & 1.88 & 0.55 & 6.06 & 0 & 25 & 13 & 328 &  728 & 1985\\\\\n",
       "\t 1503960366 & 4/13/2016 & 10735 & 6.97 & 6.97 & 0 & 1.57 & 0.69 & 4.71 & 0 & 21 & 19 & 217 &  776 & 1797\\\\\n",
       "\t 1503960366 & 4/14/2016 & 10460 & 6.74 & 6.74 & 0 & 2.44 & 0.40 & 3.91 & 0 & 30 & 11 & 181 & 1218 & 1776\\\\\n",
       "\t 1503960366 & 4/15/2016 &  9762 & 6.28 & 6.28 & 0 & 2.14 & 1.26 & 2.83 & 0 & 29 & 34 & 209 &  726 & 1745\\\\\n",
       "\t 1503960366 & 4/16/2016 & 12669 & 8.16 & 8.16 & 0 & 2.71 & 0.41 & 5.04 & 0 & 36 & 10 & 221 &  773 & 1863\\\\\n",
       "\t 1503960366 & 4/17/2016 &  9705 & 6.48 & 6.48 & 0 & 3.19 & 0.78 & 2.51 & 0 & 38 & 20 & 164 &  539 & 1728\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A tibble: 6 × 15\n",
       "\n",
       "| Id &lt;dbl&gt; | ActivityDate &lt;chr&gt; | TotalSteps &lt;dbl&gt; | TotalDistance &lt;dbl&gt; | TrackerDistance &lt;dbl&gt; | LoggedActivitiesDistance &lt;dbl&gt; | VeryActiveDistance &lt;dbl&gt; | ModeratelyActiveDistance &lt;dbl&gt; | LightActiveDistance &lt;dbl&gt; | SedentaryActiveDistance &lt;dbl&gt; | VeryActiveMinutes &lt;dbl&gt; | FairlyActiveMinutes &lt;dbl&gt; | LightlyActiveMinutes &lt;dbl&gt; | SedentaryMinutes &lt;dbl&gt; | Calories &lt;dbl&gt; |\n",
       "|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|\n",
       "| 1503960366 | 4/12/2016 | 13162 | 8.50 | 8.50 | 0 | 1.88 | 0.55 | 6.06 | 0 | 25 | 13 | 328 |  728 | 1985 |\n",
       "| 1503960366 | 4/13/2016 | 10735 | 6.97 | 6.97 | 0 | 1.57 | 0.69 | 4.71 | 0 | 21 | 19 | 217 |  776 | 1797 |\n",
       "| 1503960366 | 4/14/2016 | 10460 | 6.74 | 6.74 | 0 | 2.44 | 0.40 | 3.91 | 0 | 30 | 11 | 181 | 1218 | 1776 |\n",
       "| 1503960366 | 4/15/2016 |  9762 | 6.28 | 6.28 | 0 | 2.14 | 1.26 | 2.83 | 0 | 29 | 34 | 209 |  726 | 1745 |\n",
       "| 1503960366 | 4/16/2016 | 12669 | 8.16 | 8.16 | 0 | 2.71 | 0.41 | 5.04 | 0 | 36 | 10 | 221 |  773 | 1863 |\n",
       "| 1503960366 | 4/17/2016 |  9705 | 6.48 | 6.48 | 0 | 3.19 | 0.78 | 2.51 | 0 | 38 | 20 | 164 |  539 | 1728 |\n",
       "\n"
      ],
      "text/plain": [
       "  Id         ActivityDate TotalSteps TotalDistance TrackerDistance\n",
       "1 1503960366 4/12/2016    13162      8.50          8.50           \n",
       "2 1503960366 4/13/2016    10735      6.97          6.97           \n",
       "3 1503960366 4/14/2016    10460      6.74          6.74           \n",
       "4 1503960366 4/15/2016     9762      6.28          6.28           \n",
       "5 1503960366 4/16/2016    12669      8.16          8.16           \n",
       "6 1503960366 4/17/2016     9705      6.48          6.48           \n",
       "  LoggedActivitiesDistance VeryActiveDistance ModeratelyActiveDistance\n",
       "1 0                        1.88               0.55                    \n",
       "2 0                        1.57               0.69                    \n",
       "3 0                        2.44               0.40                    \n",
       "4 0                        2.14               1.26                    \n",
       "5 0                        2.71               0.41                    \n",
       "6 0                        3.19               0.78                    \n",
       "  LightActiveDistance SedentaryActiveDistance VeryActiveMinutes\n",
       "1 6.06                0                       25               \n",
       "2 4.71                0                       21               \n",
       "3 3.91                0                       30               \n",
       "4 2.83                0                       29               \n",
       "5 5.04                0                       36               \n",
       "6 2.51                0                       38               \n",
       "  FairlyActiveMinutes LightlyActiveMinutes SedentaryMinutes Calories\n",
       "1 13                  328                   728             1985    \n",
       "2 19                  217                   776             1797    \n",
       "3 11                  181                  1218             1776    \n",
       "4 34                  209                   726             1745    \n",
       "5 10                  221                   773             1863    \n",
       "6 20                  164                   539             1728    "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    },
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A tibble: 6 × 5</caption>\n",
       "<thead>\n",
       "\t<tr><th scope=col>Id</th><th scope=col>SleepDay</th><th scope=col>TotalSleepRecords</th><th scope=col>TotalMinutesAsleep</th><th scope=col>TotalTimeInBed</th></tr>\n",
       "\t<tr><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><td>1503960366</td><td>4/12/2016 12:00:00 AM</td><td>1</td><td>327</td><td>346</td></tr>\n",
       "\t<tr><td>1503960366</td><td>4/13/2016 12:00:00 AM</td><td>2</td><td>384</td><td>407</td></tr>\n",
       "\t<tr><td>1503960366</td><td>4/15/2016 12:00:00 AM</td><td>1</td><td>412</td><td>442</td></tr>\n",
       "\t<tr><td>1503960366</td><td>4/16/2016 12:00:00 AM</td><td>2</td><td>340</td><td>367</td></tr>\n",
       "\t<tr><td>1503960366</td><td>4/17/2016 12:00:00 AM</td><td>1</td><td>700</td><td>712</td></tr>\n",
       "\t<tr><td>1503960366</td><td>4/19/2016 12:00:00 AM</td><td>1</td><td>304</td><td>320</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A tibble: 6 × 5\n",
       "\\begin{tabular}{lllll}\n",
       " Id & SleepDay & TotalSleepRecords & TotalMinutesAsleep & TotalTimeInBed\\\\\n",
       " <dbl> & <chr> & <dbl> & <dbl> & <dbl>\\\\\n",
       "\\hline\n",
       "\t 1503960366 & 4/12/2016 12:00:00 AM & 1 & 327 & 346\\\\\n",
       "\t 1503960366 & 4/13/2016 12:00:00 AM & 2 & 384 & 407\\\\\n",
       "\t 1503960366 & 4/15/2016 12:00:00 AM & 1 & 412 & 442\\\\\n",
       "\t 1503960366 & 4/16/2016 12:00:00 AM & 2 & 340 & 367\\\\\n",
       "\t 1503960366 & 4/17/2016 12:00:00 AM & 1 & 700 & 712\\\\\n",
       "\t 1503960366 & 4/19/2016 12:00:00 AM & 1 & 304 & 320\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A tibble: 6 × 5\n",
       "\n",
       "| Id &lt;dbl&gt; | SleepDay &lt;chr&gt; | TotalSleepRecords &lt;dbl&gt; | TotalMinutesAsleep &lt;dbl&gt; | TotalTimeInBed &lt;dbl&gt; |\n",
       "|---|---|---|---|---|\n",
       "| 1503960366 | 4/12/2016 12:00:00 AM | 1 | 327 | 346 |\n",
       "| 1503960366 | 4/13/2016 12:00:00 AM | 2 | 384 | 407 |\n",
       "| 1503960366 | 4/15/2016 12:00:00 AM | 1 | 412 | 442 |\n",
       "| 1503960366 | 4/16/2016 12:00:00 AM | 2 | 340 | 367 |\n",
       "| 1503960366 | 4/17/2016 12:00:00 AM | 1 | 700 | 712 |\n",
       "| 1503960366 | 4/19/2016 12:00:00 AM | 1 | 304 | 320 |\n",
       "\n"
      ],
      "text/plain": [
       "  Id         SleepDay              TotalSleepRecords TotalMinutesAsleep\n",
       "1 1503960366 4/12/2016 12:00:00 AM 1                 327               \n",
       "2 1503960366 4/13/2016 12:00:00 AM 2                 384               \n",
       "3 1503960366 4/15/2016 12:00:00 AM 1                 412               \n",
       "4 1503960366 4/16/2016 12:00:00 AM 2                 340               \n",
       "5 1503960366 4/17/2016 12:00:00 AM 1                 700               \n",
       "6 1503960366 4/19/2016 12:00:00 AM 1                 304               \n",
       "  TotalTimeInBed\n",
       "1 346           \n",
       "2 407           \n",
       "3 442           \n",
       "4 367           \n",
       "5 712           \n",
       "6 320           "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    },
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A tibble: 6 × 3</caption>\n",
       "<thead>\n",
       "\t<tr><th scope=col>Id</th><th scope=col>ActivityHour</th><th scope=col>StepTotal</th></tr>\n",
       "\t<tr><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;dbl&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><td>1503960366</td><td>4/12/2016 12:00:00 AM</td><td>373</td></tr>\n",
       "\t<tr><td>1503960366</td><td>4/12/2016 1:00:00 AM </td><td>160</td></tr>\n",
       "\t<tr><td>1503960366</td><td>4/12/2016 2:00:00 AM </td><td>151</td></tr>\n",
       "\t<tr><td>1503960366</td><td>4/12/2016 3:00:00 AM </td><td>  0</td></tr>\n",
       "\t<tr><td>1503960366</td><td>4/12/2016 4:00:00 AM </td><td>  0</td></tr>\n",
       "\t<tr><td>1503960366</td><td>4/12/2016 5:00:00 AM </td><td>  0</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A tibble: 6 × 3\n",
       "\\begin{tabular}{lll}\n",
       " Id & ActivityHour & StepTotal\\\\\n",
       " <dbl> & <chr> & <dbl>\\\\\n",
       "\\hline\n",
       "\t 1503960366 & 4/12/2016 12:00:00 AM & 373\\\\\n",
       "\t 1503960366 & 4/12/2016 1:00:00 AM  & 160\\\\\n",
       "\t 1503960366 & 4/12/2016 2:00:00 AM  & 151\\\\\n",
       "\t 1503960366 & 4/12/2016 3:00:00 AM  &   0\\\\\n",
       "\t 1503960366 & 4/12/2016 4:00:00 AM  &   0\\\\\n",
       "\t 1503960366 & 4/12/2016 5:00:00 AM  &   0\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A tibble: 6 × 3\n",
       "\n",
       "| Id &lt;dbl&gt; | ActivityHour &lt;chr&gt; | StepTotal &lt;dbl&gt; |\n",
       "|---|---|---|\n",
       "| 1503960366 | 4/12/2016 12:00:00 AM | 373 |\n",
       "| 1503960366 | 4/12/2016 1:00:00 AM  | 160 |\n",
       "| 1503960366 | 4/12/2016 2:00:00 AM  | 151 |\n",
       "| 1503960366 | 4/12/2016 3:00:00 AM  |   0 |\n",
       "| 1503960366 | 4/12/2016 4:00:00 AM  |   0 |\n",
       "| 1503960366 | 4/12/2016 5:00:00 AM  |   0 |\n",
       "\n"
      ],
      "text/plain": [
       "  Id         ActivityHour          StepTotal\n",
       "1 1503960366 4/12/2016 12:00:00 AM 373      \n",
       "2 1503960366 4/12/2016 1:00:00 AM  160      \n",
       "3 1503960366 4/12/2016 2:00:00 AM  151      \n",
       "4 1503960366 4/12/2016 3:00:00 AM    0      \n",
       "5 1503960366 4/12/2016 4:00:00 AM    0      \n",
       "6 1503960366 4/12/2016 5:00:00 AM    0      "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "head(daily_activities)\n",
    "head(sleeps_daily)\n",
    "head(steps_hourly)"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "9a6f3ef7",
   "metadata": {
    "papermill": {
     "duration": 0.021139,
     "end_time": "2022-09-24T15:15:41.290757",
     "exception": false,
     "start_time": "2022-09-24T15:15:41.269618",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "***"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "3387cf93",
   "metadata": {
    "papermill": {
     "duration": 0.012434,
     "end_time": "2022-09-24T15:15:41.315541",
     "exception": false,
     "start_time": "2022-09-24T15:15:41.303107",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "# Cleaning the Data"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "bc49c5b3",
   "metadata": {
    "papermill": {
     "duration": 0.012507,
     "end_time": "2022-09-24T15:15:41.340705",
     "exception": false,
     "start_time": "2022-09-24T15:15:41.328198",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "<span style=\"font-size:18px; color:#4E9258\"> Uasablity and Manipulation </span> "
   ]
  },
  {
   "cell_type": "markdown",
   "id": "f8726170",
   "metadata": {
    "papermill": {
     "duration": 0.012218,
     "end_time": "2022-09-24T15:15:41.365165",
     "exception": false,
     "start_time": "2022-09-24T15:15:41.352947",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "> Storing the lowercase verison of the column names (using the **clean_names** function) to make them easier to work with"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 4,
   "id": "9e8053ba",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-09-24T15:15:41.393778Z",
     "iopub.status.busy": "2022-09-24T15:15:41.392013Z",
     "iopub.status.idle": "2022-09-24T15:15:41.809648Z",
     "shell.execute_reply": "2022-09-24T15:15:41.807618Z"
    },
    "papermill": {
     "duration": 0.434945,
     "end_time": "2022-09-24T15:15:41.812484",
     "exception": false,
     "start_time": "2022-09-24T15:15:41.377539",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A spec_tbl_df: 940 × 15</caption>\n",
       "<thead>\n",
       "\t<tr><th scope=col>id</th><th scope=col>activity_date</th><th scope=col>total_steps</th><th scope=col>total_distance</th><th scope=col>tracker_distance</th><th scope=col>logged_activities_distance</th><th scope=col>very_active_distance</th><th scope=col>moderately_active_distance</th><th scope=col>light_active_distance</th><th scope=col>sedentary_active_distance</th><th scope=col>very_active_minutes</th><th scope=col>fairly_active_minutes</th><th scope=col>lightly_active_minutes</th><th scope=col>sedentary_minutes</th><th scope=col>calories</th></tr>\n",
       "\t<tr><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><td>1503960366</td><td>4/12/2016</td><td>13162</td><td> 8.50</td><td> 8.50</td><td>0</td><td>1.88</td><td>0.55</td><td>6.06</td><td>0</td><td>25</td><td>13</td><td>328</td><td> 728</td><td>1985</td></tr>\n",
       "\t<tr><td>1503960366</td><td>4/13/2016</td><td>10735</td><td> 6.97</td><td> 6.97</td><td>0</td><td>1.57</td><td>0.69</td><td>4.71</td><td>0</td><td>21</td><td>19</td><td>217</td><td> 776</td><td>1797</td></tr>\n",
       "\t<tr><td>1503960366</td><td>4/14/2016</td><td>10460</td><td> 6.74</td><td> 6.74</td><td>0</td><td>2.44</td><td>0.40</td><td>3.91</td><td>0</td><td>30</td><td>11</td><td>181</td><td>1218</td><td>1776</td></tr>\n",
       "\t<tr><td>1503960366</td><td>4/15/2016</td><td> 9762</td><td> 6.28</td><td> 6.28</td><td>0</td><td>2.14</td><td>1.26</td><td>2.83</td><td>0</td><td>29</td><td>34</td><td>209</td><td> 726</td><td>1745</td></tr>\n",
       "\t<tr><td>1503960366</td><td>4/16/2016</td><td>12669</td><td> 8.16</td><td> 8.16</td><td>0</td><td>2.71</td><td>0.41</td><td>5.04</td><td>0</td><td>36</td><td>10</td><td>221</td><td> 773</td><td>1863</td></tr>\n",
       "\t<tr><td>1503960366</td><td>4/17/2016</td><td> 9705</td><td> 6.48</td><td> 6.48</td><td>0</td><td>3.19</td><td>0.78</td><td>2.51</td><td>0</td><td>38</td><td>20</td><td>164</td><td> 539</td><td>1728</td></tr>\n",
       "\t<tr><td>1503960366</td><td>4/18/2016</td><td>13019</td><td> 8.59</td><td> 8.59</td><td>0</td><td>3.25</td><td>0.64</td><td>4.71</td><td>0</td><td>42</td><td>16</td><td>233</td><td>1149</td><td>1921</td></tr>\n",
       "\t<tr><td>1503960366</td><td>4/19/2016</td><td>15506</td><td> 9.88</td><td> 9.88</td><td>0</td><td>3.53</td><td>1.32</td><td>5.03</td><td>0</td><td>50</td><td>31</td><td>264</td><td> 775</td><td>2035</td></tr>\n",
       "\t<tr><td>1503960366</td><td>4/20/2016</td><td>10544</td><td> 6.68</td><td> 6.68</td><td>0</td><td>1.96</td><td>0.48</td><td>4.24</td><td>0</td><td>28</td><td>12</td><td>205</td><td> 818</td><td>1786</td></tr>\n",
       "\t<tr><td>1503960366</td><td>4/21/2016</td><td> 9819</td><td> 6.34</td><td> 6.34</td><td>0</td><td>1.34</td><td>0.35</td><td>4.65</td><td>0</td><td>19</td><td> 8</td><td>211</td><td> 838</td><td>1775</td></tr>\n",
       "\t<tr><td>1503960366</td><td>4/22/2016</td><td>12764</td><td> 8.13</td><td> 8.13</td><td>0</td><td>4.76</td><td>1.12</td><td>2.24</td><td>0</td><td>66</td><td>27</td><td>130</td><td>1217</td><td>1827</td></tr>\n",
       "\t<tr><td>1503960366</td><td>4/23/2016</td><td>14371</td><td> 9.04</td><td> 9.04</td><td>0</td><td>2.81</td><td>0.87</td><td>5.36</td><td>0</td><td>41</td><td>21</td><td>262</td><td> 732</td><td>1949</td></tr>\n",
       "\t<tr><td>1503960366</td><td>4/24/2016</td><td>10039</td><td> 6.41</td><td> 6.41</td><td>0</td><td>2.92</td><td>0.21</td><td>3.28</td><td>0</td><td>39</td><td> 5</td><td>238</td><td> 709</td><td>1788</td></tr>\n",
       "\t<tr><td>1503960366</td><td>4/25/2016</td><td>15355</td><td> 9.80</td><td> 9.80</td><td>0</td><td>5.29</td><td>0.57</td><td>3.94</td><td>0</td><td>73</td><td>14</td><td>216</td><td> 814</td><td>2013</td></tr>\n",
       "\t<tr><td>1503960366</td><td>4/26/2016</td><td>13755</td><td> 8.79</td><td> 8.79</td><td>0</td><td>2.33</td><td>0.92</td><td>5.54</td><td>0</td><td>31</td><td>23</td><td>279</td><td> 833</td><td>1970</td></tr>\n",
       "\t<tr><td>1503960366</td><td>4/27/2016</td><td>18134</td><td>12.21</td><td>12.21</td><td>0</td><td>6.40</td><td>0.41</td><td>5.41</td><td>0</td><td>78</td><td>11</td><td>243</td><td>1108</td><td>2159</td></tr>\n",
       "\t<tr><td>1503960366</td><td>4/28/2016</td><td>13154</td><td> 8.53</td><td> 8.53</td><td>0</td><td>3.54</td><td>1.16</td><td>3.79</td><td>0</td><td>48</td><td>28</td><td>189</td><td> 782</td><td>1898</td></tr>\n",
       "\t<tr><td>1503960366</td><td>4/29/2016</td><td>11181</td><td> 7.15</td><td> 7.15</td><td>0</td><td>1.06</td><td>0.50</td><td>5.58</td><td>0</td><td>16</td><td>12</td><td>243</td><td> 815</td><td>1837</td></tr>\n",
       "\t<tr><td>1503960366</td><td>4/30/2016</td><td>14673</td><td> 9.25</td><td> 9.25</td><td>0</td><td>3.56</td><td>1.42</td><td>4.27</td><td>0</td><td>52</td><td>34</td><td>217</td><td> 712</td><td>1947</td></tr>\n",
       "\t<tr><td>1503960366</td><td>5/1/2016 </td><td>10602</td><td> 6.81</td><td> 6.81</td><td>0</td><td>2.29</td><td>1.60</td><td>2.92</td><td>0</td><td>33</td><td>35</td><td>246</td><td> 730</td><td>1820</td></tr>\n",
       "\t<tr><td>1503960366</td><td>5/2/2016 </td><td>14727</td><td> 9.71</td><td> 9.71</td><td>0</td><td>3.21</td><td>0.57</td><td>5.92</td><td>0</td><td>41</td><td>15</td><td>277</td><td> 798</td><td>2004</td></tr>\n",
       "\t<tr><td>1503960366</td><td>5/3/2016 </td><td>15103</td><td> 9.66</td><td> 9.66</td><td>0</td><td>3.73</td><td>1.05</td><td>4.88</td><td>0</td><td>50</td><td>24</td><td>254</td><td> 816</td><td>1990</td></tr>\n",
       "\t<tr><td>1503960366</td><td>5/4/2016 </td><td>11100</td><td> 7.15</td><td> 7.15</td><td>0</td><td>2.46</td><td>0.87</td><td>3.82</td><td>0</td><td>36</td><td>22</td><td>203</td><td>1179</td><td>1819</td></tr>\n",
       "\t<tr><td>1503960366</td><td>5/5/2016 </td><td>14070</td><td> 8.90</td><td> 8.90</td><td>0</td><td>2.92</td><td>1.08</td><td>4.88</td><td>0</td><td>45</td><td>24</td><td>250</td><td> 857</td><td>1959</td></tr>\n",
       "\t<tr><td>1503960366</td><td>5/6/2016 </td><td>12159</td><td> 8.03</td><td> 8.03</td><td>0</td><td>1.97</td><td>0.25</td><td>5.81</td><td>0</td><td>24</td><td> 6</td><td>289</td><td> 754</td><td>1896</td></tr>\n",
       "\t<tr><td>1503960366</td><td>5/7/2016 </td><td>11992</td><td> 7.71</td><td> 7.71</td><td>0</td><td>2.46</td><td>2.12</td><td>3.13</td><td>0</td><td>37</td><td>46</td><td>175</td><td> 833</td><td>1821</td></tr>\n",
       "\t<tr><td>1503960366</td><td>5/8/2016 </td><td>10060</td><td> 6.58</td><td> 6.58</td><td>0</td><td>3.53</td><td>0.32</td><td>2.73</td><td>0</td><td>44</td><td> 8</td><td>203</td><td> 574</td><td>1740</td></tr>\n",
       "\t<tr><td>1503960366</td><td>5/9/2016 </td><td>12022</td><td> 7.72</td><td> 7.72</td><td>0</td><td>3.45</td><td>0.53</td><td>3.74</td><td>0</td><td>46</td><td>11</td><td>206</td><td> 835</td><td>1819</td></tr>\n",
       "\t<tr><td>1503960366</td><td>5/10/2016</td><td>12207</td><td> 7.77</td><td> 7.77</td><td>0</td><td>3.35</td><td>1.16</td><td>3.26</td><td>0</td><td>46</td><td>31</td><td>214</td><td> 746</td><td>1859</td></tr>\n",
       "\t<tr><td>1503960366</td><td>5/11/2016</td><td>12770</td><td> 8.13</td><td> 8.13</td><td>0</td><td>2.56</td><td>1.01</td><td>4.55</td><td>0</td><td>36</td><td>23</td><td>251</td><td> 669</td><td>1783</td></tr>\n",
       "\t<tr><td>⋮</td><td>⋮</td><td>⋮</td><td>⋮</td><td>⋮</td><td>⋮</td><td>⋮</td><td>⋮</td><td>⋮</td><td>⋮</td><td>⋮</td><td>⋮</td><td>⋮</td><td>⋮</td><td>⋮</td></tr>\n",
       "\t<tr><td>8877689391</td><td>4/13/2016</td><td>15337</td><td> 9.58</td><td> 9.58</td><td>0</td><td> 3.55</td><td>0.38</td><td> 5.64</td><td>0.00</td><td>108</td><td>18</td><td>216</td><td>1098</td><td>3566</td></tr>\n",
       "\t<tr><td>8877689391</td><td>4/14/2016</td><td>21129</td><td>18.98</td><td>18.98</td><td>0</td><td>10.55</td><td>0.59</td><td> 7.75</td><td>0.02</td><td> 68</td><td>13</td><td>298</td><td>1061</td><td>3793</td></tr>\n",
       "\t<tr><td>8877689391</td><td>4/15/2016</td><td>13422</td><td> 7.17</td><td> 7.17</td><td>0</td><td> 0.05</td><td>0.05</td><td> 7.01</td><td>0.01</td><td>106</td><td> 1</td><td>281</td><td>1052</td><td>3934</td></tr>\n",
       "\t<tr><td>8877689391</td><td>4/16/2016</td><td>29326</td><td>25.29</td><td>25.29</td><td>0</td><td>13.24</td><td>1.21</td><td>10.71</td><td>0.00</td><td> 94</td><td>29</td><td>429</td><td> 888</td><td>4547</td></tr>\n",
       "\t<tr><td>8877689391</td><td>4/17/2016</td><td>15118</td><td> 8.87</td><td> 8.87</td><td>0</td><td> 0.00</td><td>0.07</td><td> 8.79</td><td>0.00</td><td> 58</td><td>15</td><td>307</td><td>1060</td><td>3545</td></tr>\n",
       "\t<tr><td>8877689391</td><td>4/18/2016</td><td>11423</td><td> 8.67</td><td> 8.67</td><td>0</td><td> 2.44</td><td>0.27</td><td> 5.94</td><td>0.00</td><td> 29</td><td> 5</td><td>191</td><td>1215</td><td>2761</td></tr>\n",
       "\t<tr><td>8877689391</td><td>4/19/2016</td><td>18785</td><td>17.40</td><td>17.40</td><td>0</td><td>12.15</td><td>0.18</td><td> 5.03</td><td>0.00</td><td> 82</td><td>13</td><td>214</td><td>1131</td><td>3676</td></tr>\n",
       "\t<tr><td>8877689391</td><td>4/20/2016</td><td>19948</td><td>18.11</td><td>18.11</td><td>0</td><td>11.02</td><td>0.69</td><td> 6.34</td><td>0.00</td><td> 73</td><td>19</td><td>225</td><td>1123</td><td>3679</td></tr>\n",
       "\t<tr><td>8877689391</td><td>4/21/2016</td><td>19377</td><td>17.62</td><td>17.62</td><td>0</td><td>12.29</td><td>0.42</td><td> 4.89</td><td>0.00</td><td> 82</td><td>13</td><td>226</td><td>1119</td><td>3659</td></tr>\n",
       "\t<tr><td>8877689391</td><td>4/22/2016</td><td>18258</td><td>16.31</td><td>16.31</td><td>0</td><td>10.23</td><td>0.03</td><td> 5.97</td><td>0.05</td><td> 61</td><td> 2</td><td>236</td><td>1141</td><td>3427</td></tr>\n",
       "\t<tr><td>8877689391</td><td>4/23/2016</td><td>11200</td><td> 7.43</td><td> 7.43</td><td>0</td><td> 0.00</td><td>0.00</td><td> 7.40</td><td>0.01</td><td>102</td><td> 6</td><td>300</td><td>1032</td><td>3891</td></tr>\n",
       "\t<tr><td>8877689391</td><td>4/24/2016</td><td>16674</td><td>15.74</td><td>15.74</td><td>0</td><td>11.01</td><td>0.01</td><td> 4.69</td><td>0.00</td><td> 64</td><td> 1</td><td>227</td><td>1148</td><td>3455</td></tr>\n",
       "\t<tr><td>8877689391</td><td>4/25/2016</td><td>12986</td><td> 8.74</td><td> 8.74</td><td>0</td><td> 2.37</td><td>0.07</td><td> 6.27</td><td>0.01</td><td>113</td><td> 8</td><td>218</td><td>1101</td><td>3802</td></tr>\n",
       "\t<tr><td>8877689391</td><td>4/26/2016</td><td>11101</td><td> 8.43</td><td> 8.43</td><td>0</td><td> 1.76</td><td>0.13</td><td> 6.50</td><td>0.00</td><td> 22</td><td> 3</td><td>258</td><td>1157</td><td>2860</td></tr>\n",
       "\t<tr><td>8877689391</td><td>4/27/2016</td><td>23629</td><td>20.65</td><td>20.65</td><td>0</td><td>13.07</td><td>0.44</td><td> 7.10</td><td>0.00</td><td> 93</td><td> 8</td><td>235</td><td>1104</td><td>3808</td></tr>\n",
       "\t<tr><td>8877689391</td><td>4/28/2016</td><td>14890</td><td>11.30</td><td>11.30</td><td>0</td><td> 4.93</td><td>0.38</td><td> 5.97</td><td>0.00</td><td> 58</td><td> 8</td><td>231</td><td>1143</td><td>3060</td></tr>\n",
       "\t<tr><td>8877689391</td><td>4/29/2016</td><td> 9733</td><td> 7.39</td><td> 7.39</td><td>0</td><td> 1.38</td><td>0.17</td><td> 5.79</td><td>0.00</td><td> 18</td><td> 5</td><td>210</td><td>1207</td><td>2698</td></tr>\n",
       "\t<tr><td>8877689391</td><td>4/30/2016</td><td>27745</td><td>26.72</td><td>26.72</td><td>0</td><td>21.66</td><td>0.08</td><td> 4.93</td><td>0.00</td><td>124</td><td> 4</td><td>223</td><td>1089</td><td>4398</td></tr>\n",
       "\t<tr><td>8877689391</td><td>5/1/2016 </td><td>10930</td><td> 8.32</td><td> 8.32</td><td>0</td><td> 3.13</td><td>0.57</td><td> 4.57</td><td>0.00</td><td> 36</td><td>12</td><td>166</td><td>1226</td><td>2786</td></tr>\n",
       "\t<tr><td>8877689391</td><td>5/2/2016 </td><td> 4790</td><td> 3.64</td><td> 3.64</td><td>0</td><td> 0.00</td><td>0.00</td><td> 3.56</td><td>0.00</td><td>  0</td><td> 0</td><td>105</td><td>1335</td><td>2189</td></tr>\n",
       "\t<tr><td>8877689391</td><td>5/3/2016 </td><td>10818</td><td> 8.21</td><td> 8.21</td><td>0</td><td> 1.39</td><td>0.10</td><td> 6.67</td><td>0.01</td><td> 19</td><td> 3</td><td>229</td><td>1189</td><td>2817</td></tr>\n",
       "\t<tr><td>8877689391</td><td>5/4/2016 </td><td>18193</td><td>16.30</td><td>16.30</td><td>0</td><td>10.42</td><td>0.31</td><td> 5.53</td><td>0.00</td><td> 66</td><td> 8</td><td>212</td><td>1154</td><td>3477</td></tr>\n",
       "\t<tr><td>8877689391</td><td>5/5/2016 </td><td>14055</td><td>10.67</td><td>10.67</td><td>0</td><td> 5.46</td><td>0.82</td><td> 4.37</td><td>0.00</td><td> 67</td><td>15</td><td>188</td><td>1170</td><td>3052</td></tr>\n",
       "\t<tr><td>8877689391</td><td>5/6/2016 </td><td>21727</td><td>19.34</td><td>19.34</td><td>0</td><td>12.79</td><td>0.29</td><td> 6.16</td><td>0.00</td><td> 96</td><td>17</td><td>232</td><td>1095</td><td>4015</td></tr>\n",
       "\t<tr><td>8877689391</td><td>5/7/2016 </td><td>12332</td><td> 8.13</td><td> 8.13</td><td>0</td><td> 0.08</td><td>0.96</td><td> 6.99</td><td>0.00</td><td>105</td><td>28</td><td>271</td><td>1036</td><td>4142</td></tr>\n",
       "\t<tr><td>8877689391</td><td>5/8/2016 </td><td>10686</td><td> 8.11</td><td> 8.11</td><td>0</td><td> 1.08</td><td>0.20</td><td> 6.80</td><td>0.00</td><td> 17</td><td> 4</td><td>245</td><td>1174</td><td>2847</td></tr>\n",
       "\t<tr><td>8877689391</td><td>5/9/2016 </td><td>20226</td><td>18.25</td><td>18.25</td><td>0</td><td>11.10</td><td>0.80</td><td> 6.24</td><td>0.05</td><td> 73</td><td>19</td><td>217</td><td>1131</td><td>3710</td></tr>\n",
       "\t<tr><td>8877689391</td><td>5/10/2016</td><td>10733</td><td> 8.15</td><td> 8.15</td><td>0</td><td> 1.35</td><td>0.46</td><td> 6.28</td><td>0.00</td><td> 18</td><td>11</td><td>224</td><td>1187</td><td>2832</td></tr>\n",
       "\t<tr><td>8877689391</td><td>5/11/2016</td><td>21420</td><td>19.56</td><td>19.56</td><td>0</td><td>13.22</td><td>0.41</td><td> 5.89</td><td>0.00</td><td> 88</td><td>12</td><td>213</td><td>1127</td><td>3832</td></tr>\n",
       "\t<tr><td>8877689391</td><td>5/12/2016</td><td> 8064</td><td> 6.12</td><td> 6.12</td><td>0</td><td> 1.82</td><td>0.04</td><td> 4.25</td><td>0.00</td><td> 23</td><td> 1</td><td>137</td><td> 770</td><td>1849</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A spec\\_tbl\\_df: 940 × 15\n",
       "\\begin{tabular}{lllllllllllllll}\n",
       " id & activity\\_date & total\\_steps & total\\_distance & tracker\\_distance & logged\\_activities\\_distance & very\\_active\\_distance & moderately\\_active\\_distance & light\\_active\\_distance & sedentary\\_active\\_distance & very\\_active\\_minutes & fairly\\_active\\_minutes & lightly\\_active\\_minutes & sedentary\\_minutes & calories\\\\\n",
       " <dbl> & <chr> & <dbl> & <dbl> & <dbl> & <dbl> & <dbl> & <dbl> & <dbl> & <dbl> & <dbl> & <dbl> & <dbl> & <dbl> & <dbl>\\\\\n",
       "\\hline\n",
       "\t 1503960366 & 4/12/2016 & 13162 &  8.50 &  8.50 & 0 & 1.88 & 0.55 & 6.06 & 0 & 25 & 13 & 328 &  728 & 1985\\\\\n",
       "\t 1503960366 & 4/13/2016 & 10735 &  6.97 &  6.97 & 0 & 1.57 & 0.69 & 4.71 & 0 & 21 & 19 & 217 &  776 & 1797\\\\\n",
       "\t 1503960366 & 4/14/2016 & 10460 &  6.74 &  6.74 & 0 & 2.44 & 0.40 & 3.91 & 0 & 30 & 11 & 181 & 1218 & 1776\\\\\n",
       "\t 1503960366 & 4/15/2016 &  9762 &  6.28 &  6.28 & 0 & 2.14 & 1.26 & 2.83 & 0 & 29 & 34 & 209 &  726 & 1745\\\\\n",
       "\t 1503960366 & 4/16/2016 & 12669 &  8.16 &  8.16 & 0 & 2.71 & 0.41 & 5.04 & 0 & 36 & 10 & 221 &  773 & 1863\\\\\n",
       "\t 1503960366 & 4/17/2016 &  9705 &  6.48 &  6.48 & 0 & 3.19 & 0.78 & 2.51 & 0 & 38 & 20 & 164 &  539 & 1728\\\\\n",
       "\t 1503960366 & 4/18/2016 & 13019 &  8.59 &  8.59 & 0 & 3.25 & 0.64 & 4.71 & 0 & 42 & 16 & 233 & 1149 & 1921\\\\\n",
       "\t 1503960366 & 4/19/2016 & 15506 &  9.88 &  9.88 & 0 & 3.53 & 1.32 & 5.03 & 0 & 50 & 31 & 264 &  775 & 2035\\\\\n",
       "\t 1503960366 & 4/20/2016 & 10544 &  6.68 &  6.68 & 0 & 1.96 & 0.48 & 4.24 & 0 & 28 & 12 & 205 &  818 & 1786\\\\\n",
       "\t 1503960366 & 4/21/2016 &  9819 &  6.34 &  6.34 & 0 & 1.34 & 0.35 & 4.65 & 0 & 19 &  8 & 211 &  838 & 1775\\\\\n",
       "\t 1503960366 & 4/22/2016 & 12764 &  8.13 &  8.13 & 0 & 4.76 & 1.12 & 2.24 & 0 & 66 & 27 & 130 & 1217 & 1827\\\\\n",
       "\t 1503960366 & 4/23/2016 & 14371 &  9.04 &  9.04 & 0 & 2.81 & 0.87 & 5.36 & 0 & 41 & 21 & 262 &  732 & 1949\\\\\n",
       "\t 1503960366 & 4/24/2016 & 10039 &  6.41 &  6.41 & 0 & 2.92 & 0.21 & 3.28 & 0 & 39 &  5 & 238 &  709 & 1788\\\\\n",
       "\t 1503960366 & 4/25/2016 & 15355 &  9.80 &  9.80 & 0 & 5.29 & 0.57 & 3.94 & 0 & 73 & 14 & 216 &  814 & 2013\\\\\n",
       "\t 1503960366 & 4/26/2016 & 13755 &  8.79 &  8.79 & 0 & 2.33 & 0.92 & 5.54 & 0 & 31 & 23 & 279 &  833 & 1970\\\\\n",
       "\t 1503960366 & 4/27/2016 & 18134 & 12.21 & 12.21 & 0 & 6.40 & 0.41 & 5.41 & 0 & 78 & 11 & 243 & 1108 & 2159\\\\\n",
       "\t 1503960366 & 4/28/2016 & 13154 &  8.53 &  8.53 & 0 & 3.54 & 1.16 & 3.79 & 0 & 48 & 28 & 189 &  782 & 1898\\\\\n",
       "\t 1503960366 & 4/29/2016 & 11181 &  7.15 &  7.15 & 0 & 1.06 & 0.50 & 5.58 & 0 & 16 & 12 & 243 &  815 & 1837\\\\\n",
       "\t 1503960366 & 4/30/2016 & 14673 &  9.25 &  9.25 & 0 & 3.56 & 1.42 & 4.27 & 0 & 52 & 34 & 217 &  712 & 1947\\\\\n",
       "\t 1503960366 & 5/1/2016  & 10602 &  6.81 &  6.81 & 0 & 2.29 & 1.60 & 2.92 & 0 & 33 & 35 & 246 &  730 & 1820\\\\\n",
       "\t 1503960366 & 5/2/2016  & 14727 &  9.71 &  9.71 & 0 & 3.21 & 0.57 & 5.92 & 0 & 41 & 15 & 277 &  798 & 2004\\\\\n",
       "\t 1503960366 & 5/3/2016  & 15103 &  9.66 &  9.66 & 0 & 3.73 & 1.05 & 4.88 & 0 & 50 & 24 & 254 &  816 & 1990\\\\\n",
       "\t 1503960366 & 5/4/2016  & 11100 &  7.15 &  7.15 & 0 & 2.46 & 0.87 & 3.82 & 0 & 36 & 22 & 203 & 1179 & 1819\\\\\n",
       "\t 1503960366 & 5/5/2016  & 14070 &  8.90 &  8.90 & 0 & 2.92 & 1.08 & 4.88 & 0 & 45 & 24 & 250 &  857 & 1959\\\\\n",
       "\t 1503960366 & 5/6/2016  & 12159 &  8.03 &  8.03 & 0 & 1.97 & 0.25 & 5.81 & 0 & 24 &  6 & 289 &  754 & 1896\\\\\n",
       "\t 1503960366 & 5/7/2016  & 11992 &  7.71 &  7.71 & 0 & 2.46 & 2.12 & 3.13 & 0 & 37 & 46 & 175 &  833 & 1821\\\\\n",
       "\t 1503960366 & 5/8/2016  & 10060 &  6.58 &  6.58 & 0 & 3.53 & 0.32 & 2.73 & 0 & 44 &  8 & 203 &  574 & 1740\\\\\n",
       "\t 1503960366 & 5/9/2016  & 12022 &  7.72 &  7.72 & 0 & 3.45 & 0.53 & 3.74 & 0 & 46 & 11 & 206 &  835 & 1819\\\\\n",
       "\t 1503960366 & 5/10/2016 & 12207 &  7.77 &  7.77 & 0 & 3.35 & 1.16 & 3.26 & 0 & 46 & 31 & 214 &  746 & 1859\\\\\n",
       "\t 1503960366 & 5/11/2016 & 12770 &  8.13 &  8.13 & 0 & 2.56 & 1.01 & 4.55 & 0 & 36 & 23 & 251 &  669 & 1783\\\\\n",
       "\t ⋮ & ⋮ & ⋮ & ⋮ & ⋮ & ⋮ & ⋮ & ⋮ & ⋮ & ⋮ & ⋮ & ⋮ & ⋮ & ⋮ & ⋮\\\\\n",
       "\t 8877689391 & 4/13/2016 & 15337 &  9.58 &  9.58 & 0 &  3.55 & 0.38 &  5.64 & 0.00 & 108 & 18 & 216 & 1098 & 3566\\\\\n",
       "\t 8877689391 & 4/14/2016 & 21129 & 18.98 & 18.98 & 0 & 10.55 & 0.59 &  7.75 & 0.02 &  68 & 13 & 298 & 1061 & 3793\\\\\n",
       "\t 8877689391 & 4/15/2016 & 13422 &  7.17 &  7.17 & 0 &  0.05 & 0.05 &  7.01 & 0.01 & 106 &  1 & 281 & 1052 & 3934\\\\\n",
       "\t 8877689391 & 4/16/2016 & 29326 & 25.29 & 25.29 & 0 & 13.24 & 1.21 & 10.71 & 0.00 &  94 & 29 & 429 &  888 & 4547\\\\\n",
       "\t 8877689391 & 4/17/2016 & 15118 &  8.87 &  8.87 & 0 &  0.00 & 0.07 &  8.79 & 0.00 &  58 & 15 & 307 & 1060 & 3545\\\\\n",
       "\t 8877689391 & 4/18/2016 & 11423 &  8.67 &  8.67 & 0 &  2.44 & 0.27 &  5.94 & 0.00 &  29 &  5 & 191 & 1215 & 2761\\\\\n",
       "\t 8877689391 & 4/19/2016 & 18785 & 17.40 & 17.40 & 0 & 12.15 & 0.18 &  5.03 & 0.00 &  82 & 13 & 214 & 1131 & 3676\\\\\n",
       "\t 8877689391 & 4/20/2016 & 19948 & 18.11 & 18.11 & 0 & 11.02 & 0.69 &  6.34 & 0.00 &  73 & 19 & 225 & 1123 & 3679\\\\\n",
       "\t 8877689391 & 4/21/2016 & 19377 & 17.62 & 17.62 & 0 & 12.29 & 0.42 &  4.89 & 0.00 &  82 & 13 & 226 & 1119 & 3659\\\\\n",
       "\t 8877689391 & 4/22/2016 & 18258 & 16.31 & 16.31 & 0 & 10.23 & 0.03 &  5.97 & 0.05 &  61 &  2 & 236 & 1141 & 3427\\\\\n",
       "\t 8877689391 & 4/23/2016 & 11200 &  7.43 &  7.43 & 0 &  0.00 & 0.00 &  7.40 & 0.01 & 102 &  6 & 300 & 1032 & 3891\\\\\n",
       "\t 8877689391 & 4/24/2016 & 16674 & 15.74 & 15.74 & 0 & 11.01 & 0.01 &  4.69 & 0.00 &  64 &  1 & 227 & 1148 & 3455\\\\\n",
       "\t 8877689391 & 4/25/2016 & 12986 &  8.74 &  8.74 & 0 &  2.37 & 0.07 &  6.27 & 0.01 & 113 &  8 & 218 & 1101 & 3802\\\\\n",
       "\t 8877689391 & 4/26/2016 & 11101 &  8.43 &  8.43 & 0 &  1.76 & 0.13 &  6.50 & 0.00 &  22 &  3 & 258 & 1157 & 2860\\\\\n",
       "\t 8877689391 & 4/27/2016 & 23629 & 20.65 & 20.65 & 0 & 13.07 & 0.44 &  7.10 & 0.00 &  93 &  8 & 235 & 1104 & 3808\\\\\n",
       "\t 8877689391 & 4/28/2016 & 14890 & 11.30 & 11.30 & 0 &  4.93 & 0.38 &  5.97 & 0.00 &  58 &  8 & 231 & 1143 & 3060\\\\\n",
       "\t 8877689391 & 4/29/2016 &  9733 &  7.39 &  7.39 & 0 &  1.38 & 0.17 &  5.79 & 0.00 &  18 &  5 & 210 & 1207 & 2698\\\\\n",
       "\t 8877689391 & 4/30/2016 & 27745 & 26.72 & 26.72 & 0 & 21.66 & 0.08 &  4.93 & 0.00 & 124 &  4 & 223 & 1089 & 4398\\\\\n",
       "\t 8877689391 & 5/1/2016  & 10930 &  8.32 &  8.32 & 0 &  3.13 & 0.57 &  4.57 & 0.00 &  36 & 12 & 166 & 1226 & 2786\\\\\n",
       "\t 8877689391 & 5/2/2016  &  4790 &  3.64 &  3.64 & 0 &  0.00 & 0.00 &  3.56 & 0.00 &   0 &  0 & 105 & 1335 & 2189\\\\\n",
       "\t 8877689391 & 5/3/2016  & 10818 &  8.21 &  8.21 & 0 &  1.39 & 0.10 &  6.67 & 0.01 &  19 &  3 & 229 & 1189 & 2817\\\\\n",
       "\t 8877689391 & 5/4/2016  & 18193 & 16.30 & 16.30 & 0 & 10.42 & 0.31 &  5.53 & 0.00 &  66 &  8 & 212 & 1154 & 3477\\\\\n",
       "\t 8877689391 & 5/5/2016  & 14055 & 10.67 & 10.67 & 0 &  5.46 & 0.82 &  4.37 & 0.00 &  67 & 15 & 188 & 1170 & 3052\\\\\n",
       "\t 8877689391 & 5/6/2016  & 21727 & 19.34 & 19.34 & 0 & 12.79 & 0.29 &  6.16 & 0.00 &  96 & 17 & 232 & 1095 & 4015\\\\\n",
       "\t 8877689391 & 5/7/2016  & 12332 &  8.13 &  8.13 & 0 &  0.08 & 0.96 &  6.99 & 0.00 & 105 & 28 & 271 & 1036 & 4142\\\\\n",
       "\t 8877689391 & 5/8/2016  & 10686 &  8.11 &  8.11 & 0 &  1.08 & 0.20 &  6.80 & 0.00 &  17 &  4 & 245 & 1174 & 2847\\\\\n",
       "\t 8877689391 & 5/9/2016  & 20226 & 18.25 & 18.25 & 0 & 11.10 & 0.80 &  6.24 & 0.05 &  73 & 19 & 217 & 1131 & 3710\\\\\n",
       "\t 8877689391 & 5/10/2016 & 10733 &  8.15 &  8.15 & 0 &  1.35 & 0.46 &  6.28 & 0.00 &  18 & 11 & 224 & 1187 & 2832\\\\\n",
       "\t 8877689391 & 5/11/2016 & 21420 & 19.56 & 19.56 & 0 & 13.22 & 0.41 &  5.89 & 0.00 &  88 & 12 & 213 & 1127 & 3832\\\\\n",
       "\t 8877689391 & 5/12/2016 &  8064 &  6.12 &  6.12 & 0 &  1.82 & 0.04 &  4.25 & 0.00 &  23 &  1 & 137 &  770 & 1849\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A spec_tbl_df: 940 × 15\n",
       "\n",
       "| id &lt;dbl&gt; | activity_date &lt;chr&gt; | total_steps &lt;dbl&gt; | total_distance &lt;dbl&gt; | tracker_distance &lt;dbl&gt; | logged_activities_distance &lt;dbl&gt; | very_active_distance &lt;dbl&gt; | moderately_active_distance &lt;dbl&gt; | light_active_distance &lt;dbl&gt; | sedentary_active_distance &lt;dbl&gt; | very_active_minutes &lt;dbl&gt; | fairly_active_minutes &lt;dbl&gt; | lightly_active_minutes &lt;dbl&gt; | sedentary_minutes &lt;dbl&gt; | calories &lt;dbl&gt; |\n",
       "|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|\n",
       "| 1503960366 | 4/12/2016 | 13162 |  8.50 |  8.50 | 0 | 1.88 | 0.55 | 6.06 | 0 | 25 | 13 | 328 |  728 | 1985 |\n",
       "| 1503960366 | 4/13/2016 | 10735 |  6.97 |  6.97 | 0 | 1.57 | 0.69 | 4.71 | 0 | 21 | 19 | 217 |  776 | 1797 |\n",
       "| 1503960366 | 4/14/2016 | 10460 |  6.74 |  6.74 | 0 | 2.44 | 0.40 | 3.91 | 0 | 30 | 11 | 181 | 1218 | 1776 |\n",
       "| 1503960366 | 4/15/2016 |  9762 |  6.28 |  6.28 | 0 | 2.14 | 1.26 | 2.83 | 0 | 29 | 34 | 209 |  726 | 1745 |\n",
       "| 1503960366 | 4/16/2016 | 12669 |  8.16 |  8.16 | 0 | 2.71 | 0.41 | 5.04 | 0 | 36 | 10 | 221 |  773 | 1863 |\n",
       "| 1503960366 | 4/17/2016 |  9705 |  6.48 |  6.48 | 0 | 3.19 | 0.78 | 2.51 | 0 | 38 | 20 | 164 |  539 | 1728 |\n",
       "| 1503960366 | 4/18/2016 | 13019 |  8.59 |  8.59 | 0 | 3.25 | 0.64 | 4.71 | 0 | 42 | 16 | 233 | 1149 | 1921 |\n",
       "| 1503960366 | 4/19/2016 | 15506 |  9.88 |  9.88 | 0 | 3.53 | 1.32 | 5.03 | 0 | 50 | 31 | 264 |  775 | 2035 |\n",
       "| 1503960366 | 4/20/2016 | 10544 |  6.68 |  6.68 | 0 | 1.96 | 0.48 | 4.24 | 0 | 28 | 12 | 205 |  818 | 1786 |\n",
       "| 1503960366 | 4/21/2016 |  9819 |  6.34 |  6.34 | 0 | 1.34 | 0.35 | 4.65 | 0 | 19 |  8 | 211 |  838 | 1775 |\n",
       "| 1503960366 | 4/22/2016 | 12764 |  8.13 |  8.13 | 0 | 4.76 | 1.12 | 2.24 | 0 | 66 | 27 | 130 | 1217 | 1827 |\n",
       "| 1503960366 | 4/23/2016 | 14371 |  9.04 |  9.04 | 0 | 2.81 | 0.87 | 5.36 | 0 | 41 | 21 | 262 |  732 | 1949 |\n",
       "| 1503960366 | 4/24/2016 | 10039 |  6.41 |  6.41 | 0 | 2.92 | 0.21 | 3.28 | 0 | 39 |  5 | 238 |  709 | 1788 |\n",
       "| 1503960366 | 4/25/2016 | 15355 |  9.80 |  9.80 | 0 | 5.29 | 0.57 | 3.94 | 0 | 73 | 14 | 216 |  814 | 2013 |\n",
       "| 1503960366 | 4/26/2016 | 13755 |  8.79 |  8.79 | 0 | 2.33 | 0.92 | 5.54 | 0 | 31 | 23 | 279 |  833 | 1970 |\n",
       "| 1503960366 | 4/27/2016 | 18134 | 12.21 | 12.21 | 0 | 6.40 | 0.41 | 5.41 | 0 | 78 | 11 | 243 | 1108 | 2159 |\n",
       "| 1503960366 | 4/28/2016 | 13154 |  8.53 |  8.53 | 0 | 3.54 | 1.16 | 3.79 | 0 | 48 | 28 | 189 |  782 | 1898 |\n",
       "| 1503960366 | 4/29/2016 | 11181 |  7.15 |  7.15 | 0 | 1.06 | 0.50 | 5.58 | 0 | 16 | 12 | 243 |  815 | 1837 |\n",
       "| 1503960366 | 4/30/2016 | 14673 |  9.25 |  9.25 | 0 | 3.56 | 1.42 | 4.27 | 0 | 52 | 34 | 217 |  712 | 1947 |\n",
       "| 1503960366 | 5/1/2016  | 10602 |  6.81 |  6.81 | 0 | 2.29 | 1.60 | 2.92 | 0 | 33 | 35 | 246 |  730 | 1820 |\n",
       "| 1503960366 | 5/2/2016  | 14727 |  9.71 |  9.71 | 0 | 3.21 | 0.57 | 5.92 | 0 | 41 | 15 | 277 |  798 | 2004 |\n",
       "| 1503960366 | 5/3/2016  | 15103 |  9.66 |  9.66 | 0 | 3.73 | 1.05 | 4.88 | 0 | 50 | 24 | 254 |  816 | 1990 |\n",
       "| 1503960366 | 5/4/2016  | 11100 |  7.15 |  7.15 | 0 | 2.46 | 0.87 | 3.82 | 0 | 36 | 22 | 203 | 1179 | 1819 |\n",
       "| 1503960366 | 5/5/2016  | 14070 |  8.90 |  8.90 | 0 | 2.92 | 1.08 | 4.88 | 0 | 45 | 24 | 250 |  857 | 1959 |\n",
       "| 1503960366 | 5/6/2016  | 12159 |  8.03 |  8.03 | 0 | 1.97 | 0.25 | 5.81 | 0 | 24 |  6 | 289 |  754 | 1896 |\n",
       "| 1503960366 | 5/7/2016  | 11992 |  7.71 |  7.71 | 0 | 2.46 | 2.12 | 3.13 | 0 | 37 | 46 | 175 |  833 | 1821 |\n",
       "| 1503960366 | 5/8/2016  | 10060 |  6.58 |  6.58 | 0 | 3.53 | 0.32 | 2.73 | 0 | 44 |  8 | 203 |  574 | 1740 |\n",
       "| 1503960366 | 5/9/2016  | 12022 |  7.72 |  7.72 | 0 | 3.45 | 0.53 | 3.74 | 0 | 46 | 11 | 206 |  835 | 1819 |\n",
       "| 1503960366 | 5/10/2016 | 12207 |  7.77 |  7.77 | 0 | 3.35 | 1.16 | 3.26 | 0 | 46 | 31 | 214 |  746 | 1859 |\n",
       "| 1503960366 | 5/11/2016 | 12770 |  8.13 |  8.13 | 0 | 2.56 | 1.01 | 4.55 | 0 | 36 | 23 | 251 |  669 | 1783 |\n",
       "| ⋮ | ⋮ | ⋮ | ⋮ | ⋮ | ⋮ | ⋮ | ⋮ | ⋮ | ⋮ | ⋮ | ⋮ | ⋮ | ⋮ | ⋮ |\n",
       "| 8877689391 | 4/13/2016 | 15337 |  9.58 |  9.58 | 0 |  3.55 | 0.38 |  5.64 | 0.00 | 108 | 18 | 216 | 1098 | 3566 |\n",
       "| 8877689391 | 4/14/2016 | 21129 | 18.98 | 18.98 | 0 | 10.55 | 0.59 |  7.75 | 0.02 |  68 | 13 | 298 | 1061 | 3793 |\n",
       "| 8877689391 | 4/15/2016 | 13422 |  7.17 |  7.17 | 0 |  0.05 | 0.05 |  7.01 | 0.01 | 106 |  1 | 281 | 1052 | 3934 |\n",
       "| 8877689391 | 4/16/2016 | 29326 | 25.29 | 25.29 | 0 | 13.24 | 1.21 | 10.71 | 0.00 |  94 | 29 | 429 |  888 | 4547 |\n",
       "| 8877689391 | 4/17/2016 | 15118 |  8.87 |  8.87 | 0 |  0.00 | 0.07 |  8.79 | 0.00 |  58 | 15 | 307 | 1060 | 3545 |\n",
       "| 8877689391 | 4/18/2016 | 11423 |  8.67 |  8.67 | 0 |  2.44 | 0.27 |  5.94 | 0.00 |  29 |  5 | 191 | 1215 | 2761 |\n",
       "| 8877689391 | 4/19/2016 | 18785 | 17.40 | 17.40 | 0 | 12.15 | 0.18 |  5.03 | 0.00 |  82 | 13 | 214 | 1131 | 3676 |\n",
       "| 8877689391 | 4/20/2016 | 19948 | 18.11 | 18.11 | 0 | 11.02 | 0.69 |  6.34 | 0.00 |  73 | 19 | 225 | 1123 | 3679 |\n",
       "| 8877689391 | 4/21/2016 | 19377 | 17.62 | 17.62 | 0 | 12.29 | 0.42 |  4.89 | 0.00 |  82 | 13 | 226 | 1119 | 3659 |\n",
       "| 8877689391 | 4/22/2016 | 18258 | 16.31 | 16.31 | 0 | 10.23 | 0.03 |  5.97 | 0.05 |  61 |  2 | 236 | 1141 | 3427 |\n",
       "| 8877689391 | 4/23/2016 | 11200 |  7.43 |  7.43 | 0 |  0.00 | 0.00 |  7.40 | 0.01 | 102 |  6 | 300 | 1032 | 3891 |\n",
       "| 8877689391 | 4/24/2016 | 16674 | 15.74 | 15.74 | 0 | 11.01 | 0.01 |  4.69 | 0.00 |  64 |  1 | 227 | 1148 | 3455 |\n",
       "| 8877689391 | 4/25/2016 | 12986 |  8.74 |  8.74 | 0 |  2.37 | 0.07 |  6.27 | 0.01 | 113 |  8 | 218 | 1101 | 3802 |\n",
       "| 8877689391 | 4/26/2016 | 11101 |  8.43 |  8.43 | 0 |  1.76 | 0.13 |  6.50 | 0.00 |  22 |  3 | 258 | 1157 | 2860 |\n",
       "| 8877689391 | 4/27/2016 | 23629 | 20.65 | 20.65 | 0 | 13.07 | 0.44 |  7.10 | 0.00 |  93 |  8 | 235 | 1104 | 3808 |\n",
       "| 8877689391 | 4/28/2016 | 14890 | 11.30 | 11.30 | 0 |  4.93 | 0.38 |  5.97 | 0.00 |  58 |  8 | 231 | 1143 | 3060 |\n",
       "| 8877689391 | 4/29/2016 |  9733 |  7.39 |  7.39 | 0 |  1.38 | 0.17 |  5.79 | 0.00 |  18 |  5 | 210 | 1207 | 2698 |\n",
       "| 8877689391 | 4/30/2016 | 27745 | 26.72 | 26.72 | 0 | 21.66 | 0.08 |  4.93 | 0.00 | 124 |  4 | 223 | 1089 | 4398 |\n",
       "| 8877689391 | 5/1/2016  | 10930 |  8.32 |  8.32 | 0 |  3.13 | 0.57 |  4.57 | 0.00 |  36 | 12 | 166 | 1226 | 2786 |\n",
       "| 8877689391 | 5/2/2016  |  4790 |  3.64 |  3.64 | 0 |  0.00 | 0.00 |  3.56 | 0.00 |   0 |  0 | 105 | 1335 | 2189 |\n",
       "| 8877689391 | 5/3/2016  | 10818 |  8.21 |  8.21 | 0 |  1.39 | 0.10 |  6.67 | 0.01 |  19 |  3 | 229 | 1189 | 2817 |\n",
       "| 8877689391 | 5/4/2016  | 18193 | 16.30 | 16.30 | 0 | 10.42 | 0.31 |  5.53 | 0.00 |  66 |  8 | 212 | 1154 | 3477 |\n",
       "| 8877689391 | 5/5/2016  | 14055 | 10.67 | 10.67 | 0 |  5.46 | 0.82 |  4.37 | 0.00 |  67 | 15 | 188 | 1170 | 3052 |\n",
       "| 8877689391 | 5/6/2016  | 21727 | 19.34 | 19.34 | 0 | 12.79 | 0.29 |  6.16 | 0.00 |  96 | 17 | 232 | 1095 | 4015 |\n",
       "| 8877689391 | 5/7/2016  | 12332 |  8.13 |  8.13 | 0 |  0.08 | 0.96 |  6.99 | 0.00 | 105 | 28 | 271 | 1036 | 4142 |\n",
       "| 8877689391 | 5/8/2016  | 10686 |  8.11 |  8.11 | 0 |  1.08 | 0.20 |  6.80 | 0.00 |  17 |  4 | 245 | 1174 | 2847 |\n",
       "| 8877689391 | 5/9/2016  | 20226 | 18.25 | 18.25 | 0 | 11.10 | 0.80 |  6.24 | 0.05 |  73 | 19 | 217 | 1131 | 3710 |\n",
       "| 8877689391 | 5/10/2016 | 10733 |  8.15 |  8.15 | 0 |  1.35 | 0.46 |  6.28 | 0.00 |  18 | 11 | 224 | 1187 | 2832 |\n",
       "| 8877689391 | 5/11/2016 | 21420 | 19.56 | 19.56 | 0 | 13.22 | 0.41 |  5.89 | 0.00 |  88 | 12 | 213 | 1127 | 3832 |\n",
       "| 8877689391 | 5/12/2016 |  8064 |  6.12 |  6.12 | 0 |  1.82 | 0.04 |  4.25 | 0.00 |  23 |  1 | 137 |  770 | 1849 |\n",
       "\n"
      ],
      "text/plain": [
       "    id         activity_date total_steps total_distance tracker_distance\n",
       "1   1503960366 4/12/2016     13162        8.50           8.50           \n",
       "2   1503960366 4/13/2016     10735        6.97           6.97           \n",
       "3   1503960366 4/14/2016     10460        6.74           6.74           \n",
       "4   1503960366 4/15/2016      9762        6.28           6.28           \n",
       "5   1503960366 4/16/2016     12669        8.16           8.16           \n",
       "6   1503960366 4/17/2016      9705        6.48           6.48           \n",
       "7   1503960366 4/18/2016     13019        8.59           8.59           \n",
       "8   1503960366 4/19/2016     15506        9.88           9.88           \n",
       "9   1503960366 4/20/2016     10544        6.68           6.68           \n",
       "10  1503960366 4/21/2016      9819        6.34           6.34           \n",
       "11  1503960366 4/22/2016     12764        8.13           8.13           \n",
       "12  1503960366 4/23/2016     14371        9.04           9.04           \n",
       "13  1503960366 4/24/2016     10039        6.41           6.41           \n",
       "14  1503960366 4/25/2016     15355        9.80           9.80           \n",
       "15  1503960366 4/26/2016     13755        8.79           8.79           \n",
       "16  1503960366 4/27/2016     18134       12.21          12.21           \n",
       "17  1503960366 4/28/2016     13154        8.53           8.53           \n",
       "18  1503960366 4/29/2016     11181        7.15           7.15           \n",
       "19  1503960366 4/30/2016     14673        9.25           9.25           \n",
       "20  1503960366 5/1/2016      10602        6.81           6.81           \n",
       "21  1503960366 5/2/2016      14727        9.71           9.71           \n",
       "22  1503960366 5/3/2016      15103        9.66           9.66           \n",
       "23  1503960366 5/4/2016      11100        7.15           7.15           \n",
       "24  1503960366 5/5/2016      14070        8.90           8.90           \n",
       "25  1503960366 5/6/2016      12159        8.03           8.03           \n",
       "26  1503960366 5/7/2016      11992        7.71           7.71           \n",
       "27  1503960366 5/8/2016      10060        6.58           6.58           \n",
       "28  1503960366 5/9/2016      12022        7.72           7.72           \n",
       "29  1503960366 5/10/2016     12207        7.77           7.77           \n",
       "30  1503960366 5/11/2016     12770        8.13           8.13           \n",
       "⋮   ⋮          ⋮             ⋮           ⋮              ⋮               \n",
       "911 8877689391 4/13/2016     15337        9.58           9.58           \n",
       "912 8877689391 4/14/2016     21129       18.98          18.98           \n",
       "913 8877689391 4/15/2016     13422        7.17           7.17           \n",
       "914 8877689391 4/16/2016     29326       25.29          25.29           \n",
       "915 8877689391 4/17/2016     15118        8.87           8.87           \n",
       "916 8877689391 4/18/2016     11423        8.67           8.67           \n",
       "917 8877689391 4/19/2016     18785       17.40          17.40           \n",
       "918 8877689391 4/20/2016     19948       18.11          18.11           \n",
       "919 8877689391 4/21/2016     19377       17.62          17.62           \n",
       "920 8877689391 4/22/2016     18258       16.31          16.31           \n",
       "921 8877689391 4/23/2016     11200        7.43           7.43           \n",
       "922 8877689391 4/24/2016     16674       15.74          15.74           \n",
       "923 8877689391 4/25/2016     12986        8.74           8.74           \n",
       "924 8877689391 4/26/2016     11101        8.43           8.43           \n",
       "925 8877689391 4/27/2016     23629       20.65          20.65           \n",
       "926 8877689391 4/28/2016     14890       11.30          11.30           \n",
       "927 8877689391 4/29/2016      9733        7.39           7.39           \n",
       "928 8877689391 4/30/2016     27745       26.72          26.72           \n",
       "929 8877689391 5/1/2016      10930        8.32           8.32           \n",
       "930 8877689391 5/2/2016       4790        3.64           3.64           \n",
       "931 8877689391 5/3/2016      10818        8.21           8.21           \n",
       "932 8877689391 5/4/2016      18193       16.30          16.30           \n",
       "933 8877689391 5/5/2016      14055       10.67          10.67           \n",
       "934 8877689391 5/6/2016      21727       19.34          19.34           \n",
       "935 8877689391 5/7/2016      12332        8.13           8.13           \n",
       "936 8877689391 5/8/2016      10686        8.11           8.11           \n",
       "937 8877689391 5/9/2016      20226       18.25          18.25           \n",
       "938 8877689391 5/10/2016     10733        8.15           8.15           \n",
       "939 8877689391 5/11/2016     21420       19.56          19.56           \n",
       "940 8877689391 5/12/2016      8064        6.12           6.12           \n",
       "    logged_activities_distance very_active_distance moderately_active_distance\n",
       "1   0                          1.88                 0.55                      \n",
       "2   0                          1.57                 0.69                      \n",
       "3   0                          2.44                 0.40                      \n",
       "4   0                          2.14                 1.26                      \n",
       "5   0                          2.71                 0.41                      \n",
       "6   0                          3.19                 0.78                      \n",
       "7   0                          3.25                 0.64                      \n",
       "8   0                          3.53                 1.32                      \n",
       "9   0                          1.96                 0.48                      \n",
       "10  0                          1.34                 0.35                      \n",
       "11  0                          4.76                 1.12                      \n",
       "12  0                          2.81                 0.87                      \n",
       "13  0                          2.92                 0.21                      \n",
       "14  0                          5.29                 0.57                      \n",
       "15  0                          2.33                 0.92                      \n",
       "16  0                          6.40                 0.41                      \n",
       "17  0                          3.54                 1.16                      \n",
       "18  0                          1.06                 0.50                      \n",
       "19  0                          3.56                 1.42                      \n",
       "20  0                          2.29                 1.60                      \n",
       "21  0                          3.21                 0.57                      \n",
       "22  0                          3.73                 1.05                      \n",
       "23  0                          2.46                 0.87                      \n",
       "24  0                          2.92                 1.08                      \n",
       "25  0                          1.97                 0.25                      \n",
       "26  0                          2.46                 2.12                      \n",
       "27  0                          3.53                 0.32                      \n",
       "28  0                          3.45                 0.53                      \n",
       "29  0                          3.35                 1.16                      \n",
       "30  0                          2.56                 1.01                      \n",
       "⋮   ⋮                          ⋮                    ⋮                         \n",
       "911 0                           3.55                0.38                      \n",
       "912 0                          10.55                0.59                      \n",
       "913 0                           0.05                0.05                      \n",
       "914 0                          13.24                1.21                      \n",
       "915 0                           0.00                0.07                      \n",
       "916 0                           2.44                0.27                      \n",
       "917 0                          12.15                0.18                      \n",
       "918 0                          11.02                0.69                      \n",
       "919 0                          12.29                0.42                      \n",
       "920 0                          10.23                0.03                      \n",
       "921 0                           0.00                0.00                      \n",
       "922 0                          11.01                0.01                      \n",
       "923 0                           2.37                0.07                      \n",
       "924 0                           1.76                0.13                      \n",
       "925 0                          13.07                0.44                      \n",
       "926 0                           4.93                0.38                      \n",
       "927 0                           1.38                0.17                      \n",
       "928 0                          21.66                0.08                      \n",
       "929 0                           3.13                0.57                      \n",
       "930 0                           0.00                0.00                      \n",
       "931 0                           1.39                0.10                      \n",
       "932 0                          10.42                0.31                      \n",
       "933 0                           5.46                0.82                      \n",
       "934 0                          12.79                0.29                      \n",
       "935 0                           0.08                0.96                      \n",
       "936 0                           1.08                0.20                      \n",
       "937 0                          11.10                0.80                      \n",
       "938 0                           1.35                0.46                      \n",
       "939 0                          13.22                0.41                      \n",
       "940 0                           1.82                0.04                      \n",
       "    light_active_distance sedentary_active_distance very_active_minutes\n",
       "1   6.06                  0                         25                 \n",
       "2   4.71                  0                         21                 \n",
       "3   3.91                  0                         30                 \n",
       "4   2.83                  0                         29                 \n",
       "5   5.04                  0                         36                 \n",
       "6   2.51                  0                         38                 \n",
       "7   4.71                  0                         42                 \n",
       "8   5.03                  0                         50                 \n",
       "9   4.24                  0                         28                 \n",
       "10  4.65                  0                         19                 \n",
       "11  2.24                  0                         66                 \n",
       "12  5.36                  0                         41                 \n",
       "13  3.28                  0                         39                 \n",
       "14  3.94                  0                         73                 \n",
       "15  5.54                  0                         31                 \n",
       "16  5.41                  0                         78                 \n",
       "17  3.79                  0                         48                 \n",
       "18  5.58                  0                         16                 \n",
       "19  4.27                  0                         52                 \n",
       "20  2.92                  0                         33                 \n",
       "21  5.92                  0                         41                 \n",
       "22  4.88                  0                         50                 \n",
       "23  3.82                  0                         36                 \n",
       "24  4.88                  0                         45                 \n",
       "25  5.81                  0                         24                 \n",
       "26  3.13                  0                         37                 \n",
       "27  2.73                  0                         44                 \n",
       "28  3.74                  0                         46                 \n",
       "29  3.26                  0                         46                 \n",
       "30  4.55                  0                         36                 \n",
       "⋮   ⋮                     ⋮                         ⋮                  \n",
       "911  5.64                 0.00                      108                \n",
       "912  7.75                 0.02                       68                \n",
       "913  7.01                 0.01                      106                \n",
       "914 10.71                 0.00                       94                \n",
       "915  8.79                 0.00                       58                \n",
       "916  5.94                 0.00                       29                \n",
       "917  5.03                 0.00                       82                \n",
       "918  6.34                 0.00                       73                \n",
       "919  4.89                 0.00                       82                \n",
       "920  5.97                 0.05                       61                \n",
       "921  7.40                 0.01                      102                \n",
       "922  4.69                 0.00                       64                \n",
       "923  6.27                 0.01                      113                \n",
       "924  6.50                 0.00                       22                \n",
       "925  7.10                 0.00                       93                \n",
       "926  5.97                 0.00                       58                \n",
       "927  5.79                 0.00                       18                \n",
       "928  4.93                 0.00                      124                \n",
       "929  4.57                 0.00                       36                \n",
       "930  3.56                 0.00                        0                \n",
       "931  6.67                 0.01                       19                \n",
       "932  5.53                 0.00                       66                \n",
       "933  4.37                 0.00                       67                \n",
       "934  6.16                 0.00                       96                \n",
       "935  6.99                 0.00                      105                \n",
       "936  6.80                 0.00                       17                \n",
       "937  6.24                 0.05                       73                \n",
       "938  6.28                 0.00                       18                \n",
       "939  5.89                 0.00                       88                \n",
       "940  4.25                 0.00                       23                \n",
       "    fairly_active_minutes lightly_active_minutes sedentary_minutes calories\n",
       "1   13                    328                     728              1985    \n",
       "2   19                    217                     776              1797    \n",
       "3   11                    181                    1218              1776    \n",
       "4   34                    209                     726              1745    \n",
       "5   10                    221                     773              1863    \n",
       "6   20                    164                     539              1728    \n",
       "7   16                    233                    1149              1921    \n",
       "8   31                    264                     775              2035    \n",
       "9   12                    205                     818              1786    \n",
       "10   8                    211                     838              1775    \n",
       "11  27                    130                    1217              1827    \n",
       "12  21                    262                     732              1949    \n",
       "13   5                    238                     709              1788    \n",
       "14  14                    216                     814              2013    \n",
       "15  23                    279                     833              1970    \n",
       "16  11                    243                    1108              2159    \n",
       "17  28                    189                     782              1898    \n",
       "18  12                    243                     815              1837    \n",
       "19  34                    217                     712              1947    \n",
       "20  35                    246                     730              1820    \n",
       "21  15                    277                     798              2004    \n",
       "22  24                    254                     816              1990    \n",
       "23  22                    203                    1179              1819    \n",
       "24  24                    250                     857              1959    \n",
       "25   6                    289                     754              1896    \n",
       "26  46                    175                     833              1821    \n",
       "27   8                    203                     574              1740    \n",
       "28  11                    206                     835              1819    \n",
       "29  31                    214                     746              1859    \n",
       "30  23                    251                     669              1783    \n",
       "⋮   ⋮                     ⋮                      ⋮                 ⋮       \n",
       "911 18                    216                    1098              3566    \n",
       "912 13                    298                    1061              3793    \n",
       "913  1                    281                    1052              3934    \n",
       "914 29                    429                     888              4547    \n",
       "915 15                    307                    1060              3545    \n",
       "916  5                    191                    1215              2761    \n",
       "917 13                    214                    1131              3676    \n",
       "918 19                    225                    1123              3679    \n",
       "919 13                    226                    1119              3659    \n",
       "920  2                    236                    1141              3427    \n",
       "921  6                    300                    1032              3891    \n",
       "922  1                    227                    1148              3455    \n",
       "923  8                    218                    1101              3802    \n",
       "924  3                    258                    1157              2860    \n",
       "925  8                    235                    1104              3808    \n",
       "926  8                    231                    1143              3060    \n",
       "927  5                    210                    1207              2698    \n",
       "928  4                    223                    1089              4398    \n",
       "929 12                    166                    1226              2786    \n",
       "930  0                    105                    1335              2189    \n",
       "931  3                    229                    1189              2817    \n",
       "932  8                    212                    1154              3477    \n",
       "933 15                    188                    1170              3052    \n",
       "934 17                    232                    1095              4015    \n",
       "935 28                    271                    1036              4142    \n",
       "936  4                    245                    1174              2847    \n",
       "937 19                    217                    1131              3710    \n",
       "938 11                    224                    1187              2832    \n",
       "939 12                    213                    1127              3832    \n",
       "940  1                    137                     770              1849    "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    },
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A spec_tbl_df: 413 × 5</caption>\n",
       "<thead>\n",
       "\t<tr><th scope=col>id</th><th scope=col>sleep_day</th><th scope=col>total_sleep_records</th><th scope=col>total_minutes_asleep</th><th scope=col>total_time_in_bed</th></tr>\n",
       "\t<tr><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><td>1503960366</td><td>4/12/2016 12:00:00 AM</td><td>1</td><td>327</td><td>346</td></tr>\n",
       "\t<tr><td>1503960366</td><td>4/13/2016 12:00:00 AM</td><td>2</td><td>384</td><td>407</td></tr>\n",
       "\t<tr><td>1503960366</td><td>4/15/2016 12:00:00 AM</td><td>1</td><td>412</td><td>442</td></tr>\n",
       "\t<tr><td>1503960366</td><td>4/16/2016 12:00:00 AM</td><td>2</td><td>340</td><td>367</td></tr>\n",
       "\t<tr><td>1503960366</td><td>4/17/2016 12:00:00 AM</td><td>1</td><td>700</td><td>712</td></tr>\n",
       "\t<tr><td>1503960366</td><td>4/19/2016 12:00:00 AM</td><td>1</td><td>304</td><td>320</td></tr>\n",
       "\t<tr><td>1503960366</td><td>4/20/2016 12:00:00 AM</td><td>1</td><td>360</td><td>377</td></tr>\n",
       "\t<tr><td>1503960366</td><td>4/21/2016 12:00:00 AM</td><td>1</td><td>325</td><td>364</td></tr>\n",
       "\t<tr><td>1503960366</td><td>4/23/2016 12:00:00 AM</td><td>1</td><td>361</td><td>384</td></tr>\n",
       "\t<tr><td>1503960366</td><td>4/24/2016 12:00:00 AM</td><td>1</td><td>430</td><td>449</td></tr>\n",
       "\t<tr><td>1503960366</td><td>4/25/2016 12:00:00 AM</td><td>1</td><td>277</td><td>323</td></tr>\n",
       "\t<tr><td>1503960366</td><td>4/26/2016 12:00:00 AM</td><td>1</td><td>245</td><td>274</td></tr>\n",
       "\t<tr><td>1503960366</td><td>4/28/2016 12:00:00 AM</td><td>1</td><td>366</td><td>393</td></tr>\n",
       "\t<tr><td>1503960366</td><td>4/29/2016 12:00:00 AM</td><td>1</td><td>341</td><td>354</td></tr>\n",
       "\t<tr><td>1503960366</td><td>4/30/2016 12:00:00 AM</td><td>1</td><td>404</td><td>425</td></tr>\n",
       "\t<tr><td>1503960366</td><td>5/1/2016 12:00:00 AM </td><td>1</td><td>369</td><td>396</td></tr>\n",
       "\t<tr><td>1503960366</td><td>5/2/2016 12:00:00 AM </td><td>1</td><td>277</td><td>309</td></tr>\n",
       "\t<tr><td>1503960366</td><td>5/3/2016 12:00:00 AM </td><td>1</td><td>273</td><td>296</td></tr>\n",
       "\t<tr><td>1503960366</td><td>5/5/2016 12:00:00 AM </td><td>1</td><td>247</td><td>264</td></tr>\n",
       "\t<tr><td>1503960366</td><td>5/6/2016 12:00:00 AM </td><td>1</td><td>334</td><td>367</td></tr>\n",
       "\t<tr><td>1503960366</td><td>5/7/2016 12:00:00 AM </td><td>1</td><td>331</td><td>349</td></tr>\n",
       "\t<tr><td>1503960366</td><td>5/8/2016 12:00:00 AM </td><td>1</td><td>594</td><td>611</td></tr>\n",
       "\t<tr><td>1503960366</td><td>5/9/2016 12:00:00 AM </td><td>1</td><td>338</td><td>342</td></tr>\n",
       "\t<tr><td>1503960366</td><td>5/10/2016 12:00:00 AM</td><td>1</td><td>383</td><td>403</td></tr>\n",
       "\t<tr><td>1503960366</td><td>5/11/2016 12:00:00 AM</td><td>1</td><td>285</td><td>306</td></tr>\n",
       "\t<tr><td>1644430081</td><td>4/29/2016 12:00:00 AM</td><td>1</td><td>119</td><td>127</td></tr>\n",
       "\t<tr><td>1644430081</td><td>4/30/2016 12:00:00 AM</td><td>1</td><td>124</td><td>142</td></tr>\n",
       "\t<tr><td>1644430081</td><td>5/2/2016 12:00:00 AM </td><td>1</td><td>796</td><td>961</td></tr>\n",
       "\t<tr><td>1644430081</td><td>5/8/2016 12:00:00 AM </td><td>1</td><td>137</td><td>154</td></tr>\n",
       "\t<tr><td>1844505072</td><td>4/15/2016 12:00:00 AM</td><td>1</td><td>644</td><td>961</td></tr>\n",
       "\t<tr><td>⋮</td><td>⋮</td><td>⋮</td><td>⋮</td><td>⋮</td></tr>\n",
       "\t<tr><td>8378563200</td><td>4/28/2016 12:00:00 AM</td><td>1</td><td>506</td><td>556</td></tr>\n",
       "\t<tr><td>8378563200</td><td>4/29/2016 12:00:00 AM</td><td>1</td><td>527</td><td>562</td></tr>\n",
       "\t<tr><td>8378563200</td><td>4/30/2016 12:00:00 AM</td><td>1</td><td>468</td><td>555</td></tr>\n",
       "\t<tr><td>8378563200</td><td>5/1/2016 12:00:00 AM </td><td>1</td><td>475</td><td>539</td></tr>\n",
       "\t<tr><td>8378563200</td><td>5/2/2016 12:00:00 AM </td><td>1</td><td>351</td><td>385</td></tr>\n",
       "\t<tr><td>8378563200</td><td>5/3/2016 12:00:00 AM </td><td>1</td><td>405</td><td>429</td></tr>\n",
       "\t<tr><td>8378563200</td><td>5/4/2016 12:00:00 AM </td><td>1</td><td>441</td><td>477</td></tr>\n",
       "\t<tr><td>8378563200</td><td>5/5/2016 12:00:00 AM </td><td>1</td><td>381</td><td>417</td></tr>\n",
       "\t<tr><td>8378563200</td><td>5/6/2016 12:00:00 AM </td><td>1</td><td>323</td><td>355</td></tr>\n",
       "\t<tr><td>8378563200</td><td>5/7/2016 12:00:00 AM </td><td>2</td><td>459</td><td>513</td></tr>\n",
       "\t<tr><td>8378563200</td><td>5/8/2016 12:00:00 AM </td><td>1</td><td>545</td><td>606</td></tr>\n",
       "\t<tr><td>8378563200</td><td>5/9/2016 12:00:00 AM </td><td>1</td><td>359</td><td>399</td></tr>\n",
       "\t<tr><td>8378563200</td><td>5/10/2016 12:00:00 AM</td><td>1</td><td>342</td><td>391</td></tr>\n",
       "\t<tr><td>8378563200</td><td>5/11/2016 12:00:00 AM</td><td>1</td><td>368</td><td>387</td></tr>\n",
       "\t<tr><td>8378563200</td><td>5/12/2016 12:00:00 AM</td><td>1</td><td>496</td><td>546</td></tr>\n",
       "\t<tr><td>8792009665</td><td>4/12/2016 12:00:00 AM</td><td>1</td><td>458</td><td>493</td></tr>\n",
       "\t<tr><td>8792009665</td><td>4/13/2016 12:00:00 AM</td><td>1</td><td>531</td><td>552</td></tr>\n",
       "\t<tr><td>8792009665</td><td>4/14/2016 12:00:00 AM</td><td>1</td><td>486</td><td>503</td></tr>\n",
       "\t<tr><td>8792009665</td><td>4/15/2016 12:00:00 AM</td><td>1</td><td>363</td><td>377</td></tr>\n",
       "\t<tr><td>8792009665</td><td>4/20/2016 12:00:00 AM</td><td>1</td><td>528</td><td>547</td></tr>\n",
       "\t<tr><td>8792009665</td><td>4/22/2016 12:00:00 AM</td><td>1</td><td>391</td><td>407</td></tr>\n",
       "\t<tr><td>8792009665</td><td>4/23/2016 12:00:00 AM</td><td>1</td><td>339</td><td>360</td></tr>\n",
       "\t<tr><td>8792009665</td><td>4/27/2016 12:00:00 AM</td><td>1</td><td>423</td><td>428</td></tr>\n",
       "\t<tr><td>8792009665</td><td>4/28/2016 12:00:00 AM</td><td>1</td><td>402</td><td>416</td></tr>\n",
       "\t<tr><td>8792009665</td><td>4/29/2016 12:00:00 AM</td><td>1</td><td>398</td><td>406</td></tr>\n",
       "\t<tr><td>8792009665</td><td>4/30/2016 12:00:00 AM</td><td>1</td><td>343</td><td>360</td></tr>\n",
       "\t<tr><td>8792009665</td><td>5/1/2016 12:00:00 AM </td><td>1</td><td>503</td><td>527</td></tr>\n",
       "\t<tr><td>8792009665</td><td>5/2/2016 12:00:00 AM </td><td>1</td><td>415</td><td>423</td></tr>\n",
       "\t<tr><td>8792009665</td><td>5/3/2016 12:00:00 AM </td><td>1</td><td>516</td><td>545</td></tr>\n",
       "\t<tr><td>8792009665</td><td>5/4/2016 12:00:00 AM </td><td>1</td><td>439</td><td>463</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A spec\\_tbl\\_df: 413 × 5\n",
       "\\begin{tabular}{lllll}\n",
       " id & sleep\\_day & total\\_sleep\\_records & total\\_minutes\\_asleep & total\\_time\\_in\\_bed\\\\\n",
       " <dbl> & <chr> & <dbl> & <dbl> & <dbl>\\\\\n",
       "\\hline\n",
       "\t 1503960366 & 4/12/2016 12:00:00 AM & 1 & 327 & 346\\\\\n",
       "\t 1503960366 & 4/13/2016 12:00:00 AM & 2 & 384 & 407\\\\\n",
       "\t 1503960366 & 4/15/2016 12:00:00 AM & 1 & 412 & 442\\\\\n",
       "\t 1503960366 & 4/16/2016 12:00:00 AM & 2 & 340 & 367\\\\\n",
       "\t 1503960366 & 4/17/2016 12:00:00 AM & 1 & 700 & 712\\\\\n",
       "\t 1503960366 & 4/19/2016 12:00:00 AM & 1 & 304 & 320\\\\\n",
       "\t 1503960366 & 4/20/2016 12:00:00 AM & 1 & 360 & 377\\\\\n",
       "\t 1503960366 & 4/21/2016 12:00:00 AM & 1 & 325 & 364\\\\\n",
       "\t 1503960366 & 4/23/2016 12:00:00 AM & 1 & 361 & 384\\\\\n",
       "\t 1503960366 & 4/24/2016 12:00:00 AM & 1 & 430 & 449\\\\\n",
       "\t 1503960366 & 4/25/2016 12:00:00 AM & 1 & 277 & 323\\\\\n",
       "\t 1503960366 & 4/26/2016 12:00:00 AM & 1 & 245 & 274\\\\\n",
       "\t 1503960366 & 4/28/2016 12:00:00 AM & 1 & 366 & 393\\\\\n",
       "\t 1503960366 & 4/29/2016 12:00:00 AM & 1 & 341 & 354\\\\\n",
       "\t 1503960366 & 4/30/2016 12:00:00 AM & 1 & 404 & 425\\\\\n",
       "\t 1503960366 & 5/1/2016 12:00:00 AM  & 1 & 369 & 396\\\\\n",
       "\t 1503960366 & 5/2/2016 12:00:00 AM  & 1 & 277 & 309\\\\\n",
       "\t 1503960366 & 5/3/2016 12:00:00 AM  & 1 & 273 & 296\\\\\n",
       "\t 1503960366 & 5/5/2016 12:00:00 AM  & 1 & 247 & 264\\\\\n",
       "\t 1503960366 & 5/6/2016 12:00:00 AM  & 1 & 334 & 367\\\\\n",
       "\t 1503960366 & 5/7/2016 12:00:00 AM  & 1 & 331 & 349\\\\\n",
       "\t 1503960366 & 5/8/2016 12:00:00 AM  & 1 & 594 & 611\\\\\n",
       "\t 1503960366 & 5/9/2016 12:00:00 AM  & 1 & 338 & 342\\\\\n",
       "\t 1503960366 & 5/10/2016 12:00:00 AM & 1 & 383 & 403\\\\\n",
       "\t 1503960366 & 5/11/2016 12:00:00 AM & 1 & 285 & 306\\\\\n",
       "\t 1644430081 & 4/29/2016 12:00:00 AM & 1 & 119 & 127\\\\\n",
       "\t 1644430081 & 4/30/2016 12:00:00 AM & 1 & 124 & 142\\\\\n",
       "\t 1644430081 & 5/2/2016 12:00:00 AM  & 1 & 796 & 961\\\\\n",
       "\t 1644430081 & 5/8/2016 12:00:00 AM  & 1 & 137 & 154\\\\\n",
       "\t 1844505072 & 4/15/2016 12:00:00 AM & 1 & 644 & 961\\\\\n",
       "\t ⋮ & ⋮ & ⋮ & ⋮ & ⋮\\\\\n",
       "\t 8378563200 & 4/28/2016 12:00:00 AM & 1 & 506 & 556\\\\\n",
       "\t 8378563200 & 4/29/2016 12:00:00 AM & 1 & 527 & 562\\\\\n",
       "\t 8378563200 & 4/30/2016 12:00:00 AM & 1 & 468 & 555\\\\\n",
       "\t 8378563200 & 5/1/2016 12:00:00 AM  & 1 & 475 & 539\\\\\n",
       "\t 8378563200 & 5/2/2016 12:00:00 AM  & 1 & 351 & 385\\\\\n",
       "\t 8378563200 & 5/3/2016 12:00:00 AM  & 1 & 405 & 429\\\\\n",
       "\t 8378563200 & 5/4/2016 12:00:00 AM  & 1 & 441 & 477\\\\\n",
       "\t 8378563200 & 5/5/2016 12:00:00 AM  & 1 & 381 & 417\\\\\n",
       "\t 8378563200 & 5/6/2016 12:00:00 AM  & 1 & 323 & 355\\\\\n",
       "\t 8378563200 & 5/7/2016 12:00:00 AM  & 2 & 459 & 513\\\\\n",
       "\t 8378563200 & 5/8/2016 12:00:00 AM  & 1 & 545 & 606\\\\\n",
       "\t 8378563200 & 5/9/2016 12:00:00 AM  & 1 & 359 & 399\\\\\n",
       "\t 8378563200 & 5/10/2016 12:00:00 AM & 1 & 342 & 391\\\\\n",
       "\t 8378563200 & 5/11/2016 12:00:00 AM & 1 & 368 & 387\\\\\n",
       "\t 8378563200 & 5/12/2016 12:00:00 AM & 1 & 496 & 546\\\\\n",
       "\t 8792009665 & 4/12/2016 12:00:00 AM & 1 & 458 & 493\\\\\n",
       "\t 8792009665 & 4/13/2016 12:00:00 AM & 1 & 531 & 552\\\\\n",
       "\t 8792009665 & 4/14/2016 12:00:00 AM & 1 & 486 & 503\\\\\n",
       "\t 8792009665 & 4/15/2016 12:00:00 AM & 1 & 363 & 377\\\\\n",
       "\t 8792009665 & 4/20/2016 12:00:00 AM & 1 & 528 & 547\\\\\n",
       "\t 8792009665 & 4/22/2016 12:00:00 AM & 1 & 391 & 407\\\\\n",
       "\t 8792009665 & 4/23/2016 12:00:00 AM & 1 & 339 & 360\\\\\n",
       "\t 8792009665 & 4/27/2016 12:00:00 AM & 1 & 423 & 428\\\\\n",
       "\t 8792009665 & 4/28/2016 12:00:00 AM & 1 & 402 & 416\\\\\n",
       "\t 8792009665 & 4/29/2016 12:00:00 AM & 1 & 398 & 406\\\\\n",
       "\t 8792009665 & 4/30/2016 12:00:00 AM & 1 & 343 & 360\\\\\n",
       "\t 8792009665 & 5/1/2016 12:00:00 AM  & 1 & 503 & 527\\\\\n",
       "\t 8792009665 & 5/2/2016 12:00:00 AM  & 1 & 415 & 423\\\\\n",
       "\t 8792009665 & 5/3/2016 12:00:00 AM  & 1 & 516 & 545\\\\\n",
       "\t 8792009665 & 5/4/2016 12:00:00 AM  & 1 & 439 & 463\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A spec_tbl_df: 413 × 5\n",
       "\n",
       "| id &lt;dbl&gt; | sleep_day &lt;chr&gt; | total_sleep_records &lt;dbl&gt; | total_minutes_asleep &lt;dbl&gt; | total_time_in_bed &lt;dbl&gt; |\n",
       "|---|---|---|---|---|\n",
       "| 1503960366 | 4/12/2016 12:00:00 AM | 1 | 327 | 346 |\n",
       "| 1503960366 | 4/13/2016 12:00:00 AM | 2 | 384 | 407 |\n",
       "| 1503960366 | 4/15/2016 12:00:00 AM | 1 | 412 | 442 |\n",
       "| 1503960366 | 4/16/2016 12:00:00 AM | 2 | 340 | 367 |\n",
       "| 1503960366 | 4/17/2016 12:00:00 AM | 1 | 700 | 712 |\n",
       "| 1503960366 | 4/19/2016 12:00:00 AM | 1 | 304 | 320 |\n",
       "| 1503960366 | 4/20/2016 12:00:00 AM | 1 | 360 | 377 |\n",
       "| 1503960366 | 4/21/2016 12:00:00 AM | 1 | 325 | 364 |\n",
       "| 1503960366 | 4/23/2016 12:00:00 AM | 1 | 361 | 384 |\n",
       "| 1503960366 | 4/24/2016 12:00:00 AM | 1 | 430 | 449 |\n",
       "| 1503960366 | 4/25/2016 12:00:00 AM | 1 | 277 | 323 |\n",
       "| 1503960366 | 4/26/2016 12:00:00 AM | 1 | 245 | 274 |\n",
       "| 1503960366 | 4/28/2016 12:00:00 AM | 1 | 366 | 393 |\n",
       "| 1503960366 | 4/29/2016 12:00:00 AM | 1 | 341 | 354 |\n",
       "| 1503960366 | 4/30/2016 12:00:00 AM | 1 | 404 | 425 |\n",
       "| 1503960366 | 5/1/2016 12:00:00 AM  | 1 | 369 | 396 |\n",
       "| 1503960366 | 5/2/2016 12:00:00 AM  | 1 | 277 | 309 |\n",
       "| 1503960366 | 5/3/2016 12:00:00 AM  | 1 | 273 | 296 |\n",
       "| 1503960366 | 5/5/2016 12:00:00 AM  | 1 | 247 | 264 |\n",
       "| 1503960366 | 5/6/2016 12:00:00 AM  | 1 | 334 | 367 |\n",
       "| 1503960366 | 5/7/2016 12:00:00 AM  | 1 | 331 | 349 |\n",
       "| 1503960366 | 5/8/2016 12:00:00 AM  | 1 | 594 | 611 |\n",
       "| 1503960366 | 5/9/2016 12:00:00 AM  | 1 | 338 | 342 |\n",
       "| 1503960366 | 5/10/2016 12:00:00 AM | 1 | 383 | 403 |\n",
       "| 1503960366 | 5/11/2016 12:00:00 AM | 1 | 285 | 306 |\n",
       "| 1644430081 | 4/29/2016 12:00:00 AM | 1 | 119 | 127 |\n",
       "| 1644430081 | 4/30/2016 12:00:00 AM | 1 | 124 | 142 |\n",
       "| 1644430081 | 5/2/2016 12:00:00 AM  | 1 | 796 | 961 |\n",
       "| 1644430081 | 5/8/2016 12:00:00 AM  | 1 | 137 | 154 |\n",
       "| 1844505072 | 4/15/2016 12:00:00 AM | 1 | 644 | 961 |\n",
       "| ⋮ | ⋮ | ⋮ | ⋮ | ⋮ |\n",
       "| 8378563200 | 4/28/2016 12:00:00 AM | 1 | 506 | 556 |\n",
       "| 8378563200 | 4/29/2016 12:00:00 AM | 1 | 527 | 562 |\n",
       "| 8378563200 | 4/30/2016 12:00:00 AM | 1 | 468 | 555 |\n",
       "| 8378563200 | 5/1/2016 12:00:00 AM  | 1 | 475 | 539 |\n",
       "| 8378563200 | 5/2/2016 12:00:00 AM  | 1 | 351 | 385 |\n",
       "| 8378563200 | 5/3/2016 12:00:00 AM  | 1 | 405 | 429 |\n",
       "| 8378563200 | 5/4/2016 12:00:00 AM  | 1 | 441 | 477 |\n",
       "| 8378563200 | 5/5/2016 12:00:00 AM  | 1 | 381 | 417 |\n",
       "| 8378563200 | 5/6/2016 12:00:00 AM  | 1 | 323 | 355 |\n",
       "| 8378563200 | 5/7/2016 12:00:00 AM  | 2 | 459 | 513 |\n",
       "| 8378563200 | 5/8/2016 12:00:00 AM  | 1 | 545 | 606 |\n",
       "| 8378563200 | 5/9/2016 12:00:00 AM  | 1 | 359 | 399 |\n",
       "| 8378563200 | 5/10/2016 12:00:00 AM | 1 | 342 | 391 |\n",
       "| 8378563200 | 5/11/2016 12:00:00 AM | 1 | 368 | 387 |\n",
       "| 8378563200 | 5/12/2016 12:00:00 AM | 1 | 496 | 546 |\n",
       "| 8792009665 | 4/12/2016 12:00:00 AM | 1 | 458 | 493 |\n",
       "| 8792009665 | 4/13/2016 12:00:00 AM | 1 | 531 | 552 |\n",
       "| 8792009665 | 4/14/2016 12:00:00 AM | 1 | 486 | 503 |\n",
       "| 8792009665 | 4/15/2016 12:00:00 AM | 1 | 363 | 377 |\n",
       "| 8792009665 | 4/20/2016 12:00:00 AM | 1 | 528 | 547 |\n",
       "| 8792009665 | 4/22/2016 12:00:00 AM | 1 | 391 | 407 |\n",
       "| 8792009665 | 4/23/2016 12:00:00 AM | 1 | 339 | 360 |\n",
       "| 8792009665 | 4/27/2016 12:00:00 AM | 1 | 423 | 428 |\n",
       "| 8792009665 | 4/28/2016 12:00:00 AM | 1 | 402 | 416 |\n",
       "| 8792009665 | 4/29/2016 12:00:00 AM | 1 | 398 | 406 |\n",
       "| 8792009665 | 4/30/2016 12:00:00 AM | 1 | 343 | 360 |\n",
       "| 8792009665 | 5/1/2016 12:00:00 AM  | 1 | 503 | 527 |\n",
       "| 8792009665 | 5/2/2016 12:00:00 AM  | 1 | 415 | 423 |\n",
       "| 8792009665 | 5/3/2016 12:00:00 AM  | 1 | 516 | 545 |\n",
       "| 8792009665 | 5/4/2016 12:00:00 AM  | 1 | 439 | 463 |\n",
       "\n"
      ],
      "text/plain": [
       "    id         sleep_day             total_sleep_records total_minutes_asleep\n",
       "1   1503960366 4/12/2016 12:00:00 AM 1                   327                 \n",
       "2   1503960366 4/13/2016 12:00:00 AM 2                   384                 \n",
       "3   1503960366 4/15/2016 12:00:00 AM 1                   412                 \n",
       "4   1503960366 4/16/2016 12:00:00 AM 2                   340                 \n",
       "5   1503960366 4/17/2016 12:00:00 AM 1                   700                 \n",
       "6   1503960366 4/19/2016 12:00:00 AM 1                   304                 \n",
       "7   1503960366 4/20/2016 12:00:00 AM 1                   360                 \n",
       "8   1503960366 4/21/2016 12:00:00 AM 1                   325                 \n",
       "9   1503960366 4/23/2016 12:00:00 AM 1                   361                 \n",
       "10  1503960366 4/24/2016 12:00:00 AM 1                   430                 \n",
       "11  1503960366 4/25/2016 12:00:00 AM 1                   277                 \n",
       "12  1503960366 4/26/2016 12:00:00 AM 1                   245                 \n",
       "13  1503960366 4/28/2016 12:00:00 AM 1                   366                 \n",
       "14  1503960366 4/29/2016 12:00:00 AM 1                   341                 \n",
       "15  1503960366 4/30/2016 12:00:00 AM 1                   404                 \n",
       "16  1503960366 5/1/2016 12:00:00 AM  1                   369                 \n",
       "17  1503960366 5/2/2016 12:00:00 AM  1                   277                 \n",
       "18  1503960366 5/3/2016 12:00:00 AM  1                   273                 \n",
       "19  1503960366 5/5/2016 12:00:00 AM  1                   247                 \n",
       "20  1503960366 5/6/2016 12:00:00 AM  1                   334                 \n",
       "21  1503960366 5/7/2016 12:00:00 AM  1                   331                 \n",
       "22  1503960366 5/8/2016 12:00:00 AM  1                   594                 \n",
       "23  1503960366 5/9/2016 12:00:00 AM  1                   338                 \n",
       "24  1503960366 5/10/2016 12:00:00 AM 1                   383                 \n",
       "25  1503960366 5/11/2016 12:00:00 AM 1                   285                 \n",
       "26  1644430081 4/29/2016 12:00:00 AM 1                   119                 \n",
       "27  1644430081 4/30/2016 12:00:00 AM 1                   124                 \n",
       "28  1644430081 5/2/2016 12:00:00 AM  1                   796                 \n",
       "29  1644430081 5/8/2016 12:00:00 AM  1                   137                 \n",
       "30  1844505072 4/15/2016 12:00:00 AM 1                   644                 \n",
       "⋮   ⋮          ⋮                     ⋮                   ⋮                   \n",
       "384 8378563200 4/28/2016 12:00:00 AM 1                   506                 \n",
       "385 8378563200 4/29/2016 12:00:00 AM 1                   527                 \n",
       "386 8378563200 4/30/2016 12:00:00 AM 1                   468                 \n",
       "387 8378563200 5/1/2016 12:00:00 AM  1                   475                 \n",
       "388 8378563200 5/2/2016 12:00:00 AM  1                   351                 \n",
       "389 8378563200 5/3/2016 12:00:00 AM  1                   405                 \n",
       "390 8378563200 5/4/2016 12:00:00 AM  1                   441                 \n",
       "391 8378563200 5/5/2016 12:00:00 AM  1                   381                 \n",
       "392 8378563200 5/6/2016 12:00:00 AM  1                   323                 \n",
       "393 8378563200 5/7/2016 12:00:00 AM  2                   459                 \n",
       "394 8378563200 5/8/2016 12:00:00 AM  1                   545                 \n",
       "395 8378563200 5/9/2016 12:00:00 AM  1                   359                 \n",
       "396 8378563200 5/10/2016 12:00:00 AM 1                   342                 \n",
       "397 8378563200 5/11/2016 12:00:00 AM 1                   368                 \n",
       "398 8378563200 5/12/2016 12:00:00 AM 1                   496                 \n",
       "399 8792009665 4/12/2016 12:00:00 AM 1                   458                 \n",
       "400 8792009665 4/13/2016 12:00:00 AM 1                   531                 \n",
       "401 8792009665 4/14/2016 12:00:00 AM 1                   486                 \n",
       "402 8792009665 4/15/2016 12:00:00 AM 1                   363                 \n",
       "403 8792009665 4/20/2016 12:00:00 AM 1                   528                 \n",
       "404 8792009665 4/22/2016 12:00:00 AM 1                   391                 \n",
       "405 8792009665 4/23/2016 12:00:00 AM 1                   339                 \n",
       "406 8792009665 4/27/2016 12:00:00 AM 1                   423                 \n",
       "407 8792009665 4/28/2016 12:00:00 AM 1                   402                 \n",
       "408 8792009665 4/29/2016 12:00:00 AM 1                   398                 \n",
       "409 8792009665 4/30/2016 12:00:00 AM 1                   343                 \n",
       "410 8792009665 5/1/2016 12:00:00 AM  1                   503                 \n",
       "411 8792009665 5/2/2016 12:00:00 AM  1                   415                 \n",
       "412 8792009665 5/3/2016 12:00:00 AM  1                   516                 \n",
       "413 8792009665 5/4/2016 12:00:00 AM  1                   439                 \n",
       "    total_time_in_bed\n",
       "1   346              \n",
       "2   407              \n",
       "3   442              \n",
       "4   367              \n",
       "5   712              \n",
       "6   320              \n",
       "7   377              \n",
       "8   364              \n",
       "9   384              \n",
       "10  449              \n",
       "11  323              \n",
       "12  274              \n",
       "13  393              \n",
       "14  354              \n",
       "15  425              \n",
       "16  396              \n",
       "17  309              \n",
       "18  296              \n",
       "19  264              \n",
       "20  367              \n",
       "21  349              \n",
       "22  611              \n",
       "23  342              \n",
       "24  403              \n",
       "25  306              \n",
       "26  127              \n",
       "27  142              \n",
       "28  961              \n",
       "29  154              \n",
       "30  961              \n",
       "⋮   ⋮                \n",
       "384 556              \n",
       "385 562              \n",
       "386 555              \n",
       "387 539              \n",
       "388 385              \n",
       "389 429              \n",
       "390 477              \n",
       "391 417              \n",
       "392 355              \n",
       "393 513              \n",
       "394 606              \n",
       "395 399              \n",
       "396 391              \n",
       "397 387              \n",
       "398 546              \n",
       "399 493              \n",
       "400 552              \n",
       "401 503              \n",
       "402 377              \n",
       "403 547              \n",
       "404 407              \n",
       "405 360              \n",
       "406 428              \n",
       "407 416              \n",
       "408 406              \n",
       "409 360              \n",
       "410 527              \n",
       "411 423              \n",
       "412 545              \n",
       "413 463              "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    },
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A spec_tbl_df: 22099 × 3</caption>\n",
       "<thead>\n",
       "\t<tr><th scope=col>id</th><th scope=col>activity_hour</th><th scope=col>step_total</th></tr>\n",
       "\t<tr><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;dbl&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><td>1503960366</td><td>4/12/2016 12:00:00 AM</td><td> 373</td></tr>\n",
       "\t<tr><td>1503960366</td><td>4/12/2016 1:00:00 AM </td><td> 160</td></tr>\n",
       "\t<tr><td>1503960366</td><td>4/12/2016 2:00:00 AM </td><td> 151</td></tr>\n",
       "\t<tr><td>1503960366</td><td>4/12/2016 3:00:00 AM </td><td>   0</td></tr>\n",
       "\t<tr><td>1503960366</td><td>4/12/2016 4:00:00 AM </td><td>   0</td></tr>\n",
       "\t<tr><td>1503960366</td><td>4/12/2016 5:00:00 AM </td><td>   0</td></tr>\n",
       "\t<tr><td>1503960366</td><td>4/12/2016 6:00:00 AM </td><td>   0</td></tr>\n",
       "\t<tr><td>1503960366</td><td>4/12/2016 7:00:00 AM </td><td>   0</td></tr>\n",
       "\t<tr><td>1503960366</td><td>4/12/2016 8:00:00 AM </td><td> 250</td></tr>\n",
       "\t<tr><td>1503960366</td><td>4/12/2016 9:00:00 AM </td><td>1864</td></tr>\n",
       "\t<tr><td>1503960366</td><td>4/12/2016 10:00:00 AM</td><td> 676</td></tr>\n",
       "\t<tr><td>1503960366</td><td>4/12/2016 11:00:00 AM</td><td> 360</td></tr>\n",
       "\t<tr><td>1503960366</td><td>4/12/2016 12:00:00 PM</td><td> 253</td></tr>\n",
       "\t<tr><td>1503960366</td><td>4/12/2016 1:00:00 PM </td><td> 221</td></tr>\n",
       "\t<tr><td>1503960366</td><td>4/12/2016 2:00:00 PM </td><td>1166</td></tr>\n",
       "\t<tr><td>1503960366</td><td>4/12/2016 3:00:00 PM </td><td>2063</td></tr>\n",
       "\t<tr><td>1503960366</td><td>4/12/2016 4:00:00 PM </td><td> 344</td></tr>\n",
       "\t<tr><td>1503960366</td><td>4/12/2016 5:00:00 PM </td><td> 489</td></tr>\n",
       "\t<tr><td>1503960366</td><td>4/12/2016 6:00:00 PM </td><td>1386</td></tr>\n",
       "\t<tr><td>1503960366</td><td>4/12/2016 7:00:00 PM </td><td> 558</td></tr>\n",
       "\t<tr><td>1503960366</td><td>4/12/2016 8:00:00 PM </td><td>1733</td></tr>\n",
       "\t<tr><td>1503960366</td><td>4/12/2016 9:00:00 PM </td><td> 684</td></tr>\n",
       "\t<tr><td>1503960366</td><td>4/12/2016 10:00:00 PM</td><td>  89</td></tr>\n",
       "\t<tr><td>1503960366</td><td>4/12/2016 11:00:00 PM</td><td> 338</td></tr>\n",
       "\t<tr><td>1503960366</td><td>4/13/2016 12:00:00 AM</td><td> 144</td></tr>\n",
       "\t<tr><td>1503960366</td><td>4/13/2016 1:00:00 AM </td><td>   0</td></tr>\n",
       "\t<tr><td>1503960366</td><td>4/13/2016 2:00:00 AM </td><td>   0</td></tr>\n",
       "\t<tr><td>1503960366</td><td>4/13/2016 3:00:00 AM </td><td>  36</td></tr>\n",
       "\t<tr><td>1503960366</td><td>4/13/2016 4:00:00 AM </td><td>   0</td></tr>\n",
       "\t<tr><td>1503960366</td><td>4/13/2016 5:00:00 AM </td><td>   0</td></tr>\n",
       "\t<tr><td>⋮</td><td>⋮</td><td>⋮</td></tr>\n",
       "\t<tr><td>8877689391</td><td>5/11/2016 9:00:00 AM </td><td> 338</td></tr>\n",
       "\t<tr><td>8877689391</td><td>5/11/2016 10:00:00 AM</td><td> 295</td></tr>\n",
       "\t<tr><td>8877689391</td><td>5/11/2016 11:00:00 AM</td><td> 974</td></tr>\n",
       "\t<tr><td>8877689391</td><td>5/11/2016 12:00:00 PM</td><td>3929</td></tr>\n",
       "\t<tr><td>8877689391</td><td>5/11/2016 1:00:00 PM </td><td> 481</td></tr>\n",
       "\t<tr><td>8877689391</td><td>5/11/2016 2:00:00 PM </td><td>  37</td></tr>\n",
       "\t<tr><td>8877689391</td><td>5/11/2016 3:00:00 PM </td><td> 416</td></tr>\n",
       "\t<tr><td>8877689391</td><td>5/11/2016 4:00:00 PM </td><td>2869</td></tr>\n",
       "\t<tr><td>8877689391</td><td>5/11/2016 5:00:00 PM </td><td>8357</td></tr>\n",
       "\t<tr><td>8877689391</td><td>5/11/2016 6:00:00 PM </td><td> 920</td></tr>\n",
       "\t<tr><td>8877689391</td><td>5/11/2016 7:00:00 PM </td><td> 408</td></tr>\n",
       "\t<tr><td>8877689391</td><td>5/11/2016 8:00:00 PM </td><td> 633</td></tr>\n",
       "\t<tr><td>8877689391</td><td>5/11/2016 9:00:00 PM </td><td> 228</td></tr>\n",
       "\t<tr><td>8877689391</td><td>5/11/2016 10:00:00 PM</td><td> 109</td></tr>\n",
       "\t<tr><td>8877689391</td><td>5/11/2016 11:00:00 PM</td><td>   0</td></tr>\n",
       "\t<tr><td>8877689391</td><td>5/12/2016 12:00:00 AM</td><td>   0</td></tr>\n",
       "\t<tr><td>8877689391</td><td>5/12/2016 1:00:00 AM </td><td>   0</td></tr>\n",
       "\t<tr><td>8877689391</td><td>5/12/2016 2:00:00 AM </td><td>   0</td></tr>\n",
       "\t<tr><td>8877689391</td><td>5/12/2016 3:00:00 AM </td><td>   0</td></tr>\n",
       "\t<tr><td>8877689391</td><td>5/12/2016 4:00:00 AM </td><td>   0</td></tr>\n",
       "\t<tr><td>8877689391</td><td>5/12/2016 5:00:00 AM </td><td>   0</td></tr>\n",
       "\t<tr><td>8877689391</td><td>5/12/2016 6:00:00 AM </td><td> 254</td></tr>\n",
       "\t<tr><td>8877689391</td><td>5/12/2016 7:00:00 AM </td><td> 574</td></tr>\n",
       "\t<tr><td>8877689391</td><td>5/12/2016 8:00:00 AM </td><td> 765</td></tr>\n",
       "\t<tr><td>8877689391</td><td>5/12/2016 9:00:00 AM </td><td> 164</td></tr>\n",
       "\t<tr><td>8877689391</td><td>5/12/2016 10:00:00 AM</td><td> 514</td></tr>\n",
       "\t<tr><td>8877689391</td><td>5/12/2016 11:00:00 AM</td><td>1407</td></tr>\n",
       "\t<tr><td>8877689391</td><td>5/12/2016 12:00:00 PM</td><td>3135</td></tr>\n",
       "\t<tr><td>8877689391</td><td>5/12/2016 1:00:00 PM </td><td> 307</td></tr>\n",
       "\t<tr><td>8877689391</td><td>5/12/2016 2:00:00 PM </td><td> 457</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A spec\\_tbl\\_df: 22099 × 3\n",
       "\\begin{tabular}{lll}\n",
       " id & activity\\_hour & step\\_total\\\\\n",
       " <dbl> & <chr> & <dbl>\\\\\n",
       "\\hline\n",
       "\t 1503960366 & 4/12/2016 12:00:00 AM &  373\\\\\n",
       "\t 1503960366 & 4/12/2016 1:00:00 AM  &  160\\\\\n",
       "\t 1503960366 & 4/12/2016 2:00:00 AM  &  151\\\\\n",
       "\t 1503960366 & 4/12/2016 3:00:00 AM  &    0\\\\\n",
       "\t 1503960366 & 4/12/2016 4:00:00 AM  &    0\\\\\n",
       "\t 1503960366 & 4/12/2016 5:00:00 AM  &    0\\\\\n",
       "\t 1503960366 & 4/12/2016 6:00:00 AM  &    0\\\\\n",
       "\t 1503960366 & 4/12/2016 7:00:00 AM  &    0\\\\\n",
       "\t 1503960366 & 4/12/2016 8:00:00 AM  &  250\\\\\n",
       "\t 1503960366 & 4/12/2016 9:00:00 AM  & 1864\\\\\n",
       "\t 1503960366 & 4/12/2016 10:00:00 AM &  676\\\\\n",
       "\t 1503960366 & 4/12/2016 11:00:00 AM &  360\\\\\n",
       "\t 1503960366 & 4/12/2016 12:00:00 PM &  253\\\\\n",
       "\t 1503960366 & 4/12/2016 1:00:00 PM  &  221\\\\\n",
       "\t 1503960366 & 4/12/2016 2:00:00 PM  & 1166\\\\\n",
       "\t 1503960366 & 4/12/2016 3:00:00 PM  & 2063\\\\\n",
       "\t 1503960366 & 4/12/2016 4:00:00 PM  &  344\\\\\n",
       "\t 1503960366 & 4/12/2016 5:00:00 PM  &  489\\\\\n",
       "\t 1503960366 & 4/12/2016 6:00:00 PM  & 1386\\\\\n",
       "\t 1503960366 & 4/12/2016 7:00:00 PM  &  558\\\\\n",
       "\t 1503960366 & 4/12/2016 8:00:00 PM  & 1733\\\\\n",
       "\t 1503960366 & 4/12/2016 9:00:00 PM  &  684\\\\\n",
       "\t 1503960366 & 4/12/2016 10:00:00 PM &   89\\\\\n",
       "\t 1503960366 & 4/12/2016 11:00:00 PM &  338\\\\\n",
       "\t 1503960366 & 4/13/2016 12:00:00 AM &  144\\\\\n",
       "\t 1503960366 & 4/13/2016 1:00:00 AM  &    0\\\\\n",
       "\t 1503960366 & 4/13/2016 2:00:00 AM  &    0\\\\\n",
       "\t 1503960366 & 4/13/2016 3:00:00 AM  &   36\\\\\n",
       "\t 1503960366 & 4/13/2016 4:00:00 AM  &    0\\\\\n",
       "\t 1503960366 & 4/13/2016 5:00:00 AM  &    0\\\\\n",
       "\t ⋮ & ⋮ & ⋮\\\\\n",
       "\t 8877689391 & 5/11/2016 9:00:00 AM  &  338\\\\\n",
       "\t 8877689391 & 5/11/2016 10:00:00 AM &  295\\\\\n",
       "\t 8877689391 & 5/11/2016 11:00:00 AM &  974\\\\\n",
       "\t 8877689391 & 5/11/2016 12:00:00 PM & 3929\\\\\n",
       "\t 8877689391 & 5/11/2016 1:00:00 PM  &  481\\\\\n",
       "\t 8877689391 & 5/11/2016 2:00:00 PM  &   37\\\\\n",
       "\t 8877689391 & 5/11/2016 3:00:00 PM  &  416\\\\\n",
       "\t 8877689391 & 5/11/2016 4:00:00 PM  & 2869\\\\\n",
       "\t 8877689391 & 5/11/2016 5:00:00 PM  & 8357\\\\\n",
       "\t 8877689391 & 5/11/2016 6:00:00 PM  &  920\\\\\n",
       "\t 8877689391 & 5/11/2016 7:00:00 PM  &  408\\\\\n",
       "\t 8877689391 & 5/11/2016 8:00:00 PM  &  633\\\\\n",
       "\t 8877689391 & 5/11/2016 9:00:00 PM  &  228\\\\\n",
       "\t 8877689391 & 5/11/2016 10:00:00 PM &  109\\\\\n",
       "\t 8877689391 & 5/11/2016 11:00:00 PM &    0\\\\\n",
       "\t 8877689391 & 5/12/2016 12:00:00 AM &    0\\\\\n",
       "\t 8877689391 & 5/12/2016 1:00:00 AM  &    0\\\\\n",
       "\t 8877689391 & 5/12/2016 2:00:00 AM  &    0\\\\\n",
       "\t 8877689391 & 5/12/2016 3:00:00 AM  &    0\\\\\n",
       "\t 8877689391 & 5/12/2016 4:00:00 AM  &    0\\\\\n",
       "\t 8877689391 & 5/12/2016 5:00:00 AM  &    0\\\\\n",
       "\t 8877689391 & 5/12/2016 6:00:00 AM  &  254\\\\\n",
       "\t 8877689391 & 5/12/2016 7:00:00 AM  &  574\\\\\n",
       "\t 8877689391 & 5/12/2016 8:00:00 AM  &  765\\\\\n",
       "\t 8877689391 & 5/12/2016 9:00:00 AM  &  164\\\\\n",
       "\t 8877689391 & 5/12/2016 10:00:00 AM &  514\\\\\n",
       "\t 8877689391 & 5/12/2016 11:00:00 AM & 1407\\\\\n",
       "\t 8877689391 & 5/12/2016 12:00:00 PM & 3135\\\\\n",
       "\t 8877689391 & 5/12/2016 1:00:00 PM  &  307\\\\\n",
       "\t 8877689391 & 5/12/2016 2:00:00 PM  &  457\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A spec_tbl_df: 22099 × 3\n",
       "\n",
       "| id &lt;dbl&gt; | activity_hour &lt;chr&gt; | step_total &lt;dbl&gt; |\n",
       "|---|---|---|\n",
       "| 1503960366 | 4/12/2016 12:00:00 AM |  373 |\n",
       "| 1503960366 | 4/12/2016 1:00:00 AM  |  160 |\n",
       "| 1503960366 | 4/12/2016 2:00:00 AM  |  151 |\n",
       "| 1503960366 | 4/12/2016 3:00:00 AM  |    0 |\n",
       "| 1503960366 | 4/12/2016 4:00:00 AM  |    0 |\n",
       "| 1503960366 | 4/12/2016 5:00:00 AM  |    0 |\n",
       "| 1503960366 | 4/12/2016 6:00:00 AM  |    0 |\n",
       "| 1503960366 | 4/12/2016 7:00:00 AM  |    0 |\n",
       "| 1503960366 | 4/12/2016 8:00:00 AM  |  250 |\n",
       "| 1503960366 | 4/12/2016 9:00:00 AM  | 1864 |\n",
       "| 1503960366 | 4/12/2016 10:00:00 AM |  676 |\n",
       "| 1503960366 | 4/12/2016 11:00:00 AM |  360 |\n",
       "| 1503960366 | 4/12/2016 12:00:00 PM |  253 |\n",
       "| 1503960366 | 4/12/2016 1:00:00 PM  |  221 |\n",
       "| 1503960366 | 4/12/2016 2:00:00 PM  | 1166 |\n",
       "| 1503960366 | 4/12/2016 3:00:00 PM  | 2063 |\n",
       "| 1503960366 | 4/12/2016 4:00:00 PM  |  344 |\n",
       "| 1503960366 | 4/12/2016 5:00:00 PM  |  489 |\n",
       "| 1503960366 | 4/12/2016 6:00:00 PM  | 1386 |\n",
       "| 1503960366 | 4/12/2016 7:00:00 PM  |  558 |\n",
       "| 1503960366 | 4/12/2016 8:00:00 PM  | 1733 |\n",
       "| 1503960366 | 4/12/2016 9:00:00 PM  |  684 |\n",
       "| 1503960366 | 4/12/2016 10:00:00 PM |   89 |\n",
       "| 1503960366 | 4/12/2016 11:00:00 PM |  338 |\n",
       "| 1503960366 | 4/13/2016 12:00:00 AM |  144 |\n",
       "| 1503960366 | 4/13/2016 1:00:00 AM  |    0 |\n",
       "| 1503960366 | 4/13/2016 2:00:00 AM  |    0 |\n",
       "| 1503960366 | 4/13/2016 3:00:00 AM  |   36 |\n",
       "| 1503960366 | 4/13/2016 4:00:00 AM  |    0 |\n",
       "| 1503960366 | 4/13/2016 5:00:00 AM  |    0 |\n",
       "| ⋮ | ⋮ | ⋮ |\n",
       "| 8877689391 | 5/11/2016 9:00:00 AM  |  338 |\n",
       "| 8877689391 | 5/11/2016 10:00:00 AM |  295 |\n",
       "| 8877689391 | 5/11/2016 11:00:00 AM |  974 |\n",
       "| 8877689391 | 5/11/2016 12:00:00 PM | 3929 |\n",
       "| 8877689391 | 5/11/2016 1:00:00 PM  |  481 |\n",
       "| 8877689391 | 5/11/2016 2:00:00 PM  |   37 |\n",
       "| 8877689391 | 5/11/2016 3:00:00 PM  |  416 |\n",
       "| 8877689391 | 5/11/2016 4:00:00 PM  | 2869 |\n",
       "| 8877689391 | 5/11/2016 5:00:00 PM  | 8357 |\n",
       "| 8877689391 | 5/11/2016 6:00:00 PM  |  920 |\n",
       "| 8877689391 | 5/11/2016 7:00:00 PM  |  408 |\n",
       "| 8877689391 | 5/11/2016 8:00:00 PM  |  633 |\n",
       "| 8877689391 | 5/11/2016 9:00:00 PM  |  228 |\n",
       "| 8877689391 | 5/11/2016 10:00:00 PM |  109 |\n",
       "| 8877689391 | 5/11/2016 11:00:00 PM |    0 |\n",
       "| 8877689391 | 5/12/2016 12:00:00 AM |    0 |\n",
       "| 8877689391 | 5/12/2016 1:00:00 AM  |    0 |\n",
       "| 8877689391 | 5/12/2016 2:00:00 AM  |    0 |\n",
       "| 8877689391 | 5/12/2016 3:00:00 AM  |    0 |\n",
       "| 8877689391 | 5/12/2016 4:00:00 AM  |    0 |\n",
       "| 8877689391 | 5/12/2016 5:00:00 AM  |    0 |\n",
       "| 8877689391 | 5/12/2016 6:00:00 AM  |  254 |\n",
       "| 8877689391 | 5/12/2016 7:00:00 AM  |  574 |\n",
       "| 8877689391 | 5/12/2016 8:00:00 AM  |  765 |\n",
       "| 8877689391 | 5/12/2016 9:00:00 AM  |  164 |\n",
       "| 8877689391 | 5/12/2016 10:00:00 AM |  514 |\n",
       "| 8877689391 | 5/12/2016 11:00:00 AM | 1407 |\n",
       "| 8877689391 | 5/12/2016 12:00:00 PM | 3135 |\n",
       "| 8877689391 | 5/12/2016 1:00:00 PM  |  307 |\n",
       "| 8877689391 | 5/12/2016 2:00:00 PM  |  457 |\n",
       "\n"
      ],
      "text/plain": [
       "      id         activity_hour         step_total\n",
       "1     1503960366 4/12/2016 12:00:00 AM  373      \n",
       "2     1503960366 4/12/2016 1:00:00 AM   160      \n",
       "3     1503960366 4/12/2016 2:00:00 AM   151      \n",
       "4     1503960366 4/12/2016 3:00:00 AM     0      \n",
       "5     1503960366 4/12/2016 4:00:00 AM     0      \n",
       "6     1503960366 4/12/2016 5:00:00 AM     0      \n",
       "7     1503960366 4/12/2016 6:00:00 AM     0      \n",
       "8     1503960366 4/12/2016 7:00:00 AM     0      \n",
       "9     1503960366 4/12/2016 8:00:00 AM   250      \n",
       "10    1503960366 4/12/2016 9:00:00 AM  1864      \n",
       "11    1503960366 4/12/2016 10:00:00 AM  676      \n",
       "12    1503960366 4/12/2016 11:00:00 AM  360      \n",
       "13    1503960366 4/12/2016 12:00:00 PM  253      \n",
       "14    1503960366 4/12/2016 1:00:00 PM   221      \n",
       "15    1503960366 4/12/2016 2:00:00 PM  1166      \n",
       "16    1503960366 4/12/2016 3:00:00 PM  2063      \n",
       "17    1503960366 4/12/2016 4:00:00 PM   344      \n",
       "18    1503960366 4/12/2016 5:00:00 PM   489      \n",
       "19    1503960366 4/12/2016 6:00:00 PM  1386      \n",
       "20    1503960366 4/12/2016 7:00:00 PM   558      \n",
       "21    1503960366 4/12/2016 8:00:00 PM  1733      \n",
       "22    1503960366 4/12/2016 9:00:00 PM   684      \n",
       "23    1503960366 4/12/2016 10:00:00 PM   89      \n",
       "24    1503960366 4/12/2016 11:00:00 PM  338      \n",
       "25    1503960366 4/13/2016 12:00:00 AM  144      \n",
       "26    1503960366 4/13/2016 1:00:00 AM     0      \n",
       "27    1503960366 4/13/2016 2:00:00 AM     0      \n",
       "28    1503960366 4/13/2016 3:00:00 AM    36      \n",
       "29    1503960366 4/13/2016 4:00:00 AM     0      \n",
       "30    1503960366 4/13/2016 5:00:00 AM     0      \n",
       "⋮     ⋮          ⋮                     ⋮         \n",
       "22070 8877689391 5/11/2016 9:00:00 AM   338      \n",
       "22071 8877689391 5/11/2016 10:00:00 AM  295      \n",
       "22072 8877689391 5/11/2016 11:00:00 AM  974      \n",
       "22073 8877689391 5/11/2016 12:00:00 PM 3929      \n",
       "22074 8877689391 5/11/2016 1:00:00 PM   481      \n",
       "22075 8877689391 5/11/2016 2:00:00 PM    37      \n",
       "22076 8877689391 5/11/2016 3:00:00 PM   416      \n",
       "22077 8877689391 5/11/2016 4:00:00 PM  2869      \n",
       "22078 8877689391 5/11/2016 5:00:00 PM  8357      \n",
       "22079 8877689391 5/11/2016 6:00:00 PM   920      \n",
       "22080 8877689391 5/11/2016 7:00:00 PM   408      \n",
       "22081 8877689391 5/11/2016 8:00:00 PM   633      \n",
       "22082 8877689391 5/11/2016 9:00:00 PM   228      \n",
       "22083 8877689391 5/11/2016 10:00:00 PM  109      \n",
       "22084 8877689391 5/11/2016 11:00:00 PM    0      \n",
       "22085 8877689391 5/12/2016 12:00:00 AM    0      \n",
       "22086 8877689391 5/12/2016 1:00:00 AM     0      \n",
       "22087 8877689391 5/12/2016 2:00:00 AM     0      \n",
       "22088 8877689391 5/12/2016 3:00:00 AM     0      \n",
       "22089 8877689391 5/12/2016 4:00:00 AM     0      \n",
       "22090 8877689391 5/12/2016 5:00:00 AM     0      \n",
       "22091 8877689391 5/12/2016 6:00:00 AM   254      \n",
       "22092 8877689391 5/12/2016 7:00:00 AM   574      \n",
       "22093 8877689391 5/12/2016 8:00:00 AM   765      \n",
       "22094 8877689391 5/12/2016 9:00:00 AM   164      \n",
       "22095 8877689391 5/12/2016 10:00:00 AM  514      \n",
       "22096 8877689391 5/12/2016 11:00:00 AM 1407      \n",
       "22097 8877689391 5/12/2016 12:00:00 PM 3135      \n",
       "22098 8877689391 5/12/2016 1:00:00 PM   307      \n",
       "22099 8877689391 5/12/2016 2:00:00 PM   457      "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "clean_names(daily_activities)\n",
    "daily_activities<- rename_with(daily_activities, tolower)\n",
    "clean_names(sleeps_daily)\n",
    "sleeps_daily <- rename_with(sleeps_daily, tolower)\n",
    "clean_names(steps_hourly)\n",
    "steps_hourly <- rename_with(steps_hourly, tolower)"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "3f679ef9",
   "metadata": {
    "papermill": {
     "duration": 0.015353,
     "end_time": "2022-09-24T15:15:41.843397",
     "exception": false,
     "start_time": "2022-09-24T15:15:41.828044",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "> Quck check to ensure the *column names* are all lower case"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 5,
   "id": "767e2884",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-09-24T15:15:41.876518Z",
     "iopub.status.busy": "2022-09-24T15:15:41.874768Z",
     "iopub.status.idle": "2022-09-24T15:15:41.906360Z",
     "shell.execute_reply": "2022-09-24T15:15:41.904479Z"
    },
    "papermill": {
     "duration": 0.050844,
     "end_time": "2022-09-24T15:15:41.908769",
     "exception": false,
     "start_time": "2022-09-24T15:15:41.857925",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "<style>\n",
       ".list-inline {list-style: none; margin:0; padding: 0}\n",
       ".list-inline>li {display: inline-block}\n",
       ".list-inline>li:not(:last-child)::after {content: \"\\00b7\"; padding: 0 .5ex}\n",
       "</style>\n",
       "<ol class=list-inline><li>'id'</li><li>'activitydate'</li><li>'totalsteps'</li><li>'totaldistance'</li><li>'trackerdistance'</li><li>'loggedactivitiesdistance'</li><li>'veryactivedistance'</li><li>'moderatelyactivedistance'</li><li>'lightactivedistance'</li><li>'sedentaryactivedistance'</li><li>'veryactiveminutes'</li><li>'fairlyactiveminutes'</li><li>'lightlyactiveminutes'</li><li>'sedentaryminutes'</li><li>'calories'</li></ol>\n"
      ],
      "text/latex": [
       "\\begin{enumerate*}\n",
       "\\item 'id'\n",
       "\\item 'activitydate'\n",
       "\\item 'totalsteps'\n",
       "\\item 'totaldistance'\n",
       "\\item 'trackerdistance'\n",
       "\\item 'loggedactivitiesdistance'\n",
       "\\item 'veryactivedistance'\n",
       "\\item 'moderatelyactivedistance'\n",
       "\\item 'lightactivedistance'\n",
       "\\item 'sedentaryactivedistance'\n",
       "\\item 'veryactiveminutes'\n",
       "\\item 'fairlyactiveminutes'\n",
       "\\item 'lightlyactiveminutes'\n",
       "\\item 'sedentaryminutes'\n",
       "\\item 'calories'\n",
       "\\end{enumerate*}\n"
      ],
      "text/markdown": [
       "1. 'id'\n",
       "2. 'activitydate'\n",
       "3. 'totalsteps'\n",
       "4. 'totaldistance'\n",
       "5. 'trackerdistance'\n",
       "6. 'loggedactivitiesdistance'\n",
       "7. 'veryactivedistance'\n",
       "8. 'moderatelyactivedistance'\n",
       "9. 'lightactivedistance'\n",
       "10. 'sedentaryactivedistance'\n",
       "11. 'veryactiveminutes'\n",
       "12. 'fairlyactiveminutes'\n",
       "13. 'lightlyactiveminutes'\n",
       "14. 'sedentaryminutes'\n",
       "15. 'calories'\n",
       "\n",
       "\n"
      ],
      "text/plain": [
       " [1] \"id\"                       \"activitydate\"            \n",
       " [3] \"totalsteps\"               \"totaldistance\"           \n",
       " [5] \"trackerdistance\"          \"loggedactivitiesdistance\"\n",
       " [7] \"veryactivedistance\"       \"moderatelyactivedistance\"\n",
       " [9] \"lightactivedistance\"      \"sedentaryactivedistance\" \n",
       "[11] \"veryactiveminutes\"        \"fairlyactiveminutes\"     \n",
       "[13] \"lightlyactiveminutes\"     \"sedentaryminutes\"        \n",
       "[15] \"calories\"                "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    },
    {
     "data": {
      "text/html": [
       "<style>\n",
       ".list-inline {list-style: none; margin:0; padding: 0}\n",
       ".list-inline>li {display: inline-block}\n",
       ".list-inline>li:not(:last-child)::after {content: \"\\00b7\"; padding: 0 .5ex}\n",
       "</style>\n",
       "<ol class=list-inline><li>'id'</li><li>'sleepday'</li><li>'totalsleeprecords'</li><li>'totalminutesasleep'</li><li>'totaltimeinbed'</li></ol>\n"
      ],
      "text/latex": [
       "\\begin{enumerate*}\n",
       "\\item 'id'\n",
       "\\item 'sleepday'\n",
       "\\item 'totalsleeprecords'\n",
       "\\item 'totalminutesasleep'\n",
       "\\item 'totaltimeinbed'\n",
       "\\end{enumerate*}\n"
      ],
      "text/markdown": [
       "1. 'id'\n",
       "2. 'sleepday'\n",
       "3. 'totalsleeprecords'\n",
       "4. 'totalminutesasleep'\n",
       "5. 'totaltimeinbed'\n",
       "\n",
       "\n"
      ],
      "text/plain": [
       "[1] \"id\"                 \"sleepday\"           \"totalsleeprecords\" \n",
       "[4] \"totalminutesasleep\" \"totaltimeinbed\"    "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    },
    {
     "data": {
      "text/html": [
       "<style>\n",
       ".list-inline {list-style: none; margin:0; padding: 0}\n",
       ".list-inline>li {display: inline-block}\n",
       ".list-inline>li:not(:last-child)::after {content: \"\\00b7\"; padding: 0 .5ex}\n",
       "</style>\n",
       "<ol class=list-inline><li>'id'</li><li>'activityhour'</li><li>'steptotal'</li></ol>\n"
      ],
      "text/latex": [
       "\\begin{enumerate*}\n",
       "\\item 'id'\n",
       "\\item 'activityhour'\n",
       "\\item 'steptotal'\n",
       "\\end{enumerate*}\n"
      ],
      "text/markdown": [
       "1. 'id'\n",
       "2. 'activityhour'\n",
       "3. 'steptotal'\n",
       "\n",
       "\n"
      ],
      "text/plain": [
       "[1] \"id\"           \"activityhour\" \"steptotal\"   "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "colnames(daily_activities)\n",
    "colnames(sleeps_daily)\n",
    "colnames(steps_hourly)"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "3bd68772",
   "metadata": {
    "papermill": {
     "duration": 0.015324,
     "end_time": "2022-09-24T15:15:41.939404",
     "exception": false,
     "start_time": "2022-09-24T15:15:41.924080",
     "status": "completed"
    },
    "tags": []
   },
   "source": []
  },
  {
   "cell_type": "code",
   "execution_count": 6,
   "id": "eeb7b5cc",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-09-24T15:15:41.974273Z",
     "iopub.status.busy": "2022-09-24T15:15:41.972597Z",
     "iopub.status.idle": "2022-09-24T15:15:42.004926Z",
     "shell.execute_reply": "2022-09-24T15:15:42.003087Z"
    },
    "papermill": {
     "duration": 0.052698,
     "end_time": "2022-09-24T15:15:42.007289",
     "exception": false,
     "start_time": "2022-09-24T15:15:41.954591",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "<style>\n",
       ".dl-inline {width: auto; margin:0; padding: 0}\n",
       ".dl-inline>dt, .dl-inline>dd {float: none; width: auto; display: inline-block}\n",
       ".dl-inline>dt::after {content: \":\\0020\"; padding-right: .5ex}\n",
       ".dl-inline>dt:not(:first-of-type) {padding-left: .5ex}\n",
       "</style><dl class=dl-inline><dt>id</dt><dd>0</dd><dt>activitydate</dt><dd>0</dd><dt>totalsteps</dt><dd>0</dd><dt>totaldistance</dt><dd>0</dd><dt>trackerdistance</dt><dd>0</dd><dt>loggedactivitiesdistance</dt><dd>0</dd><dt>veryactivedistance</dt><dd>0</dd><dt>moderatelyactivedistance</dt><dd>0</dd><dt>lightactivedistance</dt><dd>0</dd><dt>sedentaryactivedistance</dt><dd>0</dd><dt>veryactiveminutes</dt><dd>0</dd><dt>fairlyactiveminutes</dt><dd>0</dd><dt>lightlyactiveminutes</dt><dd>0</dd><dt>sedentaryminutes</dt><dd>0</dd><dt>calories</dt><dd>0</dd></dl>\n"
      ],
      "text/latex": [
       "\\begin{description*}\n",
       "\\item[id] 0\n",
       "\\item[activitydate] 0\n",
       "\\item[totalsteps] 0\n",
       "\\item[totaldistance] 0\n",
       "\\item[trackerdistance] 0\n",
       "\\item[loggedactivitiesdistance] 0\n",
       "\\item[veryactivedistance] 0\n",
       "\\item[moderatelyactivedistance] 0\n",
       "\\item[lightactivedistance] 0\n",
       "\\item[sedentaryactivedistance] 0\n",
       "\\item[veryactiveminutes] 0\n",
       "\\item[fairlyactiveminutes] 0\n",
       "\\item[lightlyactiveminutes] 0\n",
       "\\item[sedentaryminutes] 0\n",
       "\\item[calories] 0\n",
       "\\end{description*}\n"
      ],
      "text/markdown": [
       "id\n",
       ":   0activitydate\n",
       ":   0totalsteps\n",
       ":   0totaldistance\n",
       ":   0trackerdistance\n",
       ":   0loggedactivitiesdistance\n",
       ":   0veryactivedistance\n",
       ":   0moderatelyactivedistance\n",
       ":   0lightactivedistance\n",
       ":   0sedentaryactivedistance\n",
       ":   0veryactiveminutes\n",
       ":   0fairlyactiveminutes\n",
       ":   0lightlyactiveminutes\n",
       ":   0sedentaryminutes\n",
       ":   0calories\n",
       ":   0\n",
       "\n"
      ],
      "text/plain": [
       "                      id             activitydate               totalsteps \n",
       "                       0                        0                        0 \n",
       "           totaldistance          trackerdistance loggedactivitiesdistance \n",
       "                       0                        0                        0 \n",
       "      veryactivedistance moderatelyactivedistance      lightactivedistance \n",
       "                       0                        0                        0 \n",
       " sedentaryactivedistance        veryactiveminutes      fairlyactiveminutes \n",
       "                       0                        0                        0 \n",
       "    lightlyactiveminutes         sedentaryminutes                 calories \n",
       "                       0                        0                        0 "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    },
    {
     "data": {
      "text/html": [
       "<style>\n",
       ".dl-inline {width: auto; margin:0; padding: 0}\n",
       ".dl-inline>dt, .dl-inline>dd {float: none; width: auto; display: inline-block}\n",
       ".dl-inline>dt::after {content: \":\\0020\"; padding-right: .5ex}\n",
       ".dl-inline>dt:not(:first-of-type) {padding-left: .5ex}\n",
       "</style><dl class=dl-inline><dt>id</dt><dd>0</dd><dt>sleepday</dt><dd>0</dd><dt>totalsleeprecords</dt><dd>0</dd><dt>totalminutesasleep</dt><dd>0</dd><dt>totaltimeinbed</dt><dd>0</dd></dl>\n"
      ],
      "text/latex": [
       "\\begin{description*}\n",
       "\\item[id] 0\n",
       "\\item[sleepday] 0\n",
       "\\item[totalsleeprecords] 0\n",
       "\\item[totalminutesasleep] 0\n",
       "\\item[totaltimeinbed] 0\n",
       "\\end{description*}\n"
      ],
      "text/markdown": [
       "id\n",
       ":   0sleepday\n",
       ":   0totalsleeprecords\n",
       ":   0totalminutesasleep\n",
       ":   0totaltimeinbed\n",
       ":   0\n",
       "\n"
      ],
      "text/plain": [
       "                id           sleepday  totalsleeprecords totalminutesasleep \n",
       "                 0                  0                  0                  0 \n",
       "    totaltimeinbed \n",
       "                 0 "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    },
    {
     "data": {
      "text/html": [
       "<style>\n",
       ".dl-inline {width: auto; margin:0; padding: 0}\n",
       ".dl-inline>dt, .dl-inline>dd {float: none; width: auto; display: inline-block}\n",
       ".dl-inline>dt::after {content: \":\\0020\"; padding-right: .5ex}\n",
       ".dl-inline>dt:not(:first-of-type) {padding-left: .5ex}\n",
       "</style><dl class=dl-inline><dt>id</dt><dd>0</dd><dt>activityhour</dt><dd>0</dd><dt>steptotal</dt><dd>0</dd></dl>\n"
      ],
      "text/latex": [
       "\\begin{description*}\n",
       "\\item[id] 0\n",
       "\\item[activityhour] 0\n",
       "\\item[steptotal] 0\n",
       "\\end{description*}\n"
      ],
      "text/markdown": [
       "id\n",
       ":   0activityhour\n",
       ":   0steptotal\n",
       ":   0\n",
       "\n"
      ],
      "text/plain": [
       "          id activityhour    steptotal \n",
       "           0            0            0 "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "colSums(is.na(daily_activities))\n",
    "colSums(is.na(sleeps_daily))\n",
    "colSums(is.na(steps_hourly))"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "cb0dbe99",
   "metadata": {
    "papermill": {
     "duration": 0.015755,
     "end_time": "2022-09-24T15:15:42.038851",
     "exception": false,
     "start_time": "2022-09-24T15:15:42.023096",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "> Checking for duplicates by using the **sum** and **duplicated** function"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 7,
   "id": "8a62b0fe",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-09-24T15:15:42.073548Z",
     "iopub.status.busy": "2022-09-24T15:15:42.071875Z",
     "iopub.status.idle": "2022-09-24T15:15:42.155586Z",
     "shell.execute_reply": "2022-09-24T15:15:42.153706Z"
    },
    "papermill": {
     "duration": 0.103588,
     "end_time": "2022-09-24T15:15:42.157867",
     "exception": false,
     "start_time": "2022-09-24T15:15:42.054279",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "0"
      ],
      "text/latex": [
       "0"
      ],
      "text/markdown": [
       "0"
      ],
      "text/plain": [
       "[1] 0"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    },
    {
     "data": {
      "text/html": [
       "3"
      ],
      "text/latex": [
       "3"
      ],
      "text/markdown": [
       "3"
      ],
      "text/plain": [
       "[1] 3"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    },
    {
     "data": {
      "text/html": [
       "0"
      ],
      "text/latex": [
       "0"
      ],
      "text/markdown": [
       "0"
      ],
      "text/plain": [
       "[1] 0"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "sum(duplicated(daily_activities))\n",
    "sum(duplicated(sleeps_daily))\n",
    "sum(duplicated(steps_hourly))"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 8,
   "id": "6c40c54b",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-09-24T15:15:42.195278Z",
     "iopub.status.busy": "2022-09-24T15:15:42.193480Z",
     "iopub.status.idle": "2022-09-24T15:15:42.211884Z",
     "shell.execute_reply": "2022-09-24T15:15:42.210078Z"
    },
    "papermill": {
     "duration": 0.039516,
     "end_time": "2022-09-24T15:15:42.214242",
     "exception": false,
     "start_time": "2022-09-24T15:15:42.174726",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "413"
      ],
      "text/latex": [
       "413"
      ],
      "text/markdown": [
       "413"
      ],
      "text/plain": [
       "[1] 413"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "nrow(sleeps_daily)"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "2688058a",
   "metadata": {
    "papermill": {
     "duration": 0.016367,
     "end_time": "2022-09-24T15:15:42.246969",
     "exception": false,
     "start_time": "2022-09-24T15:15:42.230602",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "<div class=\"alert alert-block alert-info\">\n",
    "<b>sleeps_daily:</b> It appears the dataset has 3 duplicates that have to be removed before analysis.\n",
    "</div>"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 9,
   "id": "5b63df09",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-09-24T15:15:42.283715Z",
     "iopub.status.busy": "2022-09-24T15:15:42.281927Z",
     "iopub.status.idle": "2022-09-24T15:15:42.311527Z",
     "shell.execute_reply": "2022-09-24T15:15:42.308976Z"
    },
    "papermill": {
     "duration": 0.051318,
     "end_time": "2022-09-24T15:15:42.314597",
     "exception": false,
     "start_time": "2022-09-24T15:15:42.263279",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "0"
      ],
      "text/latex": [
       "0"
      ],
      "text/markdown": [
       "0"
      ],
      "text/plain": [
       "[1] 0"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "sleeps_daily <- sleeps_daily %>% distinct()\n",
    "sum(duplicated(sleeps_daily))"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "cec6fa0c",
   "metadata": {
    "papermill": {
     "duration": 0.016754,
     "end_time": "2022-09-24T15:15:42.348815",
     "exception": false,
     "start_time": "2022-09-24T15:15:42.332061",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "> Using a simple pipe to recode the **sleeps_daily** varible to no longer contain the 3 dulicates "
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 10,
   "id": "f3157130",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-09-24T15:15:42.386755Z",
     "iopub.status.busy": "2022-09-24T15:15:42.384904Z",
     "iopub.status.idle": "2022-09-24T15:15:42.404638Z",
     "shell.execute_reply": "2022-09-24T15:15:42.402624Z"
    },
    "papermill": {
     "duration": 0.041001,
     "end_time": "2022-09-24T15:15:42.407043",
     "exception": false,
     "start_time": "2022-09-24T15:15:42.366042",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "410"
      ],
      "text/latex": [
       "410"
      ],
      "text/markdown": [
       "410"
      ],
      "text/plain": [
       "[1] 410"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "nrow(sleeps_daily)"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "603099e6",
   "metadata": {
    "papermill": {
     "duration": 0.017673,
     "end_time": "2022-09-24T15:15:42.441618",
     "exception": false,
     "start_time": "2022-09-24T15:15:42.423945",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "> *Confirming the removal of the duplicates*"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "d27c0820",
   "metadata": {
    "papermill": {
     "duration": 0.016865,
     "end_time": "2022-09-24T15:15:42.475252",
     "exception": false,
     "start_time": "2022-09-24T15:15:42.458387",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "***"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "ec28e0f0",
   "metadata": {
    "papermill": {
     "duration": 0.017149,
     "end_time": "2022-09-24T15:15:42.508908",
     "exception": false,
     "start_time": "2022-09-24T15:15:42.491759",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "## Formatting "
   ]
  },
  {
   "cell_type": "markdown",
   "id": "955ce7ef",
   "metadata": {
    "papermill": {
     "duration": 0.016716,
     "end_time": "2022-09-24T15:15:42.542916",
     "exception": false,
     "start_time": "2022-09-24T15:15:42.526200",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "> To preform analysis across all three datasets, need to ensure compatable formatting for cross analysis. The dates will be rearranged into **yyyy/mm/dd** using the ` as_date ` function to adjust the formatting."
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 11,
   "id": "d614c961",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-09-24T15:15:42.580849Z",
     "iopub.status.busy": "2022-09-24T15:15:42.579171Z",
     "iopub.status.idle": "2022-09-24T15:15:42.625664Z",
     "shell.execute_reply": "2022-09-24T15:15:42.623555Z"
    },
    "papermill": {
     "duration": 0.068138,
     "end_time": "2022-09-24T15:15:42.628609",
     "exception": false,
     "start_time": "2022-09-24T15:15:42.560471",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "name": "stderr",
     "output_type": "stream",
     "text": [
      "Warning message:\n",
      "“`tz` argument is ignored by `as_date()`”\n"
     ]
    }
   ],
   "source": [
    "daily_activities <- daily_activities %>%\n",
    "  rename(date = activitydate) %>%\n",
    "  mutate(date = as_date(date, format = \"%m/%d/%Y\"))\n",
    "\n",
    "sleeps_daily <- sleeps_daily %>%\n",
    "  rename(date = sleepday) %>%\n",
    "  mutate(date = as_date(date,format =\"%m/%d/%Y %I:%M:%S %p\", tz=Sys.timezone()))"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 12,
   "id": "66e7a4d4",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-09-24T15:15:42.666160Z",
     "iopub.status.busy": "2022-09-24T15:15:42.664493Z",
     "iopub.status.idle": "2022-09-24T15:15:42.718098Z",
     "shell.execute_reply": "2022-09-24T15:15:42.715982Z"
    },
    "papermill": {
     "duration": 0.074873,
     "end_time": "2022-09-24T15:15:42.720650",
     "exception": false,
     "start_time": "2022-09-24T15:15:42.645777",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [],
   "source": [
    "steps_hourly<- steps_hourly %>% \n",
    "  rename(date_time = activityhour) %>% \n",
    "  mutate(date_time = as.POSIXct(date_time,format =\"%m/%d/%Y %I:%M:%S %p\" , tz=Sys.timezone()))"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "3e5570a3",
   "metadata": {
    "papermill": {
     "duration": 0.016656,
     "end_time": "2022-09-24T15:15:42.754168",
     "exception": false,
     "start_time": "2022-09-24T15:15:42.737512",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "*Confirming all datasets are dated properly*"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 13,
   "id": "ad605e14",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-09-24T15:15:42.791273Z",
     "iopub.status.busy": "2022-09-24T15:15:42.789551Z",
     "iopub.status.idle": "2022-09-24T15:15:42.846428Z",
     "shell.execute_reply": "2022-09-24T15:15:42.844538Z"
    },
    "papermill": {
     "duration": 0.078696,
     "end_time": "2022-09-24T15:15:42.848943",
     "exception": false,
     "start_time": "2022-09-24T15:15:42.770247",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A tibble: 6 × 3</caption>\n",
       "<thead>\n",
       "\t<tr><th scope=col>id</th><th scope=col>date_time</th><th scope=col>steptotal</th></tr>\n",
       "\t<tr><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dttm&gt;</th><th scope=col>&lt;dbl&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><td>1503960366</td><td>2016-04-12 00:00:00</td><td>373</td></tr>\n",
       "\t<tr><td>1503960366</td><td>2016-04-12 01:00:00</td><td>160</td></tr>\n",
       "\t<tr><td>1503960366</td><td>2016-04-12 02:00:00</td><td>151</td></tr>\n",
       "\t<tr><td>1503960366</td><td>2016-04-12 03:00:00</td><td>  0</td></tr>\n",
       "\t<tr><td>1503960366</td><td>2016-04-12 04:00:00</td><td>  0</td></tr>\n",
       "\t<tr><td>1503960366</td><td>2016-04-12 05:00:00</td><td>  0</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A tibble: 6 × 3\n",
       "\\begin{tabular}{lll}\n",
       " id & date\\_time & steptotal\\\\\n",
       " <dbl> & <dttm> & <dbl>\\\\\n",
       "\\hline\n",
       "\t 1503960366 & 2016-04-12 00:00:00 & 373\\\\\n",
       "\t 1503960366 & 2016-04-12 01:00:00 & 160\\\\\n",
       "\t 1503960366 & 2016-04-12 02:00:00 & 151\\\\\n",
       "\t 1503960366 & 2016-04-12 03:00:00 &   0\\\\\n",
       "\t 1503960366 & 2016-04-12 04:00:00 &   0\\\\\n",
       "\t 1503960366 & 2016-04-12 05:00:00 &   0\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A tibble: 6 × 3\n",
       "\n",
       "| id &lt;dbl&gt; | date_time &lt;dttm&gt; | steptotal &lt;dbl&gt; |\n",
       "|---|---|---|\n",
       "| 1503960366 | 2016-04-12 00:00:00 | 373 |\n",
       "| 1503960366 | 2016-04-12 01:00:00 | 160 |\n",
       "| 1503960366 | 2016-04-12 02:00:00 | 151 |\n",
       "| 1503960366 | 2016-04-12 03:00:00 |   0 |\n",
       "| 1503960366 | 2016-04-12 04:00:00 |   0 |\n",
       "| 1503960366 | 2016-04-12 05:00:00 |   0 |\n",
       "\n"
      ],
      "text/plain": [
       "  id         date_time           steptotal\n",
       "1 1503960366 2016-04-12 00:00:00 373      \n",
       "2 1503960366 2016-04-12 01:00:00 160      \n",
       "3 1503960366 2016-04-12 02:00:00 151      \n",
       "4 1503960366 2016-04-12 03:00:00   0      \n",
       "5 1503960366 2016-04-12 04:00:00   0      \n",
       "6 1503960366 2016-04-12 05:00:00   0      "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    },
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A tibble: 6 × 5</caption>\n",
       "<thead>\n",
       "\t<tr><th scope=col>id</th><th scope=col>date</th><th scope=col>totalsleeprecords</th><th scope=col>totalminutesasleep</th><th scope=col>totaltimeinbed</th></tr>\n",
       "\t<tr><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;date&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><td>1503960366</td><td>2016-04-12</td><td>1</td><td>327</td><td>346</td></tr>\n",
       "\t<tr><td>1503960366</td><td>2016-04-13</td><td>2</td><td>384</td><td>407</td></tr>\n",
       "\t<tr><td>1503960366</td><td>2016-04-15</td><td>1</td><td>412</td><td>442</td></tr>\n",
       "\t<tr><td>1503960366</td><td>2016-04-16</td><td>2</td><td>340</td><td>367</td></tr>\n",
       "\t<tr><td>1503960366</td><td>2016-04-17</td><td>1</td><td>700</td><td>712</td></tr>\n",
       "\t<tr><td>1503960366</td><td>2016-04-19</td><td>1</td><td>304</td><td>320</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A tibble: 6 × 5\n",
       "\\begin{tabular}{lllll}\n",
       " id & date & totalsleeprecords & totalminutesasleep & totaltimeinbed\\\\\n",
       " <dbl> & <date> & <dbl> & <dbl> & <dbl>\\\\\n",
       "\\hline\n",
       "\t 1503960366 & 2016-04-12 & 1 & 327 & 346\\\\\n",
       "\t 1503960366 & 2016-04-13 & 2 & 384 & 407\\\\\n",
       "\t 1503960366 & 2016-04-15 & 1 & 412 & 442\\\\\n",
       "\t 1503960366 & 2016-04-16 & 2 & 340 & 367\\\\\n",
       "\t 1503960366 & 2016-04-17 & 1 & 700 & 712\\\\\n",
       "\t 1503960366 & 2016-04-19 & 1 & 304 & 320\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A tibble: 6 × 5\n",
       "\n",
       "| id &lt;dbl&gt; | date &lt;date&gt; | totalsleeprecords &lt;dbl&gt; | totalminutesasleep &lt;dbl&gt; | totaltimeinbed &lt;dbl&gt; |\n",
       "|---|---|---|---|---|\n",
       "| 1503960366 | 2016-04-12 | 1 | 327 | 346 |\n",
       "| 1503960366 | 2016-04-13 | 2 | 384 | 407 |\n",
       "| 1503960366 | 2016-04-15 | 1 | 412 | 442 |\n",
       "| 1503960366 | 2016-04-16 | 2 | 340 | 367 |\n",
       "| 1503960366 | 2016-04-17 | 1 | 700 | 712 |\n",
       "| 1503960366 | 2016-04-19 | 1 | 304 | 320 |\n",
       "\n"
      ],
      "text/plain": [
       "  id         date       totalsleeprecords totalminutesasleep totaltimeinbed\n",
       "1 1503960366 2016-04-12 1                 327                346           \n",
       "2 1503960366 2016-04-13 2                 384                407           \n",
       "3 1503960366 2016-04-15 1                 412                442           \n",
       "4 1503960366 2016-04-16 2                 340                367           \n",
       "5 1503960366 2016-04-17 1                 700                712           \n",
       "6 1503960366 2016-04-19 1                 304                320           "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    },
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A tibble: 6 × 15</caption>\n",
       "<thead>\n",
       "\t<tr><th scope=col>id</th><th scope=col>date</th><th scope=col>totalsteps</th><th scope=col>totaldistance</th><th scope=col>trackerdistance</th><th scope=col>loggedactivitiesdistance</th><th scope=col>veryactivedistance</th><th scope=col>moderatelyactivedistance</th><th scope=col>lightactivedistance</th><th scope=col>sedentaryactivedistance</th><th scope=col>veryactiveminutes</th><th scope=col>fairlyactiveminutes</th><th scope=col>lightlyactiveminutes</th><th scope=col>sedentaryminutes</th><th scope=col>calories</th></tr>\n",
       "\t<tr><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;date&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><td>1503960366</td><td>2016-04-12</td><td>13162</td><td>8.50</td><td>8.50</td><td>0</td><td>1.88</td><td>0.55</td><td>6.06</td><td>0</td><td>25</td><td>13</td><td>328</td><td> 728</td><td>1985</td></tr>\n",
       "\t<tr><td>1503960366</td><td>2016-04-13</td><td>10735</td><td>6.97</td><td>6.97</td><td>0</td><td>1.57</td><td>0.69</td><td>4.71</td><td>0</td><td>21</td><td>19</td><td>217</td><td> 776</td><td>1797</td></tr>\n",
       "\t<tr><td>1503960366</td><td>2016-04-14</td><td>10460</td><td>6.74</td><td>6.74</td><td>0</td><td>2.44</td><td>0.40</td><td>3.91</td><td>0</td><td>30</td><td>11</td><td>181</td><td>1218</td><td>1776</td></tr>\n",
       "\t<tr><td>1503960366</td><td>2016-04-15</td><td> 9762</td><td>6.28</td><td>6.28</td><td>0</td><td>2.14</td><td>1.26</td><td>2.83</td><td>0</td><td>29</td><td>34</td><td>209</td><td> 726</td><td>1745</td></tr>\n",
       "\t<tr><td>1503960366</td><td>2016-04-16</td><td>12669</td><td>8.16</td><td>8.16</td><td>0</td><td>2.71</td><td>0.41</td><td>5.04</td><td>0</td><td>36</td><td>10</td><td>221</td><td> 773</td><td>1863</td></tr>\n",
       "\t<tr><td>1503960366</td><td>2016-04-17</td><td> 9705</td><td>6.48</td><td>6.48</td><td>0</td><td>3.19</td><td>0.78</td><td>2.51</td><td>0</td><td>38</td><td>20</td><td>164</td><td> 539</td><td>1728</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A tibble: 6 × 15\n",
       "\\begin{tabular}{lllllllllllllll}\n",
       " id & date & totalsteps & totaldistance & trackerdistance & loggedactivitiesdistance & veryactivedistance & moderatelyactivedistance & lightactivedistance & sedentaryactivedistance & veryactiveminutes & fairlyactiveminutes & lightlyactiveminutes & sedentaryminutes & calories\\\\\n",
       " <dbl> & <date> & <dbl> & <dbl> & <dbl> & <dbl> & <dbl> & <dbl> & <dbl> & <dbl> & <dbl> & <dbl> & <dbl> & <dbl> & <dbl>\\\\\n",
       "\\hline\n",
       "\t 1503960366 & 2016-04-12 & 13162 & 8.50 & 8.50 & 0 & 1.88 & 0.55 & 6.06 & 0 & 25 & 13 & 328 &  728 & 1985\\\\\n",
       "\t 1503960366 & 2016-04-13 & 10735 & 6.97 & 6.97 & 0 & 1.57 & 0.69 & 4.71 & 0 & 21 & 19 & 217 &  776 & 1797\\\\\n",
       "\t 1503960366 & 2016-04-14 & 10460 & 6.74 & 6.74 & 0 & 2.44 & 0.40 & 3.91 & 0 & 30 & 11 & 181 & 1218 & 1776\\\\\n",
       "\t 1503960366 & 2016-04-15 &  9762 & 6.28 & 6.28 & 0 & 2.14 & 1.26 & 2.83 & 0 & 29 & 34 & 209 &  726 & 1745\\\\\n",
       "\t 1503960366 & 2016-04-16 & 12669 & 8.16 & 8.16 & 0 & 2.71 & 0.41 & 5.04 & 0 & 36 & 10 & 221 &  773 & 1863\\\\\n",
       "\t 1503960366 & 2016-04-17 &  9705 & 6.48 & 6.48 & 0 & 3.19 & 0.78 & 2.51 & 0 & 38 & 20 & 164 &  539 & 1728\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A tibble: 6 × 15\n",
       "\n",
       "| id &lt;dbl&gt; | date &lt;date&gt; | totalsteps &lt;dbl&gt; | totaldistance &lt;dbl&gt; | trackerdistance &lt;dbl&gt; | loggedactivitiesdistance &lt;dbl&gt; | veryactivedistance &lt;dbl&gt; | moderatelyactivedistance &lt;dbl&gt; | lightactivedistance &lt;dbl&gt; | sedentaryactivedistance &lt;dbl&gt; | veryactiveminutes &lt;dbl&gt; | fairlyactiveminutes &lt;dbl&gt; | lightlyactiveminutes &lt;dbl&gt; | sedentaryminutes &lt;dbl&gt; | calories &lt;dbl&gt; |\n",
       "|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|\n",
       "| 1503960366 | 2016-04-12 | 13162 | 8.50 | 8.50 | 0 | 1.88 | 0.55 | 6.06 | 0 | 25 | 13 | 328 |  728 | 1985 |\n",
       "| 1503960366 | 2016-04-13 | 10735 | 6.97 | 6.97 | 0 | 1.57 | 0.69 | 4.71 | 0 | 21 | 19 | 217 |  776 | 1797 |\n",
       "| 1503960366 | 2016-04-14 | 10460 | 6.74 | 6.74 | 0 | 2.44 | 0.40 | 3.91 | 0 | 30 | 11 | 181 | 1218 | 1776 |\n",
       "| 1503960366 | 2016-04-15 |  9762 | 6.28 | 6.28 | 0 | 2.14 | 1.26 | 2.83 | 0 | 29 | 34 | 209 |  726 | 1745 |\n",
       "| 1503960366 | 2016-04-16 | 12669 | 8.16 | 8.16 | 0 | 2.71 | 0.41 | 5.04 | 0 | 36 | 10 | 221 |  773 | 1863 |\n",
       "| 1503960366 | 2016-04-17 |  9705 | 6.48 | 6.48 | 0 | 3.19 | 0.78 | 2.51 | 0 | 38 | 20 | 164 |  539 | 1728 |\n",
       "\n"
      ],
      "text/plain": [
       "  id         date       totalsteps totaldistance trackerdistance\n",
       "1 1503960366 2016-04-12 13162      8.50          8.50           \n",
       "2 1503960366 2016-04-13 10735      6.97          6.97           \n",
       "3 1503960366 2016-04-14 10460      6.74          6.74           \n",
       "4 1503960366 2016-04-15  9762      6.28          6.28           \n",
       "5 1503960366 2016-04-16 12669      8.16          8.16           \n",
       "6 1503960366 2016-04-17  9705      6.48          6.48           \n",
       "  loggedactivitiesdistance veryactivedistance moderatelyactivedistance\n",
       "1 0                        1.88               0.55                    \n",
       "2 0                        1.57               0.69                    \n",
       "3 0                        2.44               0.40                    \n",
       "4 0                        2.14               1.26                    \n",
       "5 0                        2.71               0.41                    \n",
       "6 0                        3.19               0.78                    \n",
       "  lightactivedistance sedentaryactivedistance veryactiveminutes\n",
       "1 6.06                0                       25               \n",
       "2 4.71                0                       21               \n",
       "3 3.91                0                       30               \n",
       "4 2.83                0                       29               \n",
       "5 5.04                0                       36               \n",
       "6 2.51                0                       38               \n",
       "  fairlyactiveminutes lightlyactiveminutes sedentaryminutes calories\n",
       "1 13                  328                   728             1985    \n",
       "2 19                  217                   776             1797    \n",
       "3 11                  181                  1218             1776    \n",
       "4 34                  209                   726             1745    \n",
       "5 10                  221                   773             1863    \n",
       "6 20                  164                   539             1728    "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "head(steps_hourly)\n",
    "head(sleeps_daily)\n",
    "head(daily_activities)"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "e53caa3f",
   "metadata": {
    "papermill": {
     "duration": 0.017211,
     "end_time": "2022-09-24T15:15:42.883948",
     "exception": false,
     "start_time": "2022-09-24T15:15:42.866737",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "<span style=\"font-size:22px; color:#4E9258\"> Merging the Datasets </span> "
   ]
  },
  {
   "cell_type": "markdown",
   "id": "c6fd30ec",
   "metadata": {
    "papermill": {
     "duration": 0.018154,
     "end_time": "2022-09-24T15:15:42.919240",
     "exception": false,
     "start_time": "2022-09-24T15:15:42.901086",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "> Using the ` merge ` function, **daily_activies** and **sleeps_daily** will be stored in a new varable for analysis. Using ` glimpse ` to ensure the merge was successful."
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 14,
   "id": "e7255810",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-09-24T15:15:43.006442Z",
     "iopub.status.busy": "2022-09-24T15:15:43.004567Z",
     "iopub.status.idle": "2022-09-24T15:15:43.057042Z",
     "shell.execute_reply": "2022-09-24T15:15:43.054402Z"
    },
    "papermill": {
     "duration": 0.122677,
     "end_time": "2022-09-24T15:15:43.059756",
     "exception": false,
     "start_time": "2022-09-24T15:15:42.937079",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "name": "stdout",
     "output_type": "stream",
     "text": [
      "Rows: 410\n",
      "Columns: 18\n",
      "$ id                       \u001b[3m\u001b[90m<dbl>\u001b[39m\u001b[23m 1503960366, 1503960366, 1503960366, 150396036…\n",
      "$ date                     \u001b[3m\u001b[90m<date>\u001b[39m\u001b[23m 2016-04-12, 2016-04-13, 2016-04-15, 2016-04-…\n",
      "$ totalsteps               \u001b[3m\u001b[90m<dbl>\u001b[39m\u001b[23m 13162, 10735, 9762, 12669, 9705, 15506, 10544…\n",
      "$ totaldistance            \u001b[3m\u001b[90m<dbl>\u001b[39m\u001b[23m 8.50, 6.97, 6.28, 8.16, 6.48, 9.88, 6.68, 6.3…\n",
      "$ trackerdistance          \u001b[3m\u001b[90m<dbl>\u001b[39m\u001b[23m 8.50, 6.97, 6.28, 8.16, 6.48, 9.88, 6.68, 6.3…\n",
      "$ loggedactivitiesdistance \u001b[3m\u001b[90m<dbl>\u001b[39m\u001b[23m 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, …\n",
      "$ veryactivedistance       \u001b[3m\u001b[90m<dbl>\u001b[39m\u001b[23m 1.88, 1.57, 2.14, 2.71, 3.19, 3.53, 1.96, 1.3…\n",
      "$ moderatelyactivedistance \u001b[3m\u001b[90m<dbl>\u001b[39m\u001b[23m 0.55, 0.69, 1.26, 0.41, 0.78, 1.32, 0.48, 0.3…\n",
      "$ lightactivedistance      \u001b[3m\u001b[90m<dbl>\u001b[39m\u001b[23m 6.06, 4.71, 2.83, 5.04, 2.51, 5.03, 4.24, 4.6…\n",
      "$ sedentaryactivedistance  \u001b[3m\u001b[90m<dbl>\u001b[39m\u001b[23m 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, …\n",
      "$ veryactiveminutes        \u001b[3m\u001b[90m<dbl>\u001b[39m\u001b[23m 25, 21, 29, 36, 38, 50, 28, 19, 41, 39, 73, 3…\n",
      "$ fairlyactiveminutes      \u001b[3m\u001b[90m<dbl>\u001b[39m\u001b[23m 13, 19, 34, 10, 20, 31, 12, 8, 21, 5, 14, 23,…\n",
      "$ lightlyactiveminutes     \u001b[3m\u001b[90m<dbl>\u001b[39m\u001b[23m 328, 217, 209, 221, 164, 264, 205, 211, 262, …\n",
      "$ sedentaryminutes         \u001b[3m\u001b[90m<dbl>\u001b[39m\u001b[23m 728, 776, 726, 773, 539, 775, 818, 838, 732, …\n",
      "$ calories                 \u001b[3m\u001b[90m<dbl>\u001b[39m\u001b[23m 1985, 1797, 1745, 1863, 1728, 2035, 1786, 177…\n",
      "$ totalsleeprecords        \u001b[3m\u001b[90m<dbl>\u001b[39m\u001b[23m 1, 2, 1, 2, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, …\n",
      "$ totalminutesasleep       \u001b[3m\u001b[90m<dbl>\u001b[39m\u001b[23m 327, 384, 412, 340, 700, 304, 360, 325, 361, …\n",
      "$ totaltimeinbed           \u001b[3m\u001b[90m<dbl>\u001b[39m\u001b[23m 346, 407, 442, 367, 712, 320, 377, 364, 384, …\n"
     ]
    }
   ],
   "source": [
    "activity_sleep_daily <- merge(daily_activities, sleeps_daily, by=c (\"id\", \"date\"))\n",
    "glimpse(activity_sleep_daily)"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "0ce72978",
   "metadata": {
    "papermill": {
     "duration": 0.017865,
     "end_time": "2022-09-24T15:15:43.095148",
     "exception": false,
     "start_time": "2022-09-24T15:15:43.077283",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "***"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "fea09d5d",
   "metadata": {
    "papermill": {
     "duration": 0.017829,
     "end_time": "2022-09-24T15:15:43.130677",
     "exception": false,
     "start_time": "2022-09-24T15:15:43.112848",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "## Data Analyzation\n",
    "<span style=\"font-size:20px; color:#4E9258\"> Analysis Phase </span> "
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 15,
   "id": "5cb813d4",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-09-24T15:15:43.169133Z",
     "iopub.status.busy": "2022-09-24T15:15:43.167503Z",
     "iopub.status.idle": "2022-09-24T15:15:43.212190Z",
     "shell.execute_reply": "2022-09-24T15:15:43.209807Z"
    },
    "papermill": {
     "duration": 0.06742,
     "end_time": "2022-09-24T15:15:43.215112",
     "exception": false,
     "start_time": "2022-09-24T15:15:43.147692",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A tibble: 6 × 4</caption>\n",
       "<thead>\n",
       "\t<tr><th scope=col>id</th><th scope=col>mean_daily_steps</th><th scope=col>mean_daily_calories</th><th scope=col>mean_daily_sleep</th></tr>\n",
       "\t<tr><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><td>1503960366</td><td>12405.680</td><td>1872.280</td><td>360.2800</td></tr>\n",
       "\t<tr><td>1644430081</td><td> 7967.750</td><td>2977.750</td><td>294.0000</td></tr>\n",
       "\t<tr><td>1844505072</td><td> 3477.000</td><td>1676.333</td><td>652.0000</td></tr>\n",
       "\t<tr><td>1927972279</td><td> 1490.000</td><td>2316.200</td><td>417.0000</td></tr>\n",
       "\t<tr><td>2026352035</td><td> 5618.679</td><td>1540.786</td><td>506.1786</td></tr>\n",
       "\t<tr><td>2320127002</td><td> 5079.000</td><td>1804.000</td><td> 61.0000</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A tibble: 6 × 4\n",
       "\\begin{tabular}{llll}\n",
       " id & mean\\_daily\\_steps & mean\\_daily\\_calories & mean\\_daily\\_sleep\\\\\n",
       " <dbl> & <dbl> & <dbl> & <dbl>\\\\\n",
       "\\hline\n",
       "\t 1503960366 & 12405.680 & 1872.280 & 360.2800\\\\\n",
       "\t 1644430081 &  7967.750 & 2977.750 & 294.0000\\\\\n",
       "\t 1844505072 &  3477.000 & 1676.333 & 652.0000\\\\\n",
       "\t 1927972279 &  1490.000 & 2316.200 & 417.0000\\\\\n",
       "\t 2026352035 &  5618.679 & 1540.786 & 506.1786\\\\\n",
       "\t 2320127002 &  5079.000 & 1804.000 &  61.0000\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A tibble: 6 × 4\n",
       "\n",
       "| id &lt;dbl&gt; | mean_daily_steps &lt;dbl&gt; | mean_daily_calories &lt;dbl&gt; | mean_daily_sleep &lt;dbl&gt; |\n",
       "|---|---|---|---|\n",
       "| 1503960366 | 12405.680 | 1872.280 | 360.2800 |\n",
       "| 1644430081 |  7967.750 | 2977.750 | 294.0000 |\n",
       "| 1844505072 |  3477.000 | 1676.333 | 652.0000 |\n",
       "| 1927972279 |  1490.000 | 2316.200 | 417.0000 |\n",
       "| 2026352035 |  5618.679 | 1540.786 | 506.1786 |\n",
       "| 2320127002 |  5079.000 | 1804.000 |  61.0000 |\n",
       "\n"
      ],
      "text/plain": [
       "  id         mean_daily_steps mean_daily_calories mean_daily_sleep\n",
       "1 1503960366 12405.680        1872.280            360.2800        \n",
       "2 1644430081  7967.750        2977.750            294.0000        \n",
       "3 1844505072  3477.000        1676.333            652.0000        \n",
       "4 1927972279  1490.000        2316.200            417.0000        \n",
       "5 2026352035  5618.679        1540.786            506.1786        \n",
       "6 2320127002  5079.000        1804.000             61.0000        "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "daily_average <- activity_sleep_daily %>%\n",
    "  group_by(id) %>%\n",
    "  summarise (mean_daily_steps = mean(totalsteps), mean_daily_calories = mean(calories), mean_daily_sleep = mean(totalminutesasleep))\n",
    "\n",
    "head(daily_average)"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "1f6af27b",
   "metadata": {
    "papermill": {
     "duration": 0.018111,
     "end_time": "2022-09-24T15:15:43.251010",
     "exception": false,
     "start_time": "2022-09-24T15:15:43.232899",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "#### Taking the *daily average steps* of each user, we will group the the averages into **five** classifications\n",
    "\n",
    "> The criteria used to dertermine the user's **activeness** is found in [this article](https://www.communityaccessnetwork.org/how-many-steps-should-you-actually-take/) "
   ]
  },
  {
   "attachments": {
    "31d78bb0-f68a-42ba-b5f6-e7bda50e0254.png": {
     "image/png": "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Ao2NjXbdddeVlfTrX/96Gz58eFlhsp5J87777rPnn3/e5s6da2PGjEnvyt57752IXtZvqefdESdpz5gxw5588smU16amJuO93n777W3XXXctNWu9xt/MmTNT/zBv3rz1yrTDDjvYb3/72/Xu64YQEALrIyBivj4muiMENhiBl19+2X70ox/Z3//+90TGi0W4zTbb2Dvf+U5785vfbP379y/mrUfvi5j3KPw9mjjE821ve1tZefjd735nkydPLisMnpm0Xn755Ub4RYsWrRd+4MCBdsIJJ9jpp59uo0aNWu95oRvdESfpIBH++c9/bnfffXehZO01r3mNfeADH7BDDjmk4PPedrOlpcXe//732yOPPJKEDW9961vtyCOPtHXr1tltt91mY8eOTde9rdwqjxDoDgREzLsDVcVZ0wg8+uijdvbZZ9uKFSsSDuPHj7eGhgabNGlSIhQvvviizZ4925599llbsmRJ8jN69Gi74oorjGO1ud5CzC+55JJE/o466qhUF9WGczXm595777WzzjorZQ1VplIcbX/zzTcvxWubH96Vc845xx588MF0Dyn5brvtZrw7CxcutH//+9/2n//8Jz1DKv3Tn/60U9WI7oiTDNx88832pS99yZCQ19XVpXzyfjOx5r2mDEwIcB/84AfTL1304j9PP/20vf3tb08l/P73v18zE5JeXKUqWg8iIGLeg+ArabNr73/G7pg+2554/mVbsDRHZMcNH2I7bz3WDpmyjR27b/mSt57EFRKBhPGVV15Jy/nnn39+0UGKgf2GG26w3/zmNzZ06FD71a9+1ZNZL5p2byHmSC/Rgf32t79thx9+eNHy6sGrCPz1r3812vB2221nV1555asPKnjW3NycpODTp09P5PajH/2onXjiie1WkJDIInml7hYsWJDUW/7v//7Pxo0bVzAn3REnCbEC9t///d9JErzXXnvZpz71qfVWB1gtu/DCC+2aa65JeUNyfsYZZxTMZ2+5+be//c2+8IUv2ODBg+2WW25pV3e9pYwqhxDYWAiImG8spJVOOwQg5Bfd+KDNXbK83f38iy1GDrUPHbXXJkPQkeRBsAcNGmS///3vk8Qvv0z515AOlu6RElajEzGvxlrZOHmiLdOmX/va19pPfvKTbkn00ksvtf/5n/9JZO673/2uHXjggUXTQSKNFBryiy77N7/5zYJ+uyPO5cuXpwkD7yp5JK8dqZ/98Ic/NCYPffr0SceuqPcULFwV3kQFiU3ie+yxh/3iF7+owhwqS0Jg00FAxHzTqatek9Nv/WmaXXnX9LLKc8pBU+wzJ7y2rDA94fkd73hHsmBy2GGH2Xe+852eyELF0xQxrzikm0yESKiZYB533HFJfaPSGUf6jd746tWrk44yba0zd+uttyZJNf6QTO+3337tgnRHnCTwve99L+m/Dxs2zP7yl790usGVCTf9AWoevZ2wBjHfc8897eKLL25XH7oQAkKgPAREzMvDS743EIGukPJIclMg5+gvo86Cni0mwirpkNT96U9/ShYr5syZk9Qytthii6QvDXHaZ599Sk4O0oC1GFQVsKaA9Qukf+j0HnDAAYmIbbbZZim+coh5JfL42c9+1tDDR7eZvLCB7J///GeyDoLEFOI1YcIE22WXXdJv//33L7rawIY0LHLgsJ4Rjs15WQeBKqZDjYrFPffcY7NmzUq/l156KaWHrvPOO+9sp556alrCz8aXf46VESTO4AvZxYE79fnYY48ZliyQ8lIPTOiw1IP/cqyboEOPusfBBx/cpjrB5kQkt+hAf+UrX7EBAwbkZ63Da1Q1IMLgWApp7jCyAg+x1IFO8siRI5PqB6oQpbj3vve9Cbc3vvGN9tWvfrVdkO6Ikzb4hje8IamolfNugz+qOTjqGktMG+Ief/zxhBNkn7bCe0wfgKoRG8hRr+nM5b9f6MOjfnLTTTcZbZuJzic/+cnOorHrr78+TVTw2NG7xerh//7v/64XX1f6CvbkBJ6sspTyfjCxvPbaa5OlnE9/+tPr5aPQDcrPOxlqXPl+upL3bByl9gfRB2fD6rz3IyBi3vvruGpKiPrKeVfesUH5+fIph1S1WsvHP/7xRCIhyT/72c82qKwRmMEX0oYVCHRnizlMtLG039nGO8gterLYJi/m+vbtmzbjnXLKKYmQdWYusZJ5REcfayBf//rXE/H9xCc+kTbKFssr+vmf//znE3HK9/O6173OMFnZmTv33HPbNq+FX8z1ocYBaenIsWGXgRwrFMUcusmf+cxnbNttt7U//OEPKV7qNOswS4jONLbiIUgf/vCHk+511k+xc9QsjjnmmDRZ++Uvf5k2JOL33e9+tzGxwIFnR3lMnvL+YCITMkh7wdJGpR261w888IAde+yxdt5555UcfZBvpNdsxqS9huuOONnQiQoNDpLHBKsUB6FH5Wbp0qX2sY99zN71rneVEmw9P0xG0eEGq47clClTUj0zaSzmsu8X6jXki/YWrtTVEfbGYHmqMzdkyBC7/fbb27xtaF9BPVAfTDBOOumktngLnZDW8ccfn8pHG2FPT2cWfdhojKUsJv+sjLDBN9yG5j3iKbU/6Kwvj/h07F0IiJj3rvqs6tIcc8GVneqUd1YAdM6v/8IpnXnrseexpIvEE+LFQLkhjoEA0ok0iwHiTW96U5JmIyFDEoXknEEPE3MM3gw6SKeQkBZyDz/8cJI4sQkS83MMWkj5GciJnwEaIop0D7IXxK4jYl7pPAZxwGb6r3/960RqkATy23333Q0Tk5BmrN/wHDUI8EatIX/VANvx5A8XpJQBPX/zJ+QhK01m1QOyiDQRaS5kGVvM2KiGPIM7hJVle3Dv169f0iOmXgq57EA8derU9BEW0iMN4oWwM7Fi1YK6RG2CdNhASNydOXSZkYyzikC7CwfZDTvkXTFjSHtDctgdljaoNzbkQl6/9rWvpXYY+e7smDXjiE4zqiK47oiTeGPvCG3vj3/8I7dKdrQ33ikk0bTRct0zzzyTJmm0Zd5ZiDOrO7yztPvsO7ts2TKjLdMWUCsp5OL9YjIKdkwaWPlhEkv7pY2XItkHa/oRHO2PdzGsS2XTpV8JMlyJvoKJ0Ze//OX12no2zThnIpPdeMsk/7/+67/iccEjK1ZsdM63qFOJvEeC5fQHEUbH2kFAxLx26rpHS1oJaXkUoJql5qhgQGaxysKmL1QksLuMVLcrjsHuxz/+cQqKxPXkk08uGA2DM+oG8+fPT1Yi+Ppe/sY0ll/JD0SSAZ54iy19s1SO6gIDfRDbYh8YqmQeKVwQhygoagthsi/uxRG8ySdEuZCEK/xxLNcqC2SUsmNVo9iSOcQETJkoQKyLWdaJgZg2AZlCUokKBoQ83xEn0m8mRqifcN6Rg9gywQIDVkyQ0IZjtYBJHaY6y/3oDfGGKhHkcqeddkrR0q7Ag1+pqieRn+yRL0PGl2QhQsUmNdkwcU69kLe1a9e2I/XdESdpYh4R1Q0mdKGKFHnp7Aj5ZfWsK6SeNoCUnfbV2TsLgYeEQrTZSM6qQqEN5fF+ER+WoZgA04Zpl111IZCA1GP2tZirRF/B+8HEhOPVV19d8B2K9KPeaPuojHX2oSPwIG4wRFpOnxKuEnmPuMrpDyKMjrWDgIh57dR1j5b0U5f93f7+2KyK5OGIXSfad95zREXi6o5IsLeMHmosD7OEikQPiRRkolQCguUJ9EZRX0GvEsLfkSNdSCQEvJBqxje+8Y00kCGpRaK27777dhRdUoFAnQJygCtEzCudR9IJ4sA5pISl9o7cP/7xDwvdUVYLik02yiXmHaWZfXbXXXe15ZHVCySW+S4GYu6z0oHUtZipP/wwaYII8DlzSE9HDlUOVE0gEX/+8583iGBl06EdxSpD9n72HOKHJJi2zYSgHHLHigeTVtyNN95YkERm08o/J2/5bb074iRdyCv7DDDj+LnPfS4/Kx1eo7rEhInJOXsAynFYOqH+S31n0fX+0Ic+lN5ZVjuQLOe77PuF7XH6ig11pRDzSvYVlAvJOe2HPqqQg7jTRug/WXmirOioM2GBoBdy0ZfQN1500UVtXiqZdyIttz9oy4hOagIBEfOaqOaeL2Ql1FiiFNWuzkI+WXZm0xFSF6TYWcdyL2QGSShEvRiZCVN1qKVcddVV2SiKnofeZ77kCskpkiA+ulLO5jXyH5vrChHzSuYxChXEAekyRBfJXmeOsjF4dqSX3V3EHEwPPfTQlEXIdCH1pexAjISf1Y2OHG0GNRckwuwt4HP0xVxshCw0GSsWppT7TPTY/Jl1SKohPEzWOMZqCn6YRKA6U4z0ZOPh/I477mgjhdOmTStJZScbB/rFs3xDbpacdUecpIlEmT0ZHa3eZPOWPWfFIsh8OeVEjSqkt115Z1nZwL54/mpPvF/c5/1GT39DXSnEvJJ9Rej8s/EV0l2oD2WSesEFF7StcrACBilHlQWVlkKOj1zdeeed661UVTLvpFtuf1Aor7rXexEQMe+9dVtVJdv307+0tetyur4bmrE+9XV2/7dzkrYNjau7w6MOgKSNLyhiBYWvfXIvHJvIsN5SaBMTRBg9Zpb72fhViuNT4WENBosrDFy4sA7BAMZgXeoXRiFfEFpcIWJeyTymRPxPEIdSpMURJjaEoeqDyk8h113EnLSw2MFkrNgGy+xAjJoROr2duS9+8Ytpsxr5hlQUciEhRhqLqsWGqJYUir+jeyz3ox7AhjrIJ+0aXWI2n5aio8x7gSQaB6EuN+/oWrMqlZ3odEec5A/yD9YQdMhbOQ4dfyYsTDTJX3YzYUfxRFm68s7SHrFGVKg9xvuFLfZQk+soH6U8K4WYV7KvYEJIv4gqG5LtQqt/UWesDmKp6LnnnjM2s9NGabPZDcOUkdUXrPwgCGAFJysQqGTeSasr/QHh5GoDARHz2qjnHi9lrRLzfOBZSsX0H0SEY3y6m8ESyx5ZyU+YXkQ/EpWWUhzLtmE/PbspDtUJBmnUJxiUynGxoZLBKYhUhK9kHiPOIA5MVtBtLsXFJkeWrilnIddVYs5qA5vI2ATJ3gH0UPNd2G4+37+SWaiusgMxy+X5Usz8+LgO6xAQOXRp0VHOd7GxsBSVn/ywlbx+6KGHkjoPEzlWD9i82pnLfsYdqWdWn7ezsDwnHVYrkEajYoLrjjiJFwkrqzfULXVcjgsLMqj9QPhKdRvyzsY7VEjSHs8gqfkrIqXmLd9fKcS80n1F6O4XUtlhtQcrQpgbREAR/WpsZufjUFN9E3bWxQZq7Oqz4T7rKp33rvQH2fzovHcjIGLeu+u3akpXa6ospQDPhi6WWsMEGqQX8otDIoR97qx0PT0o4092IyC61/zKkUJHUsWIeaXzGOkFcShHNYNNkpC7ShJzSB/WOFgSjwlU5LHYsTNijlSYSVmpLkz/FVoJYLMnmz4h7pS9p02rYVcaizCQICZ/hTYeZsvNJmQklDhUBcrZnIo0+KCDDkphsySrO+IkEazGYKmoK19Ajf0CnW08TIXJ/NmQdxY9c1boCumQx/uFaVfMAlbCdUbMu6OvoP2zasKeDSY8HMPxDQBWprJqTjxjgstem0KTRyYqSNWz5kYJ0x15D2Jebn9AfuR6PwIi5r2/jquihLW0+bMcwOn0IeOooOR/NY/NdEjY0YmEEJTrIOFBjtB3x5oEqi1IkMpxxYg5cVQyj5GnIA49ScyRikNuMC/J4IlEFuLIikPWrGLkGRUHXGfEvNwNgOi7ojrBsjqqKllJe2wMRJoHcexplzVN15lePHll0slEKj4a09nm5mz5Qs2De9kP93RHnKSBpREmAGzsZcUDtZRSXahUsKeECWSpbkPeWQg5qwe04fe9733tkuzK+9UuggIXnRFzgnRHX8GeEj7Ww2ZQJOc42gBYY/KUtpG16c7eCN4X9m7wPoVKH5tmWXXCShLkPd9VOu9BzMvtD/LzpeteioATAzkh0O0IXHPf0y17fuIXFfkRV29ybiquxTf3tbiEvMVVAdqK5tKsdN/tT7fd6+qJW4NIcfmm0xYfnEqOxiXFKRz5cynUeuEqmceI3KXDKU0f7ONWp0cfmFMYt05S1K9bDkl+fFAs6iceuE5+8utS2Ra3mR23ix59sE/+3VJEQT9uxzo9d0ldwefFbjrJaPFJQQrrUuU2by7Nb3HVnHTfJ3Vt93vyxO1ap/zQVihvKc4nMimME8hSvLf58UlJCkdbyXfdEafrMreVzSdr+UkWvXY9/BbXf05hS8UkIvOVlRSuK+9stHXXb4/o2o5deb/aAhc5cTWQlFeXOhfx0dLSHX0F5aO9ZduPqwime77vpGBefO9Gep7tX771rW+le77iUzBMpfPe1f6gYOZ0s9chwDKNnBDYKAi88atXtGwoOSeO3uZc4pMGBQYY/8x2W/FcjSLdd2ls272unrhUssWl7ik+lwiVHE0MIMWIeSXzGJnqCnGoNDH3LxomrBjES3HdRcxJm/oCf1f7aHFJfsoOpIJ7bh6zlOxtFD++sTnliXw98sgjJaV56623pjCQV7d6UlIYyO5hhx2WwtH+8l13xEkavnKV0nS97Pwki1773oMUhnePyVQ5zr8h0MLEEDy78s6Cqe+LWC/Jrrxf60WSd6MUYt4dfYXv/0gTVMoafSf1A2aFJiVk2z+Wlp6feuqpqRQIH2hPxOHWkPJKlrusdN6jXy13ol4wc7rZ6xAQMe91VVq9BaqE1LzapeWQbF8mLasSfKNcGiiQciEhDYeUjsGCQYYBfkMd0mTicosNLTNnzuw0OgY6N9mXwhCukMS80nkkU10hDqUQc1ebSGWBRHTmAitX/+nMa4vrt7ZhVGmJOYkjiT7iiCNSGpAN2lfUCysh3eVYNci2x87SCRIKmSx1VcY3K7dAkGhfbl2lpHcn3hdIjZvIXC9b3REnibjlmbZ6htx15iDFIbl2PfPOvBd8Hu26K++sq0AVjLMr71fBiDI3SyHm3dFXkAU355rq5ZJLLmlBAOEmaFtoG7w3hRxt2nXTUxjfYJ1Wd2h//q2IQt7TvUrnXcS8KNR64AiImKsZbFQEvvnHu1u6KjUnbDU7N92W1FH8K5UlqT9QFjej2Cb9g3DkOwZ0Bg1+nQ3ubjGkxa1HtLj5sPxo0rVbKmgjCkh4Z8+eXdAfN5Ec+cbCtrRJvxAxx28l80h8XSEOQWA6UmVBukw53BY1yXTo3L5z8ktekKgVc0h5Q6pJ3N1BzEmbOiV+Vk9QxeHcrUeURGRdf7aFtlGOCzUKMKPddOZ8o2ELKhfkC6KU75gIFpNGohri+xhSWDcL2mGZggCSDipgxVx3xElartOc8gnxc1ORxZJv8U2oqX7Ip1tyaUGy2xXH5Ni/NprS7Oydzabp5gFbfCNjwSS78n4VjChzM+qlI1UWvFe6ryBOVmfA2a2wtLgFnHTuGzx5VNS5RZfkzy1YtfgHzNI5ZLkjV8m8i5h3hLSeafNnL907UM3F+tafptmVd00vK4unHDTFPnNC+Rsgy0pkAz2zgRPzZNh3xjIF5vn4CiXWGPjFxj02u/FhFMyvsWnKJThp0xHWAEaMGNEuFzwjTuyg4/gkOJu32CjKBjSeE9f06dPtwgsvTB8zYsMnm9Ww15vvsDeNTXTCYUqMD92wAY9NSDjM3bExyaVPxufNKUNYPWCTar65RMJUOo9d2ZxWilWWsHKBFRM2VGIRBIwwh4hVE6wyhMt+6Y+NX5jLy/9SJ5vOsKqDCUU2iGIRpNKbPyM/2FjGVF/WOgz22p1khZeCRycT6QuifGyGTW3YzS/FYdECyxY4wvKhm5122im148mTJ6dNkNhtx7IQmxTDjjkmD52ktbV1wseHXrAbzabQ3XffndvtXPZz58TPhkU2HY8cOTK1STbnkSfs8ePY3AfWYQavXWStF90RJx9+YkMl5vjABVvamPXElCV5waQmWPChL95z3nlwLMVufaEycI+NrrRXNiQXemdpv2xI5Z31yXbKBx8FcyJfMMquvF8FI8rcpB9jM3L+h80yXtJppfuKiJ/N2ZQ9XLEPfcVz6pH3ifzg6Hf5vkO/fv3Cy3rHSuZdmz/Xg1c3MgiImGfA0OnGQ+Da+5+xi2580OYuyX3uvVjKfOXzQ0ftZcfuO7mYl6q6jwkvPmjheq5tnX5kkEHVl1cTcY97HCHvEMv4GFD2GedYEHAdxzTYuywhPYYEYFHA9VDTh0QiDNZbXHrcZm0g7mePDPSQc4hDOAgQhBWyFQ4rB9iIZpBn0CpGzPFfyTx2hTiUQswxsQf5ZsKBgyhCJKkzSA/EwlUP0jP+YJsb8gsphoQxucIkIWYUIWaEY0DHWgd2u7E7DllkwM93lRiIqQe+1IiD8GFVIvsRlPw0ucaizzPPPJMe0S7CckUhv/n3aMOQyizhwQ/tBDzAM+v44ikTlXx762BI+XEd2VunbJj4pC7CUT7emXCkjQUcl3KW9KGe7oiT9waizMeVwvE+0p6yEycmQb5XwSZNmhTeunxk4g2OtLlwvLOkS/sMR5+AhR5XgYtb6x278n6tF0nejVKJOcEq2VdENuLLnFyXapbSVVfaJnr0C6XYdK9U3ivRH0TZdex9CIiY97463aRKBEG/Y/pse+L5l23B0hUp7+OGD7Gdtx5rh0zZZpMh5PmgQ/4gTq6LmgbwLNnALxJqSDRf6EMKXopz6yBJ+kinjsQHks7AjIkvTCMyGGPXF/LSmUPK62oXSVIMyWTAwWEKEPvpSAH5MiAOEt8ZMU8e/U8l8tgV4lAKMSePrGZgb/vmm29OkxruQXLBDbN2sarBfRwSUD5kAunGxnEQr7FjxyapLQM6ZN2tNnQ7MQdbsMHl22dONwv8wVwcH5yCJEJe8stXIEi7W0gJsbvOJIXykwfaXjgkjEi2aceQ/kJmBLOmDfkgUqGv3EZ8rDpA8rBLzXk48s3XG5kclkt0uyNO3j1wQTIOaY52QfkbGhpSPTFBYwJTKYdknPeQFQgmW5EmdQAmtGFWEoYNG9Zhkl15vzqM0B+WQ8wjrkr0FRFXVgLOh9p830I8Knp0dZK2D5iRf/rQUt2G5l3EvFSka9OfiHlt1rtKvRERgNxACJFGM4iiPoE95A1xfOETdQukZp1JTTtLh/xBXiARhdRfOgtf7Hkl81gsjQ25j6SRSUypZWbyAgFAKlnIlvmG5KWUsPElUNoQkyomB6U4JPyo2pQyYSslPtoyNqLBjRWDUuLF3jQfvGGymq8SVCxNiGjg3RnZLBZH/v3uiBOSzvvD5JtVr0KTk/x8bOg1aVIHHFFdY4K+Kbtq7ys6wnZTzntH5dKznkNAxLznsFfKQkAICIGSEeAz4UiSkcSiMrOpOCZ+bo4ureyg+ysnBISAEBACxREQMS+OjZ4IASEgBKoCATY/8mVMpOVstsx+zbAqMthBJtxyTdILd3OIabNxB171SAgIASFQ8wiImNd8ExAAQkAIVAsCkG72H6ArHI7Nl1jmcVvK5uYL7YwzzohHm8TRzRomPXc3ZZc25m0SmVYmhYAQEAI9hICIeQ8Br2SFgBAQAlkE2DPgtuOTtRMsm2CeEFKObjkOaxNs4OwJ/fZsPss9Z7KBxP+8884rN6j8CwEhIARqDgER85qrchVYCAiBakUASxGYX4SkZx12mrGlvqmR8mwZdC4EhIAQEAKdIyBi3jlG8iEEhIAQ2GgIsFkSc5v+tcxk3pAP7sQHoDZaJpSQEBACQkAI9AgCIuY9ArsSFQJCQAgIASEgBISAEBAC7REQMW+Ph66EgBAQAkJACAgBISAEhECPICBi3iOwK1EhIASEgBAQAkJACAgBIdAeARHz9njoSggIASEgBISAEBACQkAI9AgCIuY9ArsSFQJCQAgIASEgBISAEBAC7REQMW+Ph66EgBAQAkJACAgBISAEhECPICBi3iOwK1EhIASEgBAQAkJACAgBIdAeARHz9njoSggIASEgBISAEBACQkAI9AgCIuY9ArsSFQJCQAgIASEgBISAEBAC7REQMW+Ph66EgBAQAkJACAgBISAEhECPICBi3iOwK1EhIASEgBAQAkJACAgBIdAeARHz9njoSggIASEgBISAEBACQkAI9AgCIuY9ArsSFQJCQAgIASEgBISAEBAC7REQMW+Ph66EgBAQAkJACAgBISAEhECPICBi3iOwK1EhIASEgBAQAkJACAgBIdAeARHz9njoSggIASEgBISAEBACQkAI9AgCIuY9ArsSFQJCQAgIASEgBISAEBAC7REQMW+Ph66EgBAQAkJACAgBISAEhECPICBi3iOwK1EhIASEgBAQAkJACAgBIdAeARHz9njoSggIASEgBISAEBACQkAI9AgCIuY9ArsSFQJCQAgIASEgBISAEBAC7REQMW+Ph66EgBAQAkJACAgBISAEhECPICBi3iOwK1EhIASEgBAQAkJACAgBIdAeARHz9njoSggIASEgBISAEBACQkAI9AgCIuY9ArsSFQJCQAgIASEgBISAEBAC7REQMW+Ph66EgBAQAkJACAgBISAEhECPICBi3iOwK1EhIASEgBAQAkJACAgBIdAeARHz9njoSggIASEgBISAEBACQkAI9AgC/w8AAP//phCehAAAQABJREFU7J0FmOS20rUVZt4w882GN8zMjBtmZmZmZmZONsy8Yd7ADW2YmeGGqX+9ylfzezzG7vZs98yp55npblsWHMn2UamqNFTNi5MIASEgBISAEBACQkAICAEhMEQRGErEfIjir8KFgBAQAkJACAgBISAEhEBAQMRcA0EICAEhIASEgBAQAkJACLQAAiLmLdAJqoIQEAJCQAgIASEgBISAEBAx1xgQAkJACAgBISAEhIAQEAItgICIeQt0gqogBISAEBACQkAICAEhIAREzDUGhIAQEAJCQAgIASEgBIRACyAgYt4CnaAqCAEhIASEgBAQAkJACAgBEXONASEgBISAEBACQkAICAEh0AIIiJi3QCeoCkJACAgBISAEhIAQEAJCQMRcY0AICAEhIASEgBAQAkJACLQAAiLmLdAJqoIQEAJCQAgIASEgBISAEBAx1xgQAkJACAgBISAEhIAQEAItgICIeQt0gqogBHobAjfddJN74YUX3FprreVmnnnm3tb8wu39+OOP3aWXXurGH398t/HGG7vhhhuu8LVKKASEgBAQAu2HgIh5+/WZatxGCPz6669u0KBBDoL13XffuT/++MNNPPHEbpJJJnGTTjpp+D700EO3UYsar+o777zj+vfvHzKafPLJ3Q033NB4phk5PPTQQ+7bb78N5HaBBRbISNl6p/baay/3wAMPhIodddRRbumll269SjaxRkzW3nvvvcI5ci/NM888hdMnJXz33Xfda6+95j766CP3559/hntzmmmmaWjCWEWev//+u3vmmWdCPT///HM3zjjjhGfIHHPM4cYYY4ykptV97M0333SvvPJK3dcPM8wwbpVVVqn7+uiFf//9t7vjjjvcX3/95aaddtrC/fLWW2+Fyf9XX30Vrp1gggnchBNO6Oacc0438sgjR4vI/f7LL7+4J554ImDPs2TMMccMeTFOpptuutzrlUAIlEFAxLwMWkorBAoi8PXXX7tTTz3VDRw4MJDxtMsmm2wyt8EGG7gVV1zRDT/88GnJetRxXmwrrLBCIEFzzz23O+ussypr36effupWXXVV988//wR8b7/9djf22GNXVl6zMz7xxBPd1VdfHbK98MIL3ayzztrsIloqv7333jvcM0Urtdhii7njjz++aPJO6V599VV37rnnBsLV6cT//Zhhhhnclltu6RZeeOGk04nHqsiTyfyVV14ZxgH3TlxGHHFEt9pqq7nNNtvMjTXWWPHTdf2++OKL3ZlnnlnXtVzEswwi2ww54YQT3DXXXOP69OnjrrjiivCZlS8T//3228/xmSSjjjpqmDSwApX3LOC5AQ6Uz8QoSWaZZZawmrXIIoskndYxIVAaARHz0pDpAiGQjcBLL73kdtxxR/fzzz+HhGhpppxySjfVVFOF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CAgBIVAMARHzYjgplRAQAkJACAgBISAEhIAQqBQBEfNK4VXmQkAICAEhIASEgBAQAkKgGAIi5sVwUiohIASEgBAQAkJACAgBIVApAiLmlcKrzIWAEBACQkAICAEhIASEQDEERMyL4aRUQkAICAEhIASEgBAQAkKgUgREzCuFV5kLASEgBISAEBACQkAICIFiCIiYF8NJqYSAEBACQkAICAEhIASEQKUIiJhXCq8yFwJCQAgIASEgBISAEBACxRAQMS+Gk1IJASEgBISAEBACQkAICIFKERAxrxReZS4EhIAQEAJCQAgIASEgBIohIGJeDCelEgJCQAgIASEgBISAEBAClSIgYl4pvMpcCAgBISAEhIAQEAJCQAgUQ0DEvBhOSiUEhIAQEAJCQAgIASEgBCpFQMS8UniVuRAQAkJACAgBISAEhIAQKIaAiHkxnJRKCAgBISAEhIAQEAJCQAhUioCIeaXwKnMhIASEgBAQAkJACAgBIVAMARHzYjgplRAQAkJACAgBISAEhIAQqBQBEfNK4VXmQkAICAEhIASEgBAQAkKgGAIi5sVwUiohIASEgBAQAkJACAgBIVApAiLmlcKrzIWAEBACQkAICAEhIASEQDEERMyL4aRUQkAICAEhIASEgBAQAkKgUgREzCuFV5kLASEgBISAEBACQkAICIFiCIiYF8NJqYSAEBACQkAICAEhIASEQKUIiJhXCq8yFwJCQAgIASEgBISAEBACxRAQMS+Gk1IJASEgBISAEBACQkAICIFKERAxrxReZS4EhIAQEAJCQAgIASEgBIohIGJeDCelEgJCQAgIASEgBISAEBAClSIgYl4pvMpcCAgBISAEhIAQEAJCQAgUQ0DEvBhOSiUEhIAQEAJCQAgIASEgBCpFQMS8UniVuRAQAj0Ngeeff96dd955bqSRRnInn3xyT2ter2zPTTfd5F544QW31lpruZlnnrlXYqBGCwEh0BoIiJi3Rj+oFj0UgV9//dUNGjTIffzxx+67775zf/zxh5t44ondJJNM4iaddNLwfeihh+6hre+ZzRo4cKDbe++93aijjuoeeuihntnIkq364osv3OOPPx6uWnTRRd3YY49dMochl/ydd95x/fv3DxWYfPLJ3Q033DDkKlNhyW+++aZ75ZVX6i5hmGGGcausskru9b///ru74447ctNFEyy55JJu9NFHjx5K/P7uu++61157zX300Ufuzz//DM/RaaaZpqHJVBV5JlY+5eBbb70VJoVfffWV++uvv9wEE0zgJpxwQjfnnHO6kUceOeWqcod/+eUX98QTTwTcvv32WzfmmGOGMsBuuummK5eZT93MOje7bqUb04IXiJi3YKeoSu2PwNdff+1OPfVUB4mDjKfJZJNN5jbYYAO34ooruuGHHz4tmY63EAIi5l0744gjjnA333xzOLH++uu7XXfdtWuiFj0CUVlhhRUC0Zt77rndWWed1aI1baxaF198sTvzzDPrzoTnE+QuTyC6a6+9dl6yTuevvvpqN+2003Y6Fv3x6quvunPPPTe1/BlmmMFtueWWbuGFF45elvm9ijwzC4ydZEK43377OT6ThIk/E6GNN9647onuP//8E/r8mmuucUyYkmSWWWYJZSyyyCJJpzsda2adm123ThVt8x8i5m3egap+6yHw0ksvuR133NH9/PPPoXJoP6accko31VRTubHGGst98skn7sMPP3Rvv/22+/7770MaNIw8PNtJ09h6yHdPjdqBmDMG0WCPM844pUlSWRS/+eYbt9JKK3VMQNHy3XnnnWFFoWxezUh/4YUXhross8wy4Z4rkucHH3zgwGyxxRYbYvUuUs9G0kSJ+bLLLls4q7vvvjuk5Rl23XXX5V739NNPu+233z6kK1oOz8vxxx8/Me/77rvPHXTQQWHiNNRQQzmIJHVhosBzFNMyU35stdVWjr88qSLPvDKj55955hm35557hncEKwV9+/Z1M844Y3j+syLApIExCXmdaKKJ3BlnnOFQ4pQRMDnggAPcAw884MCN9w9l/Oc//3Eojlg9oaz//e9/IdstttjCbbPNNqlFNLPOza5baqXb9URNIgSGIAK3PvNmbY9L7q8td/g1tTn3vDD88Z1jnGs38Q+82uKLL16bY445av4lX3v44YdTm+AfTrVbbrmltuaaa9Y22WST1HQ60VoI3H///aF/vYaptSoWqc0VV1wR6uhNNCJHq/nqtbChLK+xrHkb7fD9kksuqaawArkutNBCoQ5+AlUgde9JctFFFwVcNtxww8KN9iZKtXnmmSdc5018Cl132223hfRea14ofVYi7rW55por5Mf48uY4XZJ7E5DaoYceGtLw3D3nnHO6pIkeqCLPaP553ynfMN1hhx1qXoGTeImfdNRW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jTnmmCEvxvF0001XJiulFQJCoCACIuYFgVIyIdAoAp9++qlbddVV3T///BNesrfffrsbe+yxG822W67npbzCCisEgjn33HO7s846q1vK7c5CXn31VbfxxhunFnnIIYe4FVdcMfW8nSCfc889NxAaOxb9nGGGGdyWW27pFl544ejhur5XUVYVef7xxx/uyiuvdFdffXUgePHGjjjiiG611VZzm222mRtrrLHip0v/3mmnnVLxn2iiidytt96amOeHH37ojj76aPfcc8+F+zQpEeR2hx12cGuvvXbS6aYc++STT9yGG27ofvzxR7fVVluFv7yMmTzvt99+js8kGXXUUd0qq6wSxnjec4dn1JlnnumuueYax2QqSWaZZZaQ1yKLLJJ0WseEgBCoEwER8zqB02VCoCwCJ554YiAmdt0WW2zhttlmG/vZrZ8XXnihgyyhOZxqqqkKlf3BBx+4l156yS222GKOl3xPk48//tidc845XZp19913h2NFiPl9993nDjrooDCBQasKeZlyyinDRAzS9/zzzwfcybAo4epSof87UEVZVeT5888/u1133TW0naqjJQcXtLjffPONe/311x1jC2FVAUKIVroRueyyy9ybb77ZKQvrxzRijqnWSSed5H799ddwHRp8NMNTTz116E+056+88or76aefwnkm2XvvvbcbbrjhOpXT6A/K33TTTd3bb78dJm88N/I09KxC7Lnnng6sRx99dNe3b18344wzhok/WncmW2AM4ab9Z5xxRurqD8+FAw44wD3wwAOhXJ4P5PWf//zHff311wED8vzf//4Xmjokn2ONYq3rhUArIiBi3oq90ovqdNugt9wjgz90r370tfvqx59Dy8cdfRQ346R93MJ9J3MrzTVtj0ADzRcaZ166a6yxRjAF4cV/xx13OLSF3S1oa1mmPu6449ziiy/e3cW3VXngQ//lEfOBAwe6fffdN5Cffv36BaKE+UNUIDasNpjGFs351ltvHU1S6HsVZVWRJ6YUaMEHDx4cJidosldfffVOZhm1Ws1h4sVYxPwC4n7FFVe4cccdtxAWRROh/T3hhBMCMTX87drjjz/eDRgwIPycf/75Qz8ycYgL4+Diiy92l19+eTjFPX3ooYfGkzX0e5999nH3339/IM5MMPImwfTb/vvvH8xW5ptvPnfssccmmqxgjgL+fLIqwepFnz59OtUVUo6ygAk4z6UjjjjCLbroop3S8IM+u+CCC8LKEL/p4+22246vEiEgBBpEQMS8QQB1eX0IQMjPvud59/n3/2qf0nKZYMxR3bbL9Gt7gn7RRRcFQobW6dJLLw0mLWjg9tprr0qXxNNwFTFPQ6br8SLEHC0qhBOTH4gdBDDLJviUU04J5HOYYYYJn3EC37UW//9IFWVVkSc1vuSSS4J2FizABGzShBUFVhGYvCy55JLumGOOSUta1/EsYo7mnntxiSWWcOuuu26uhvqwww4Lkyv677bbbnPjjTdeXXWKX8Sz4fTTTw/EGuzyVrP+/vvvYJ6CPf1SSy0ViDR1ShP8KDDDeeONN9xyyy3nDj/88E5JWTU48sgjw9iFeKN5z5Kbb745lDnssMMGos/qkEQICIHGEBAxbww/XV0HAsfe9KQb8PjgUlf2X6Cv23u1+Upd0yqJ0UJhmwxp40XICxF725NPPjks2fMyxMGrO0XEvDjaRYi5mSmNNtpo7pZbbgnmBFkloHFcf/31g7nFbLPNFrSPWemj56ooq4o80X5jN/7bb7+5ouYOON9ikoGwsoA/Q7Mki5iXLeO9994L0Ym4DuyaYWf91FNPBY025iZovZkk5AkmLKapxjxt1llnzbskmKgwCUHQyEfJ9+abb+5efPHFgHtRP5J11lknmN0stNBC4ZmWWwElEAJCIBMBEfNMeHSy2QjUQ8qtDu1Kzk2rhFaNJXS0S9iCEmmBT5zN0HaVEUxisAeGyOAohpaRJW+ivaCVXHbZZYMNbzRPyJE5cmEjaoIzYlQgjFwfFxzLWAZHo0jdEV7iaEKZWKDpw761qEAkMGFYcMEFu5hzQFwhKmgj33//fffFF1+E9mFeQPtWXnnlECEirSw0iZie0M7tt98+2MWnpc07nkfMIVL0H5E8dtxxx0wH0mhZRLvAtABhckZ0kjypoqwq8qQdV111VbDZJpIH475oRBDsq19++eVEjW4ePlnnm0nMwYyoSkTb4b5gtaQRiTp74oDMOCoiREfi+UGkGWzCs7Tllh/PHEg/ZkYbbbRRxxjk/NJLLx0UCIxLzhUR7ns0/TzXMKuhLhIhIATqR0DEvH7sdGVJBDBfOXjAIyWv6pz80P4Lt5VZCwRzzTXXDI5X8ZcdGnM052is0FwVFezSscflBZsmmA5gu0xkB9PGo9Eyx7a06zi+2267ufXWW69LEgg5odh22WUXt8EGG4TzEBQiPWCWwxL5Jpts0uW6pAOYTkDusXOPa/og/zjVxZ33ovnQPuqRFhnj8ccfdzvvvHO4pNHwjnnEHIdOTDAQJhJJtsnhZOwf2GGygd0ydaWv8qSKsqrIk3Yw/ohustJKK7mDDz44r2kd543Qs/rA5BPC1wxpJjFn3FpUndNOOy3TRCev7lFnz3nmmSdMcO2ezbvWTIUwebn22mvzkofzjDuIOc6bOLaabT0nmfSywldUY881+ANgmoXIZyXAoH9CoCEERMwbgk8Xl0Fg+SMG5NqU5+WHzfmdB/wbTzsvbSucf+SRRwLRRVsIoYZsmEBmieyAdpfwesRyzhNemNddd11IRhxhiCmmEDjMEXUBTSOaMzYCQqLaN+xLmSggaMYQHM0gnlFB4zXCCCNED4XvScScE2aWE10R6HJx7ADOc6eeeqqbaaaZgh2yncbpjAkMxJ0IHUwQIAvkzTEmBtdff31HvHHab8vylgefaCDBlvYSRQbnvnolj5gTRQSHQGKc33jjjaWKMUe/oiEoqyirijwxX4G4QgKxWc6LGx4FjfjpNuHCzpnx3QxpJjFnNYeJKNFSWA0oOhlLagcOw0xAiJbCfVEmnvtdd93lDjzwwDB54VmT5ddgZbPKhcmKCatu9lzC9IiJcVHTI/LAlAaTGoRnxO677x6+658QEAL1ISBiXh9uuqokAs3QlluR7aQ15wX33//+12GHuccee1gTOj5ZBr/33nvDsjhENUsgpOYQh/Yb7VRSqDbIEMvbmEegSUOrFjcjqMfGPI2Yo7nHbh4tYhESFnVYO+qoozomCZiCUMaXX34Z6n3eeeelmqtg/4pDLZJWJmH4iAYCKWxkeT2PmBMe8c477wwTHPqkjEA8CdFYlNRXUVYVeRJ6kokRgkYWzWxRYTI177zzhglrWt8WzSuarpnE3FYDuI8IsVivsFKGxp2JMJO7+KY9TEb5g3AnxR4HZ8g0mGG6VSTOPqZnYGGCOQyrSggrGygQcOJEE540Qbfr+MRpljIx6UGY8HNPS4SAEKgfARHz+rHTlSUQ2PPSgW7gy++XuCI96RIzT+GO3zjfMSo9h+45g/aXMGIsS0OSk2IzE18YrTaaNwhMWhQGtN2EZmOZGZtsNMBJpDzaMjRh2MEmadGaScwpE3KCCQLxjrE3zRImIkxI0DJif292sZBaluOxtT7//PO7hHKL52kOi9gwoznMwyN+fdHfecQczSkaVOyMaVcZsckW/gEPeXv7PKmirCrytLFPe+65556wopPXtuh5s3VOM6uKpi36vVnE3Oy6uWcZ61HnyaJ1IV3U2ZMoL+a3Ec3DJqBMVIg9niRoqB9++OEw+WaiFyf3dg3knfyYAEDmeSYh0VUJJrOYVJEWPw7CMNr9afnYJ74frG59//334ZnEfV105cfy0KcQEAJdERAx74qJjlSAQDPMWKxa7WLOgokFZiUQuyxNqmnVs2xxTbOGcyUkNE+TZVilfTabmEd3NUWTzQYyaYJTGZpsNp3B0RTBKRXNNtrBos6wrAxgpoLGHnzBuQrJI+a0gfBzOC3iaFpGbJLCNU8++WTu5KKKsqrI00y4irYrjhl+GRC/ZsbHbgYxf/TRR4OpBmMv7jMSb0PW76izZ9pqGtcXIeaMfyLZYE4CiYZ08yxhgsuED9MgFAA8i/C9wCwMcs5EH2FSzfPAhHRsMIQSAE06/hNMPjC14f4kLzZaAk/8IxjzHGeSQjhYNO0SISAE6kdAxLx+7HRlCQTm2usi9/c//9o3l7gsMekwQw/lBh23WeK5VjlITGbIBS/wPKKKphQzFzS+2KsmbawCQUELudZaawXHyEbb2WxiTn1w2CQqA45l2MInCWY9TEQwrWGCYSYm0QglmIVAHooI5Ihr0e5hklGF5BFz6xsILpONMoLZAOYDECo0qHk7PFZRVhV5mg02WEDS46ZUeRjRn0z22OyG8dIMaZSY4ySLk65tEoZteD3C9WCOvwQbUZ199tmpWukixJw6EGGFzYBuv/32TlViXGE6ZsLkl/uU5xKOxwirU7PPPrslCZ88axjLmJeZxPPCtAYCz7PEVrvmmmuu0B67Rp9CQAiUR0DEvDxmuqIOBHobMUfry5I3mmOzhU6DjZcku4HidBUPX2bXEL6QkIgsLaMRa1SqIOZmvoDpDrG8kxzi0OxhYoNTJ2YKJjhNmm1qGcKD5o/NVapcQs8j5mZKgK0tdr5lxCKQ4LyLyUeeVFFWFXkSUcci+zDZRNtaRogLjiY4HoqQvJiIpQnmYmmhBhsh5oMGDQpEFadW6oYpWdHIKfG6ml8Jk0+0y0m243ZNUWJu6dHoswqDVps48pixsXkVf9wj+KYgaLw3+b8IStx7+DjEBV8PJo5MrJgkoR1HCz/NNNOE/PAhYAdRxCbIPKeYIEiEgBCoHwER8/qx05UlEOhNpixRe3CcNU0zlQUXttVonVh6RmMc1TBi70kYNQh8fNk5K8+sc1UQc8rjZc9Ln3CKhDOMCo5qFu8Z2/IoWcPRk796pUy4uLJl5BFzHBSx12U7dGI6lxEc/zBTwi4Ykp4nVZRVRZ6QQhyCESZPM888c17TOs5j1oRvBIKj4qKLLhq+8880sx0HYl+yTCnqJeZo/5m8UC/GAhPIekM4mkkahJnxTlSiLClLzLPyip5jEsgkH8E+3VauomnKfOe+ZpUwPuEuk4fSCgEh8C8CIuYaCd2CQG9y/iT0IcvDCBqlIpo1lreJaoJE44SHA/4f5B4nK8wesB9tVKoi5mYzTfg1tG3RCQZaRhxcaYtFl7F22MSE35DVsjLSSCN1WY4vm0da+jxiboQPcoN9Lkv+RcXMSHD8wwEwT6ooq4o8mUTiwMmYLWuLHTWDYcIT3XgJTTz22WnCuJtzzjkTT1s7mRCieS8i2GSzyoO9dZEt77PyjJq3kc5CFGZdQ6xxk3h6njNpjp52TdonewdgQkNIUibJjQh9bZstpTmxNpK/rhUCvQ0BEfPe1uNDqL29JVwiS904VUVtM8tCzu6dmIJEtXJESmAXy2hc8rL5RtNXRcyjoRBxfrV41BAMcGHykaRBZQkem1YirEDui0xmou2p8nseMWeZH5toJL5ZUla9wAR7fIhN0Q1dqiirijxp96GHHho2XCprZsRmNZh4NHsVpCwxx4QDe2xCAWKiAelsZFyyxwAOws0StO/1RIRhvKHZfvvtt+tyWI7X//777w/7IbAKQDz2RrXv8fz1Wwj0NgREzHtbjw/B9jbDnKXVI7KY5hdNMY5YZV5SLP9D8HhxxjVPtqQNaWd3yUYIAkOgKmJO3rZ5EHarhAOkrraEn2ZzT1QHyA8Tm2aZ61CXZkgeMacMiA7aXNJiblFELIY5hAZyE11dyLq+irKqyPOh/3Nqpv8h2kW0u0xW2EkWe2ZWE9i8pllShpiz8oEtOE6VTChZqWr0noPgY+ZWRlhZYoJAXHE2gooKtunRyXv0XNZ3ViEwX0IwnyrSL2n5sZKAkzuTO2zvCWEqEQJCoDEERMwbw09Xl0CgGVrzVt5cCEKNY6aFQrMt4UtA1LHBB85aV199dcelvPhwtqKMorvrUY+k2OlkSnQGNgeJhizsKCzlS9oGQ/HkkGxMM9COQ7JZ5sb8BmeyLM0wkxFMDKgzy+xRG/R4GfYb+/u8SCaWtt7PIsQcTaE5rRbZxRUsIDRgVHYVpIqyqsiT1RN8DYg+QrQOiGUeuWW8QBbxtcB5GqfYZklRYs6KDbtpUn8mykQeyat3s+oYz8ds6rPimMevyfrNvYk9+LfffpsZPSkrj+g5Ni8jvjoTBMIlTj/99NHT+i4EhEAdCIiY1wGaLqkfgWNvetINeHxwXRn0X6Cv23u1+eq6tjsusiVdbIwhmGi3y0o0mgWOhDgUmvDbNu9BwxmNamJp7BPNPY5zkEq0fdhgR4XYxIR/S9NgR9Pa96LEnPS2uyD2vkwoIDcQbexZ00jOF198EeKaY5cMdpDzpGgRVh+0muyaCS5JWENCsOutZ7nfyuCzCDEnHfGcn3766UAqIStpjn1E1wF/6kbkmuuuu86NOOKIZNEhaCKJjc6GTUl4NbMsK7SKPNn+nXCHTKBwBsW8Jak91OHKK690J598cqhO1AzK6tfoZxFiTghP7hcmwBBYJlv1TPzy+q9oW5pJzImaREhRnLDRtvOMwHSsHqF9jHGUB/RtM8Na1lMfXSMEehICIuY9qTfbpC31kPNWJ+VAbxvnoI22peJ6uoTlezYLidvmQhbYpZFzCE6UEHQIIGSH8HKESUP7abv6QQD5i4tFQYF0oDWHNOGoihMqk4r+/fvHLwmaerSfSc6p8cRo61k9oM4W/7jILo60jfx58UMeiPKCE2GfPn1CEZg4QFiJKmFOa9tuu63bfPPNO1UBkwFMItBIE4rStNmdEhX8UZSYowWnLh988EEIU8eEBK04kwv6h4kH2lhMfZh8sFkUkwrId1TQ1IIdqyTzzz9/ojNss8qKlltFnuRvZkx8ZyWIvmLCBimkf/CdYMJpYRBZbSHsZBqBJ596JI+YYyLGxAHBfAX78qKCOZKZlRTpv6L5FiXmrDIwvhg3bApkkwnGGbbkmMPQfu5H7iscsWedddbEaliYSvoB8xSbNNIuxjb3H74UbACFECaUFYYyTs/hQv0TAkIgEQER80RYdLBqBDBrOfue593n3/+UWRQ25dsu08+tNNe0memG9Em0z0aAIV4zzDBD3VUiEoSZwaBFjC4PY/OKporjaKoQCAGkGtMUXrwIpIZoEmxIlCSEfoN8oz1DyAON9meffRac3dBcWsxju76MxpxrbOdTvieFgeR4krAtOESauO4m2F/zh7bZhN+ks7B8dpxPYqXTfqRMFI5wQexfUWLOZRAhJjo4+pnQF+DLZMMETfmpp54aHBztmH2yU6M5zUKwbLt1O2+fzSjL8rLPKvIkb5yZsZfGztoEwodPgQltZZMmxr4RSzvXjM8sYs5KFWXbPVW2vGjkmaL9V6SMIsQcIo2pGJNWhLHGRBaseSZEhUk85mRJK0yWznwf7DcTyDHGGCPsFxDtPyYjTKJtrFp6fQoBIdAYAiLmjeGnqxtEAIL+yOAP3asffe2++vHnkNu4o4/iZpy0j1u472QtT8it+bygHnvssbCTXyPxuMkPcsDL7r333gu24EnadzTXaMUx5+Dla4QCkxVsutESY9ebJbzIIflo2C0sGy9h7GpxvON7VMoSc9vlkzyS4ppH845/Z+LALqIQOlYBjMBRJyYqOKyhjY6G0ovmQXq07Wj42HCGlYV6pQwxpwz6Ag0lE7TBgwd3EHI0ijjx0bdoGSE2aUKdn3zyyaDdRMueJs0oK553FXlSBs7NTChZ7eC7CX264IILhv4iEktVkkXMn3vuObf11lvXXXSUmJNJ0f7LK7AIMae/UAyw0sUzKB4Rikk7Nupo09lpNE9YbcKkB+d1JhkoA0wYs1NMMUUYv6wqQNglQkAINBcBEfPm4qnchEC3I4AmFk0yWuk4mS5aGZzB0FLyEm9FYRIB2Wa3xDKCNrFMZJwyeRdJC2mChKJpnGCCCQov99vOjNg5Ex2kiNRbVlbeVeRJeZhMYTqDWUU8PndWfdrlXD3916y22fMA0xM041kTwLwy6X9WUSDrmB7xfKhiNSOvHjovBHoTAiLmvam31VYhIATaAgELOUlMb7TJkvZCQP3XXv2l2gqBVkJAxLyVekN1EQJCQAh4BHCUHTRoUDDnaUTjKTCHDALqvyGDu0oVAj0BARHzntCLaoMQEAI9BgHMB4i4M/vss4ewkz2mYb2kIeq/XtLRaqYQqAgBEfOKgFW2QkAICIF6EMDenwgmhHvEkVfSXgio/9qrv1RbIdBqCIiYt1qPqD5CQAgIASEgBISAEBACvRIBEfNe2e1qtBAQAkJACAgBISAEhECrISBi3mo9ovoIASEgBISAEBACQkAI9EoERMx7Zber0UJACAgBISAEhIAQEAKthoCIeav1iOojBISAEBACQkAICAEh0CsREDHvld2uRgsBISAEhIAQEAJCQAi0GgIi5q3WI6qPEBACQkAICAEhIASEQK9EQMS8V3a7Gi0EhIAQEAJCQAgIASHQagiImLdaj6g+QkAICAEhIASEgBAQAr0SARHzXtntarQQEAJCQAgIASEgBIRAqyEgYt5qPaL6CAEhIASEgBAQAkJACPRKBETMe2W3q9FCQAgIASEgBISAEBACrYaAiHmr9YjqIwSEgBAQAkJACAgBIdArERAx75XdrkYLASEgBISAEBACQkAItBoCIuat1iOqjxAQAkJACAgBISAEhECvREDEvFd2uxotBISAEBACQkAICAEh0GoIiJi3Wo+oPkJACAgBISAEhIAQEAK9EgER817Z7Wq0EBACQkAICAEhIASEQKshIGLeaj2i+ggBISAEhIAQEAJCQAj0SgREzHtlt6vRQkAICAEhIASEgBAQAq2GgIh5q/WI6iMEhIAQEAJCQAgIASHQKxEQMe+V3a5GCwEhIASEgBAQAkJACLQaAiLmrdYjqo8QEAJCQAgIASEgBIRAr0RAxLxXdrsaLQSEgBAQAkJACAgBIdBqCIiYt1qPqD5CQAgIASEgBISAEBACvRIBEfNe2e1qtBAQAkJACAgBISAEhECrISBi3mo9ovoIASEgBISAEBACQkAI9EoERMx7Zber0UJACAgBISAEhIAQEAKthoCIeav1iOojBISAEBACQkAICAEh0CsREDHvld2uRgsBISAEhIAQEAJCQAi0GgIi5q3WI6qPEBACQkAICAEhIASEQK9EQMS8V3a7Gi0EhIAQEAJCQAgIASHQagiImLdaj6g+QkAICAEhIASEgBAQAr0SARHzXtntarQQEAJCQAgIASEgBIRAqyEgYt5qPaL6CAEhIASEgBAQAkJACPRKBETMe2W3q9FCQAgIASEgBISAEBACrYaAiHmr9YjqIwSEgBAQAkJACAgBIdArERAx75XdrkYLASEgBISAEBACQkAItBoCIuat1iOqjxAQAkJACAgBISAEhECvREDEvFd2uxotBISAEBACQkAICAEh0GoIiJi3Wo+oPkJACAgBISAEhIAQEAK9EgER817Z7Wq0EBACQkAICAEhIASEQKshIGLeaj2i+ggBISAEhIAQEAJCQAj0SgREzHtlt6vRQkAIdCcCN910k3vhhRfcWmut5WaeeebuLFplCQEhIASEQBshIGLeRp2lqrYuAg888ID7/vvv3bjjjusWWmihhir67bffuoceeijkseSSS7rRRx+9ofx6wsVffPGFe/zxx0NTFl10UTf22GO3TbPeeecd179//1DfySef3N1www1tU/eiFf3uu+/cgw8+mJp8zjnndJNNNlnq+Vqt5l577TX36quvOsb/zz//HNJPN910bppppnEjjzxy6rVFTvz+++/ujjvuKJK0I03Re+/dd98Ndf/oo4/cn3/+6SaZZJJQ50YmYNT3mWeeceT5+eefu3HGGcdNOumkbo455nBjjDFGRx31RQgIgZ6HgIh5z+tTtWgIIHDeeec5/oYffvhAAMYaa6y6a3HGGWe4Sy65JLzgb7zxRjf00EPXnVdPufCII45wN998c2jO+uuv73bddde2aRpEc4UVVgikbe6553ZnnXVW29S9aEUh1BtvvHFq8kMOOcStuOKKXc5DyK+88kp36aWXOsh9kgw11FBulllmcUcffbQbb7zxkpLkHoM8r7322rnpogmuvvpqN+2000YPdfpOm88991z3xBNPdDpuP2aYYQa35ZZbuoUXXtgO5X7+8ccfAQ/KZtzEZcQRR3Srrbaa22yzzVwjz5h4vvotBIRA6yAgYt46faGatDECvEQhHrxYt9566/BCrqc5v/76ayBxP/74o9tzzz07NK315NVTrvnmm2/cSiutFLClTWhP77zzTjfqqKMOkSZeeOGFoS7LLLOMm2qqqQrV4YMPPnAvvfSSW2yxxYZYvQtVtM5EH3/8sTvnnHO6XH333XeHY0nE/Msvv3QHH3ywGzRoUEgzzDDDOFYUpp566rDyxHlwe+utt8J5tMbHH398IOldCso58PTTT7vtt98+pFp22WVzUv97escdd3Tjjz9+Ytr77rvPHXTQQWGyZROHKaecMkzMP/zwQ/f88893jNetttrK8ZcnrBIw4eRahPYyIZlwwgkd98Drr78e8OAcWvkzzzzTTTzxxPyUCAEh0IMQEDHvQZ3Zjk25bdBb7pHBH7pXP/raffXjz6EJ444+iptx0j5u4b6TuZXmStdYtVp7DzvsMHfrrbeGF+rtt9/uhhtuuNJVvO6669yxxx7rRhtttKB5b3QJv3QFWvACNMwXXXSR69evXzAXQvsJacrS0FbZDDSgv/zyizvuuOPc4osvXmVRbZ83+DDJjBNzTDToP86NMsoobu+993ZLLbVU4j2DSccxxxzjILzcU2iTp5hiilLYcD9SB0j/gAEDSl0bTzxw4EC37777un/++SeMSSbQcc36119/HVZGeB4gaM6ZsKfJX3/9FbTggwcPDuR+p512cquvvnr4btewuoCJG+Puq6++Cs+ZK664IkxiLI0+hYAQaH8ERMzbvw/bsgUQ8rPved59/v1PmfWfYMxR3bbL9GsLgo5mb9111w3tiRORzEb+30levGussUYgIBtuuKHbeeedi1zWo9NAgFmJgMCddNJJYXkfsxZs+SE99Ux+GgVMxLw4gmnEnBww04IwH3744bma3/fff99xT7CiBGHdb7/9ilfCp7z44ouDhnm++eZzp59+eqlro4l/+umnUD4rZPPPP7874YQTOpHnaFq+n3LKKQ7yzGoAn3ECb+kxXcOEDVM48iTvNGGCggYe8o8dPJMWiRAQAj0HARHzntOXbdOSY2960g14fHCp+vZfoK/be7X5Sl0zJBJvt912wWkLp7WrrrqqVBUeffTRsJTNS/yWW25xE0wwQanre2JitKMnnnhicATEaRLnOog6xAhTgpVXXrnbmy1iXhzyLGJePJd/U6KlxoSknnsLLfO1114bxgvjpl5hLDImWdHiHs1zzGayjU/Em2++6WabbTZ3wQUXdCka7Td247/99pvbYost3DbbbNMlTfwAjrZo6hFWlPBdkAgBIdAzEBAx7xn92DatqIeUW+PagZwTOcQ03TiGEUWhqPBCfvbZZ93SSy/tjjrqqMTLIKSE3mN5/7PPPgsmFRB4bJ0hqUS/yBKuQ2OI3SpkBXnvvfdCni+//LIj+gnaO5zssP/FbAQTg4022igr207nqOMuu+ziICUQmXod9v7++2+36qqrhnbus88+bs011wzlmKMtbcYsARvfMoLWFYIHufnkk0+C5hF7deyJ0VRigww+UYEwESkDIXqICQ5+UYGEJdkwo+HFfIMVleWXXz5c8uKLLwbtKM699EkeyYuWg507Zg0LLrhgFxMJcH/qqafcbbfd5tA006e0jzbRPsbJmGOOGc2u03dwZ8WHdmKXjV18vdJMYk6bzz77bNenTx9ntutF6wWJpb+LEt+kfDFd4V744YcfSplS4RyKaQrCvUt0lagwgWc1iD5hFaio+dqmm27quGeXW265sOoQzbPsd1YC7rrrLvfII4+E+417GOdSni0LLLBA8HvJiwZT5tlStH5JebJiwCQdnw0i1iDY3BMFh/uL1bSocD/QLvxSuAfxXSBC0EwzzRSumWeeeUrde0Maq0bv7yg2+t6aCIiYt2a/9MhaYb5y8IBHGmrbof0XbmmzFh6axKqGEKFZ5YVbRNCorbfeeiEpxJiXRlTIl+OQfexR04SXE0vbaU5r2Mdiz4uT3fXXXx+W98k3KoSV43pIAnbzEEaOjTTSSNFkqd+p4/nnn+944eGgVq/cc889bv/99w/h4SifiBQI0TuIcoKjLaYCkNOiQj5MSHC0SxPMCbAHxnTCIuIQAhNCnye77bZbRz9G00IYMHViwrLBBhuEUxC9VVZZJRChHXbYwW2yySbRS1K/Qwwg95j5QFZnnXXWjrQQD/qX8ZQmtI96pEUpiU4uGw3v2Exifuqpp7rLL7/czTjjjCGKS1r7ko6D7SuvvBJswzEXq0dwyjQnTiY98clbWp70MyYnmGMxaWdcRYWx9txzzwUHZybDRcUIPdp7JprDDjts0Us7pWOywHMqa3wzZlAcUPe0iXCZZ0unCmT8iOfJ6gDPK56HSUI9uQdtEo/SYa+99grKh6T0HIPIH3nkkcFfIC2NHR/SWDXj/ra26LN1ERAxb92+6XE1W/6IAbk25XmNxub8zgP+jQmdl3ZIncd2Fo03pA7NTlxDllQvXsiQRqIw4OgYFV5CENR77703vBQhpWg9cWSDLKM5f/jhh8MSO8viaLrQKhMlIi7RFx3xwAlTN8IIIwRSgIkARAxyzwsO4mtmI7zc0ohctAyuoX6Q59NOOy3TVjZ6XdJ3tM9vvPFGcIrDRCgqvEh5SeIQSluLCE61ONcitJX2YF5A9Auif6B9JB49GwEhOCfiZIrQHiMDrGggaPEhnlHBkRE845JEzElDqMCTTz45rCowESpCriCnkFQmb9FJFRpENLMQdzSITPTQkLNiwTEmBkzGLN447adf48IqAisVtBdtOZFQ6pVmEnNCBNJGxn5ZcxTGJCsHEFAmzPUIk0xs1dG2co+XEcbK/fffH0xOouEyMV+hPpB3xjSRfopKNAQkJjKM5bLCc8ra0rdv33BP8AzinmDM44zKmLFIMfQnE3+bsEbLK/NsiV6X9T2a51xzzRXqgtKAiTL3PitW2NqzusMkldUMJg5gST+x4sOx6aef3uFfMPvss4dnHASXaEDcf6wQcd8y0cmKcjOksWrW/Z2Ft861CAL+4SsRApUjcOszb9Zm3/2CpvyRVyuLf9nW/Aus5s1Yal47m1tVT6Zr8847b0jvX95d0nvyHM6Rn7eT7XLeDnhCVfPL2iHtOuusU/OmF3aq45P8ycfbpIYyvQas5rX7HefjX7zmO6T3RK3mX2Dx011+e7Ic0vtVg5onG13OFz3gw9uFfPzLtOZfvF0u86Sk5s12QhofT7rL+fgBT8hDWtrutcU1P4GIJwm/aaN3Lu1og9esd0nnSUE470lDl3NpB+gPyvakulMST5hrlp83z+h0LumHXy2peZIZ8vIrCh1J/OZWHX0P9p5UdZyLf/EEM1xPfdLK9ESn5ieVNerXiHhiH8ryGuZGsql5jXJHnX3YwFJ50aee1IXrGQd+Ahb+/KSv5ie1taQ+TirgwAMPDHl4s5ik05nH7D7ytuSd0nmC2NGut99+u9O5vB/cX9zHWf2YlQfPEq7lb4899qgxtpKEcryDbkdavyKWlKxW9tmSmEnsoOVJHbnfwc+Hjoyl+vcnx+0+8+ZkNe4Da1vas4tx7k11QjqvaU/Ml4NDGqtm39+pDdWJlkBAGvMWmSD19GrseelAN/Dl95vSzCVmnsIdv/ESTcmrqkwsxF+RmNvYzaLtmWiiicImOlFtFNogtNaYr6ANzbP1RvNLaDZsRJPMKkwDRbvRtqMti9tkRjFhN1O0jdhXYy++yCKLRE93+u6faCHuOpo8T2KCmUanBCV+oKl+8sknM5f3MQvA7CIvMgWaP9qANh+zFzTAedFc0CpjW8vKQVzqcf5M05iTN1pctHVFTDRYNcFeHTMKNlzCURgx50ZWZzAjwg47S8yJEbtmbIvz8MjKK+tcMzTmmICgLfcTyFLmYVYv7gVb5bBj8U80xDhQoollPEXvQUuLuRG2+/VEhUHrjKYZW/+HvG+ACVpQ2oZgukU9ygjtSrvXs/KJ3hO0mXsia7UGjf6hhx4aVvXAhucGqzJRKftsiV6b9j2aJ5pyVhPTzPTII2puxG/6FHO3pPuY84j5rNB+7q+4r0crYNWq9/e/COp/sxEQMW82osovEYFmmLFYxu1gzoJJCZviQKijdsXWBvuE8EIaIcBJRNrCvGGWYmYYdm3ap5k6sJX5Nddc0ylZ9EWHzSjOcHnCjouY5OSZjUCkIdRjjz12CIOX9TLMKjMadpL6044kwTEMExeIAmYtacvQl112WTCr4YULCU0yNUnKP+1Ys4n5p59+GkxHID8QD0wJ0oSJGeYFbESDqQ/CGMIEAnMV+goHxTyhLMxUsLXnpQ+BrkIaJeZMpiDEEC4mrpjuML7KCJNVi2Bi1zGJxEYfzPjktwlmD5iWYe4UFTOtwunSNiuKns/6bhMq0nCf2EQIp0Tu+/jxcKDAP2ypmbBA7uPmXlmX13NPMGbMJyJq5mXl1PNssWvTPqN5Ft2oCR8fbMuRIhFr2LzJTIhwwsbkJSpDGqtWvr+jOOl7ExFoCb29KtHjEZhzzwtrzTJlIa92EFv69hrvVDMQzAVYbvVkL9FswL8Aw3mWkouKd3IL15AvS/VRiS4Nk66I+Bd/h9kIS79p4slKKNdroNKSFDpuuHmikZvea6JDmd5+PDWtJ1IhjddYpqYpc8JMTzxpKHyZLbHHTVksA2/rHerIZ5p42/eQhvKjJiZ+1SAcp7+9HXXa5V2O+0lUuM5rQruca9aBRkxZfGjMYGJBu8jHk61mVatTPt4GufbYY4/VvB9Hh8mL15rXfPSPTulsHPkVjk7Hi/zw8doD1pieeILbcYkn6R19V9SkpuNi/8VP/sP1mMqUEWtL2XvCE91Qnneg7VJcPc+WLpnEDkTzpI+KiJ+0hjpi+uJXW4pcUvMraeGaJJOrIY1VK9/fhcBVotIISGPexEmOskpHYK69LnJ///P/tVLpKfPPDDP0UG7Qcf8u/+anHnIpcFw0rSbL2CyRR8XfrcHZCu0OjnqmOYumQZODRgeHTExaighaenPYizuFRTVQODrGl23T8qduaPfSQrOZIxpacsKSZYXjSyuD4zjooZWjDUnaq/i1OMyi3SRiC9+TQroRvhCTIBxoiRfdqDRbY059zKQB7T/xsZMifljIv/hYwazAwmsS67uosBpDuDmW+6MOiUWvL5KuXo058eqJLsOYo29xJP5/7Z0/rxxXGYfXNRKNseQiYKewlBhXlqiQkKUUiAIpVP4AqVynIEUkW8IFVC7JB4hsaKA1coOIgMaKkoJ0biAFCshCBORyeZ+D39W5c2d358ye9e71fV7J3r27c86eeWZn53fOvH+4Y7NvI/AXFylW0XHbwuUn7f333y9B1pyHpJNsscyggqsKLitpdTYmgn+5K9BijJG7Hrg34WIz1eaeE/n7wV0n3Mhqy/d4reW3pe5j+LzuM0T6pN+VdPtoCdLNOw9jdy0PzeqYz+/h8fLvPgQU5n042ssWAufNlSVxZCq0sWwrmd8YMYa/8PCijHAn5SC3kOfacEKQFzp83xE9Uy19N/HDREAMc5NTvRFBOcf/th5DVkqcWjodAUeWDlyHYI1/fW01w10yctR97kOY03+m9COdIu5PtX355Zcr4TX8rqSPbL19y3PywVN8Zx82R5jjvsIkBOHH95TvxKsQ5bn/VODEZYbzEten9PvOTEBzqocyscAlYlgcie8tk12MiRIT8KmGiwNxEBjVQm/dulWeb/tvl3OCiUueY/jK4zOfNve3JduPPWafZE0h89QUy/gJ2JC9aIrdvn178ezZs1PuhMfA6pjP7yls3aadgMK8nZktZhA4b8Gfiaj2ISU1IQF+afipRvaR4t/LKs+YscqO/znBg0Pfx7Hth6/hL5vCgvfyQjcMQhu2G/ubHMakJUNA4veblsFRiGT84K9evZpvNT3i75v5uWlYj3tTR9xRwEgTSYn3oQ95MmRlHb//XW1fwjz9kMlLzep/XWiGOyAUU2JfmGzVhqjO7w8CsNUIAiaN3D6sVZgjNlmZJsiS/eeuSZ2nfR9jHPZJTnEmeVhdJIx4BwQwIpEV4Qy8HbYf+ztTPfL9pjZAGpNuAjg5x6cEd2c7HmGU5yExFlPSsmb7PCdaq+cixiODSwkUZWGByUvaLr8t2cfwcU6fPYU54zk0q2M+v4fHy7/7EFCY9+FoL1sI9CgulB9x7EWGcpw8cuGloAl5c3FLYdUNi9Roi/A7Ls+HRWLKiy//SzHMxTC3r99vfT7nQpefQbXFDz/8sLi/4K6SBX9yRYeMJ6xuzrUMsprbnna4cgwLyCTDsYC1OZ+1L2EeKd2KGw/uJXXe+K+//roECONeMbaq+sknn5RgUNyHEPe1WJqzfz3btAhzcnoT1Ep+aSaOiPKWFeRe465Xosl9/847/88ARZAud2ewTefscBwcP/rgt6DuL7cj2wkFi1pdivLu0pw7HnlOEEycVUlzPJseuZPAHQUCrblDVtsuvy11P/XzOX32FuaHZnXM53d9rHzekUDcqtEk8EoI/Ohnv1ruGgBKH2fNYqWzBBYR+JXBeQTcEdQWF8aNu5M5p8NXfeN2U9/MYKrwTZ3aZLVd+H0vY8WvjJu8vliImGVkASmvhaBabdv6hLzi5B6GyUcffVRyKvN5U//FhKe0Jc/xMGdxMmTsw/dax8n2+wj+zHHE5OTUfmQee4LQxiyE3yoXc9zuH9vkYK9NDf4k8DFcJMq+h0vGckpu+n3tFPnE+R7y7/PPPz/xMRls3JLLPHOYxx2v0ZzpkZqzfBa51smtPsUIaky2fL9bLc8J6h60nBNRlKqMNWIaTn3kLr8tpzp7+cKcPuOuRhljTDjWdXvq9dyvKDh06r1Dszrm8/sULF/oQoA0UZoEXgmBHkWGjr240BjIWOlcXUTD1aAUyOAizYW/LhIz1paiQVkcpTXzwlh/cy50dT9D4RirZmU/ECy7WPitl36iUuXG4jjrPoMMGskpVtlObFYz5KI9xcKne+1m4XpQxvrxxx+v3Wb4xrasLLk9F+EU/ohsJiZZNIpjt85yohcrukv2d4rFCu6UzXbaJsXjWLaL7JgMM+HqUZiy/abMP9mm5TFcLk5kQtnWNoU0hWfq7De0izsSZZycu0+fPt3WVZmI5/Hk3B8zjnF+PyKF6SShHKvCZRxMsMcKcI19Tv1afU6Em1T91trnEUi+2vexIk+7/raMffCcPnsL82Ngdazn99gx87XdCSjMd2doDw0Efv6bPy3nrprT9qxaBCGVixrCI5+zgstFeZtxQc8VvHUX9+yD1G/ho7uMokX50onHORe6uoOhcIygqTK28ImuN2t6jkDMKn2sfM819htO4QN/qouaIaJmk3GHA5EfWUGWTKqGliu761awh9vzdwqvdekS6zYIJfYj/JyXEXxYnpMWb9PKZri/LMNdomzL9ypyd9ddnnrO5AXmtBszjnOPVettwpzPyZSgjH/qivHYmCO70fKrr7468VbEeBQmHLNtTGjIXR/ubMF/XYpS0njyPqKYKqLrjIq+3MFhW1KmvnjxYt2my88++2yVkjTcxTYeayaE9Mk/vqtzLX+H6Ifnmywn5GyLSByzXX9bevXZW5gzrkOz6n1+j7H2teMhcIGhdPSMsSsJbCXwi9/+efHrP36xdbt6g9vfv7746U9OFn6o3z/256QBxD81xNVqqFODvfBNpXAPgaIYfrtx67UE7BGAxvsUGaHwDGnvQpyUwEmC1QiIrG2Oz2bdnudZqTJfJ0MLmVo2VQ7Mbcceyb5BiroLFy4sqJB45cqVsc22vhbiZlUwaZgmEkYEylGUCCOgi7SDN27cKD7ZpJwLIbp48uRJKVbENusKmqRPPePFJ5qsGnAO4VU4kOFhaATvUjhpU7GpbBMrdCWtI2Pm+PKdGUvjltvnI/tG/2Q1oQhPTFBKYGFWAaWCJik8SddHZhfszp07i/feey+7KI8E85KyEp92/PVbUjCe6Cj+2ORjzng4JnxviVegAi7ZeKYY7AlaTWN/7t+/X76DBGxmwCgB1/iqY6TyJPXdW2+9VbKjXLt2rQRysr/EgBBkh48+3MmQFAJ4NJ1HIJ19AAAI3ElEQVQo5xfcKFxEn+++++6CdHuk58O/n3Odfij0RVAnKUkZQx34neOuH+sYC8bGcYlc3CVFIMeCwGv2h6BLLCZgJW3j3JiC4TkBG86Jt99+u5yLSAPSoMKFAmMY7PCvHwZY816P3xb6qW1On719zBnPMbDqdX7XfH1+nAQU5sd5XF77UREM+svffbr4+7/+s3FfqfJ554c3Fz/+3rWN252FN8mjnTmMyThB5g0ycEwxxFn4OpaLfc6luSAjwGLVsVR/zH7I3hKrWqMVEudc6LLffKwrVfIakwYCK+dappSMW/6LBw8ezO2mtMvKmARoMoGoLe5OlMC18CNdVXpkMoGoJrMLF18MrqTro4LgmBEciPgmhSFGHwi5KOa0IDMN+8C+1NYizGlH8CeZPzACIQm2rbO0lDdG/gsXgyKkEZpptOMfudzT+BvBnan68nUew+d5VSmT/WLSNdc2CfPMyz6nb4R8FJxZNSXnOd9tjGA9Jnpp7A/CONyd8qXyiLhHWHM8a7t+/XoR+QjtdYbgZlIWK+arTfje8F1gYpRGPvpYbV0QoDnFCKgk6w7fozT2lcDYNMZNfYSczObrcx45Jxjfo0ePVs2pSsrvChOWel/I3/7BBx+sgr5XDV4+6fHb0qPPfQhzxnUMrHqc30PG/n18BBTmx3dMztWIEOh/+OKvi7/87Z+Lf/z7v2XfL33zG4vvfvtbix9c/85rIcjzgLIyiHDEWPFGfLUaK1isDnIRZOUOkY4gYJWZ1IjhglFW5rl4j1mvi2emEGPVkgnG1EJFwzHVTCLos6wQDrdp+ZuVSoqtsP/rUjeyck16OYQvgjwnOuwLuY9ZJYbjJmO1l+wUrLAzMcJgwF0RUuMNebQK83r1fyyv+aaxITQ5zog87gKkqGNMfEfIpc0K77r0emzPajsrwky6WEWda5uEOXckyI8/x4bCvE4diHhk/2pj0kXqUvJwk6+a84jzJw0xyup0BDKXDDhTUiHyvaFPVsb5HqeIpe2bb75ZznHELOK/xchtzuSRSTzP0zh+ZD7i2EwV+tl22yOCj0I2v490iM+fP19tTsEuJpnUJ6AWwybr9dtSf8acPvclzHNch2a16/md++Hj8RJQmB/vsXFkEthIgBUcVkFJk4dQeZWWBTl4ZOXzrBpiCoasSg/F9NR9QsgwERi6DU1tv+/tmEQgtodFobZ9Lu495Ow+Kxa+3yXVIncXLl26tHXYcGFixnFDgK6bzG7tKDZApCOiWem+fPlyU47zTf3jHsUEghXsqXfXNvU35T2+K3yn4VK7C01pe962OQZWc8/v83asztL+KszP0tFyrBI4AgL4s+PmgZBhle2NN944glE5hPNMgBXxCDQtd47w1dYkIAEJnFUCCvOzeuQctwQORIBARG7hE/RGwSFNAocmQFArfteRbnAVAHzoMfn5EpCABOYQUJjPoWYbCbzmBPCbJniSrBkXL14se8tterJC4AuO2wer5bjRaBI4NIFIG7iINJOLhw8fFh/6Q4/Hz5eABCQwl4DCfC4520ngNSaQKRHxMSVLBf6mBNhFwZUSbHrv3r2Sru01RuCunSECpPQjneDdu3fP0KgdqgQkIIHTBBTmp5n4igTOPQGCvxDnjx8/PsGCAELyRd+8efPE6/4hAQlIQAISkMDuBBTmuzO0Bwm8tgRwaSG1HDmNSdFGoCfpGTUJSEACEpCABPoTUJj3Z2qPEpCABCQgAQlIQAISaCagMG9GZgMJSEACEpCABCQgAQn0J6Aw78/UHiUgAQlIQAISkIAEJNBMQGHejMwGEpCABCQgAQlIQAIS6E9AYd6fqT1KQAISkIAEJCABCUigmYDCvBmZDSQgAQlIQAISkIAEJNCfgMK8P1N7lIAEJCABCUhAAhKQQDMBhXkzMhtIQAISkIAEJCABCUigPwGFeX+m9igBCUhAAhKQgAQkIIFmAgrzZmQ2kIAEJCABCUhAAhKQQH8CCvP+TO1RAhKQgAQkIAEJSEACzQQU5s3IbCABCUhAAhKQgAQkIIH+BBTm/ZnaowQkIAEJSEACEpCABJoJKMybkdlAAhKQgAQkIAEJSEAC/QkozPsztUcJSEACEpCABCQgAQk0E1CYNyOzgQQkIAEJSEACEpCABPoTUJj3Z2qPEpCABCQgAQlIQAISaCagMG9GZgMJSEACEpCABCQgAQn0J6Aw78/UHiUgAQlIQAISkIAEJNBMQGHejMwGEpCABCQgAQlIQAIS6E9AYd6fqT1KQAISkIAEJCABCUigmYDCvBmZDSQgAQlIQAISkIAEJNCfgMK8P1N7lIAEJCABCUhAAhKQQDMBhXkzMhtIQAISkIAEJCABCUigPwGFeX+m9igBCUhAAhKQgAQkIIFmAgrzZmQ2kIAEJCABCUhAAhKQQH8CCvP+TO1RAhKQgAQkIAEJSEACzQQU5s3IbCABCUhAAhKQgAQkIIH+BBTm/ZnaowQkIAEJSEACEpCABJoJKMybkdlAAhKQgAQkIAEJSEAC/QkozPsztUcJSEACEpCABCQgAQk0E1CYNyOzgQQkIAEJSEACEpCABPoTUJj3Z2qPEpCABCQgAQlIQAISaCagMG9GZgMJSEACEpCABCQgAQn0J6Aw78/UHiUgAQlIQAISkIAEJNBMQGHejMwGEpCABCQgAQlIQAIS6E9AYd6fqT1KQAISkIAEJCABCUigmYDCvBmZDSQgAQlIQAISkIAEJNCfgMK8P1N7lIAEJCABCUhAAhKQQDMBhXkzMhtIQAISkIAEJCABCUigPwGFeX+m9igBCUhAAhKQgAQkIIFmAgrzZmQ2kIAEJCABCUhAAhKQQH8CCvP+TO1RAhKQgAQkIAEJSEACzQQU5s3IbCABCUhAAhKQgAQkIIH+BBTm/ZnaowQkIAEJSEACEpCABJoJKMybkdlAAhKQgAQkIAEJSEAC/QkozPsztUcJSEACEpCABCQgAQk0E1CYNyOzgQQkIAEJSEACEpCABPoTUJj3Z2qPEpCABCQgAQlIQAISaCbwP7RRY+crDhLEAAAAAElFTkSuQmCC"
    }
   },
   "cell_type": "markdown",
   "id": "655a7d0f",
   "metadata": {
    "papermill": {
     "duration": 0.017339,
     "end_time": "2022-09-24T15:15:43.285667",
     "exception": false,
     "start_time": "2022-09-24T15:15:43.268328",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "![Screen Shot 2022-09-21 at 12.59.54 PM.png](attachment:31d78bb0-f68a-42ba-b5f6-e7bda50e0254.png)\n",
    "\n",
    "<span style=\"font-size:12px; color:#E3E3E3\"> Image from communityaccessnetwork.org </span>"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 16,
   "id": "36cb9e01",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-09-24T15:15:43.325628Z",
     "iopub.status.busy": "2022-09-24T15:15:43.323887Z",
     "iopub.status.idle": "2022-09-24T15:15:43.360603Z",
     "shell.execute_reply": "2022-09-24T15:15:43.358170Z"
    },
    "papermill": {
     "duration": 0.060254,
     "end_time": "2022-09-24T15:15:43.363540",
     "exception": false,
     "start_time": "2022-09-24T15:15:43.303286",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A tibble: 6 × 5</caption>\n",
       "<thead>\n",
       "\t<tr><th scope=col>id</th><th scope=col>mean_daily_steps</th><th scope=col>mean_daily_calories</th><th scope=col>mean_daily_sleep</th><th scope=col>user_type</th></tr>\n",
       "\t<tr><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;chr&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><td>1503960366</td><td>12405.680</td><td>1872.280</td><td>360.2800</td><td>active         </td></tr>\n",
       "\t<tr><td>1644430081</td><td> 7967.750</td><td>2977.750</td><td>294.0000</td><td>somewhat active</td></tr>\n",
       "\t<tr><td>1844505072</td><td> 3477.000</td><td>1676.333</td><td>652.0000</td><td>sedentary      </td></tr>\n",
       "\t<tr><td>1927972279</td><td> 1490.000</td><td>2316.200</td><td>417.0000</td><td>sedentary      </td></tr>\n",
       "\t<tr><td>2026352035</td><td> 5618.679</td><td>1540.786</td><td>506.1786</td><td>semi active    </td></tr>\n",
       "\t<tr><td>2320127002</td><td> 5079.000</td><td>1804.000</td><td> 61.0000</td><td>semi active    </td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A tibble: 6 × 5\n",
       "\\begin{tabular}{lllll}\n",
       " id & mean\\_daily\\_steps & mean\\_daily\\_calories & mean\\_daily\\_sleep & user\\_type\\\\\n",
       " <dbl> & <dbl> & <dbl> & <dbl> & <chr>\\\\\n",
       "\\hline\n",
       "\t 1503960366 & 12405.680 & 1872.280 & 360.2800 & active         \\\\\n",
       "\t 1644430081 &  7967.750 & 2977.750 & 294.0000 & somewhat active\\\\\n",
       "\t 1844505072 &  3477.000 & 1676.333 & 652.0000 & sedentary      \\\\\n",
       "\t 1927972279 &  1490.000 & 2316.200 & 417.0000 & sedentary      \\\\\n",
       "\t 2026352035 &  5618.679 & 1540.786 & 506.1786 & semi active    \\\\\n",
       "\t 2320127002 &  5079.000 & 1804.000 &  61.0000 & semi active    \\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A tibble: 6 × 5\n",
       "\n",
       "| id &lt;dbl&gt; | mean_daily_steps &lt;dbl&gt; | mean_daily_calories &lt;dbl&gt; | mean_daily_sleep &lt;dbl&gt; | user_type &lt;chr&gt; |\n",
       "|---|---|---|---|---|\n",
       "| 1503960366 | 12405.680 | 1872.280 | 360.2800 | active          |\n",
       "| 1644430081 |  7967.750 | 2977.750 | 294.0000 | somewhat active |\n",
       "| 1844505072 |  3477.000 | 1676.333 | 652.0000 | sedentary       |\n",
       "| 1927972279 |  1490.000 | 2316.200 | 417.0000 | sedentary       |\n",
       "| 2026352035 |  5618.679 | 1540.786 | 506.1786 | semi active     |\n",
       "| 2320127002 |  5079.000 | 1804.000 |  61.0000 | semi active     |\n",
       "\n"
      ],
      "text/plain": [
       "  id         mean_daily_steps mean_daily_calories mean_daily_sleep\n",
       "1 1503960366 12405.680        1872.280            360.2800        \n",
       "2 1644430081  7967.750        2977.750            294.0000        \n",
       "3 1844505072  3477.000        1676.333            652.0000        \n",
       "4 1927972279  1490.000        2316.200            417.0000        \n",
       "5 2026352035  5618.679        1540.786            506.1786        \n",
       "6 2320127002  5079.000        1804.000             61.0000        \n",
       "  user_type      \n",
       "1 active         \n",
       "2 somewhat active\n",
       "3 sedentary      \n",
       "4 sedentary      \n",
       "5 semi active    \n",
       "6 semi active    "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "user_alevel <- daily_average %>%\n",
    "  mutate(user_type = case_when(\n",
    "    mean_daily_steps < 5000 ~ \"sedentary\",\n",
    "    mean_daily_steps >= 5000 & mean_daily_steps < 7499 ~ \"semi active\",\n",
    "    mean_daily_steps >= 7500 & mean_daily_steps < 9999 ~ \"somewhat active\", \n",
    "    mean_daily_steps >= 10000 & mean_daily_steps < 12499 ~ \"active\", \n",
    "    mean_daily_steps >= 12500 ~ \"very active\"\n",
    "  ))\n",
    "\n",
    "head(user_alevel)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 17,
   "id": "b5b2f966",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-09-24T15:15:43.403449Z",
     "iopub.status.busy": "2022-09-24T15:15:43.401724Z",
     "iopub.status.idle": "2022-09-24T15:15:43.466960Z",
     "shell.execute_reply": "2022-09-24T15:15:43.464489Z"
    },
    "papermill": {
     "duration": 0.088723,
     "end_time": "2022-09-24T15:15:43.470155",
     "exception": false,
     "start_time": "2022-09-24T15:15:43.381432",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A tibble: 5 × 3</caption>\n",
       "<thead>\n",
       "\t<tr><th scope=col>user_type</th><th scope=col>total_percent</th><th scope=col>labels</th></tr>\n",
       "\t<tr><th scope=col>&lt;fct&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;chr&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><td>active         </td><td>0.16666667</td><td>16.7%</td></tr>\n",
       "\t<tr><td>sedentary      </td><td>0.20833333</td><td>20.8%</td></tr>\n",
       "\t<tr><td>semi active    </td><td>0.20833333</td><td>20.8%</td></tr>\n",
       "\t<tr><td>somewhat active</td><td>0.37500000</td><td>37.5%</td></tr>\n",
       "\t<tr><td>very active    </td><td>0.04166667</td><td>4.2% </td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A tibble: 5 × 3\n",
       "\\begin{tabular}{lll}\n",
       " user\\_type & total\\_percent & labels\\\\\n",
       " <fct> & <dbl> & <chr>\\\\\n",
       "\\hline\n",
       "\t active          & 0.16666667 & 16.7\\%\\\\\n",
       "\t sedentary       & 0.20833333 & 20.8\\%\\\\\n",
       "\t semi active     & 0.20833333 & 20.8\\%\\\\\n",
       "\t somewhat active & 0.37500000 & 37.5\\%\\\\\n",
       "\t very active     & 0.04166667 & 4.2\\% \\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A tibble: 5 × 3\n",
       "\n",
       "| user_type &lt;fct&gt; | total_percent &lt;dbl&gt; | labels &lt;chr&gt; |\n",
       "|---|---|---|\n",
       "| active          | 0.16666667 | 16.7% |\n",
       "| sedentary       | 0.20833333 | 20.8% |\n",
       "| semi active     | 0.20833333 | 20.8% |\n",
       "| somewhat active | 0.37500000 | 37.5% |\n",
       "| very active     | 0.04166667 | 4.2%  |\n",
       "\n"
      ],
      "text/plain": [
       "  user_type       total_percent labels\n",
       "1 active          0.16666667    16.7% \n",
       "2 sedentary       0.20833333    20.8% \n",
       "3 semi active     0.20833333    20.8% \n",
       "4 somewhat active 0.37500000    37.5% \n",
       "5 very active     0.04166667    4.2%  "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "user_alevel_percent <- user_alevel %>%\n",
    "  group_by(user_type) %>%\n",
    "  summarise(total = n()) %>%\n",
    "  mutate(totals = sum(total)) %>%\n",
    "  group_by(user_type) %>%\n",
    "  summarise(total_percent = total / totals) %>%\n",
    "  mutate(labels = scales::percent(total_percent))\n",
    "\n",
    "user_alevel_percent$user_type <- factor(user_alevel_percent$user_type , levels = c(\"very active\", \"active\", \"somewhat active\", \"semi active\", \"sedentary\"))\n",
    "\n",
    "\n",
    "head(user_alevel_percent)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 18,
   "id": "1404ed57",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-09-24T15:15:43.512074Z",
     "iopub.status.busy": "2022-09-24T15:15:43.510446Z",
     "iopub.status.idle": "2022-09-24T15:15:44.250544Z",
     "shell.execute_reply": "2022-09-24T15:15:44.247807Z"
    },
    "papermill": {
     "duration": 0.765188,
     "end_time": "2022-09-24T15:15:44.253755",
     "exception": false,
     "start_time": "2022-09-24T15:15:43.488567",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "image/png": "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\nlA7FDnxIjiNnZdHKveV7eQcBuC4iE9sY2/QI7REs4qZXAPAJKHbgczJtmauLVx+2HuYdBOCK\nRCamGdNuDbk1WEKlAwAfgmIHPirLnrWmeM3+8v24OAs+RWJSG2ObbiHdQqVQ3lkAAC6HYgc+\nrcBZsM6yblvpNtxaAdxpBM0txlu6mrpilA4AfBaKHfiBAmfB2uK1O8p2uGU37yygREbR2MnU\nqX1we9zxCgA+DsUO/EaZu2x76faNlo0l7hLeWUApwqSwdFN62+C2KqbinQUA4NpQ7MDPOGXn\nzrKdGy0bcxw5vLNAIKunq9cxuGMTQxOBsNQwAPgNFDvwVydtJ9cVrztkPYS7K8CLJCbdbLi5\nc0jnGHUM7ywAADcMxQ78W64jd3PJ5p1lO7HtLNRQmBTW3tQ+zZimE3S8swAAVBOKHQQCp+zc\nXbb7j5I/TttP884CfkYgoYG+QTtju8aGxrjqCgD+DsUOAkquM3d76fatJVutHivvLODrTJKp\nZVDL9v/f3r29xlGHcRzew2Sym5MxkhhMMLEaoRGCBQX//2u1SgUbi6WmLUkxK7Xd7PngRVSk\nIFhNsvW7z3MxDHv17t0HZt75rX3hi3RADGFHoMF08G372y9ffnnSO/EGHq8oqsUny598vvr5\nh80Pq5XqrMcBuErCjmS/DH+52757t333fHg+61mYvd3F3Tsrd+6s3lmqLc16FoBrIeyYC88G\nz75uf/3Vy6/a4/asZ+GmvV28fbRy9NnqZ5sLm7OeBeB6CTvmyHg6/qH7wzftb+537vcn/VmP\nw/VaL9aPVo4+Xfn0vfK9Wc8CcEOEHfNoNB096D747uK77y++t2YRZr1YP1w+PFo+2mvseYUO\nmDfCjrk2qUxOeif3Lu7da99zUtn/2la5dXvp9u2l23oOmGfCDiqVSmVamZ70Tu537h93j0/7\np3Zp/xdqldp+Y/9w+fBw+XCj2Jj1OACzJ+zgVS/HL487x8ed4wfdBw60eAOtF+sHzYODpYOP\nmh/ZbwX4K2EHf2synfzU/+m4c/xj98eng6eT6WTWE82vslreat46aB58vPSx5VaAvyPs4B/p\nT/qPeo8e9h4+7D4UeTejrJbvN97fb+zfatzaa+zVq/VZTwTwphN28Nr+jLxHvUdP+09H09Gs\nJ8qxXF/ea+x90Phgv7G/U+7Uqg5vBXgNwg7+k/F0fDY4O+mfPOk/edx7/PPwZ4sXr6WoFtvl\n9s7izu7i7t7i3ma5aacV4F8TdnCVepPek/6Tx/3Hp/3T08Fpa9Ty0PYV9Wr995Ird3cWd7bL\nbc9YAa6KsINrNJqOng2enQ3OzgZnp4PTs8HZvJ1pVqvW3ineebd8d6vc2l7Y3iw3txa2lBzA\nNRF2cKM648756Lw1bJ0Pz8+H561hqzVsdSfdWc91BaqV6mp9dWNhY2NhY6PY2FrYknEAN0zY\nwexdjC9aw9bz0fMX4xfPR89/Hf16edMet8fT8ayne1VZLdeKtZX6ylp9ba1Yu8y4y2tRLWY9\nHcBcE3bw5ppWpu1x+8XoxcXkojPudCady2t33L38pTvpjqfj/qQ/nA7/+3Jus9Zs1BrNWrNR\nb/x+88d1tb56GXNv1d8qa+WV/DsArpywgxy9Se8fdt5ibbFWqRXVYqG2UKlUmrXmTc0IwDUS\ndgAAIXz8EwAghLADAAgh7AAAQgg7AIAQwg4AIISwAwAIIewAAEIIOwCAEMIOACCEsAMACCHs\nAABCCDsAgBDCDgAghLADAAgh7AAAQgg7AIAQwg4AIISwAwAIIewAAEIIOwCAEMIOACCEsAMA\nCCHsAABCCDsAgBDCDgAghLADAAgh7AAAQgg7AIAQwg4AIISwAwAIIewAAEIIOwCAEMIOACCE\nsAMACCHsAABCCDsAgBDCDgAghLADAAgh7AAAQgg7AIAQwg4AIISwAwAIIewAAEIIOwCAEMIO\nACCEsAMACCHsAABCCDsAgBDCDgAghLADAAgh7AAAQgg7AIAQwg4AIISwAwAIIewAAEIIOwCA\nEMIOACCEsAMACCHsAABCCDsAgBDCDgAghLADAAgh7AAAQgg7AIAQwg4AIISwAwAIIewAAEII\nOwCAEMIOACCEsAMACCHsAABCCDsAgBDCDgAghLADAAgh7AAAQgg7AIAQwg4AIISwAwAIIewA\nAEIIOwCAEMIOACCEsAMACCHsAABCCDsAgBDCDgAghLADAAgh7AAAQgg7AIAQwg4AIISwAwAI\nIewAAEIIOwCAEMIOACCEsAMACCHsAABCCDsAgBDCDgAghLADAAgh7AAAQgg7AIAQwg4AIISw\nAwAIIewAAEIIOwCAEMIOACCEsAMACCHsAABCCDsAgBDCDgAghLADAAgh7AAAQgg7AIAQwg4A\nIISwAwAIIewAAEIIOwCAEMIOACCEsAMACCHsAABCCDsAgBDCDgAghLADAAgh7AAAQgg7AIAQ\nwg4AIISwAwAIIewAAEIIOwCAEMIOACCEsAMACCHsAABCCDsAgBDCDgAghLADAAgh7AAAQgg7\nAIAQwg4AIISwAwAIIewAAEIIOwCAEMIOACCEsAMACCHsAABCCDsAgBDCDgAghLADAAgh7AAA\nQgg7AIAQwg4AIISwAwAI8Rt15KZQ1X3BqgAAAABJRU5ErkJggg=="
     },
     "metadata": {
      "image/png": {
       "height": 420,
       "width": 420
      }
     },
     "output_type": "display_data"
    }
   ],
   "source": [
    "user_alevel_percent %>%\n",
    "  ggplot(aes(x=\"\",y=total_percent, fill=user_type)) +\n",
    "  geom_bar(stat = \"identity\", width = 1)+\n",
    "  coord_polar(\"y\", start=0)+\n",
    "  theme_minimal()+\n",
    "  theme(axis.title.x= element_blank(),\n",
    "        axis.title.y = element_blank(),\n",
    "        panel.border = element_blank(), \n",
    "        panel.grid = element_blank(), \n",
    "        axis.ticks = element_blank(),\n",
    "        axis.text.x = element_blank(),\n",
    "        plot.title = element_text(hjust = 0.5, size=14, face = \"bold\")) +\n",
    "  scale_fill_manual(values = c(\"#DCD0FF\", \"#AFEEEE\",\"#77DD77\", \"#FAF884\", \"#F8B88B\")) +\n",
    "  geom_text(aes(label = labels),\n",
    "            position = position_stack(vjust = 0.5))+\n",
    "  labs(title=\"User Activity Levels\")"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 19,
   "id": "a7047dbb",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-09-24T15:15:44.296971Z",
     "iopub.status.busy": "2022-09-24T15:15:44.295303Z",
     "iopub.status.idle": "2022-09-24T15:15:44.340067Z",
     "shell.execute_reply": "2022-09-24T15:15:44.337616Z"
    },
    "papermill": {
     "duration": 0.069123,
     "end_time": "2022-09-24T15:15:44.343011",
     "exception": false,
     "start_time": "2022-09-24T15:15:44.273888",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A tibble: 6 × 3</caption>\n",
       "<thead>\n",
       "\t<tr><th scope=col>weekday</th><th scope=col>daily_steps</th><th scope=col>daily_sleep</th></tr>\n",
       "\t<tr><th scope=col>&lt;ord&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><td>Monday   </td><td>9273.217</td><td>419.5000</td></tr>\n",
       "\t<tr><td>Tuesday  </td><td>9182.692</td><td>404.5385</td></tr>\n",
       "\t<tr><td>Wednesday</td><td>8022.864</td><td>434.6818</td></tr>\n",
       "\t<tr><td>Thursday </td><td>8183.516</td><td>401.2969</td></tr>\n",
       "\t<tr><td>Friday   </td><td>7901.404</td><td>405.4211</td></tr>\n",
       "\t<tr><td>Saturday </td><td>9871.123</td><td>419.0702</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A tibble: 6 × 3\n",
       "\\begin{tabular}{lll}\n",
       " weekday & daily\\_steps & daily\\_sleep\\\\\n",
       " <ord> & <dbl> & <dbl>\\\\\n",
       "\\hline\n",
       "\t Monday    & 9273.217 & 419.5000\\\\\n",
       "\t Tuesday   & 9182.692 & 404.5385\\\\\n",
       "\t Wednesday & 8022.864 & 434.6818\\\\\n",
       "\t Thursday  & 8183.516 & 401.2969\\\\\n",
       "\t Friday    & 7901.404 & 405.4211\\\\\n",
       "\t Saturday  & 9871.123 & 419.0702\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A tibble: 6 × 3\n",
       "\n",
       "| weekday &lt;ord&gt; | daily_steps &lt;dbl&gt; | daily_sleep &lt;dbl&gt; |\n",
       "|---|---|---|\n",
       "| Monday    | 9273.217 | 419.5000 |\n",
       "| Tuesday   | 9182.692 | 404.5385 |\n",
       "| Wednesday | 8022.864 | 434.6818 |\n",
       "| Thursday  | 8183.516 | 401.2969 |\n",
       "| Friday    | 7901.404 | 405.4211 |\n",
       "| Saturday  | 9871.123 | 419.0702 |\n",
       "\n"
      ],
      "text/plain": [
       "  weekday   daily_steps daily_sleep\n",
       "1 Monday    9273.217    419.5000   \n",
       "2 Tuesday   9182.692    404.5385   \n",
       "3 Wednesday 8022.864    434.6818   \n",
       "4 Thursday  8183.516    401.2969   \n",
       "5 Friday    7901.404    405.4211   \n",
       "6 Saturday  9871.123    419.0702   "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "weekday_steps_sleep <- activity_sleep_daily %>%\n",
    "  mutate(weekday = weekdays(date))\n",
    "\n",
    "weekday_steps_sleep$weekday <-ordered(weekday_steps_sleep$weekday, levels=c(\"Monday\", \"Tuesday\", \"Wednesday\", \"Thursday\",\n",
    "\"Friday\", \"Saturday\", \"Sunday\"))\n",
    "\n",
    " weekday_steps_sleep <-weekday_steps_sleep%>%\n",
    "  group_by(weekday) %>%\n",
    "  summarize (daily_steps = mean(totalsteps), daily_sleep = mean(totalminutesasleep))\n",
    "\n",
    "head(weekday_steps_sleep)"
   ]
  }
 ],
 "metadata": {
  "kernelspec": {
   "display_name": "R",
   "language": "R",
   "name": "ir"
  },
  "language_info": {
   "codemirror_mode": "r",
   "file_extension": ".r",
   "mimetype": "text/x-r-source",
   "name": "R",
   "pygments_lexer": "r",
   "version": "4.0.5"
  },
  "papermill": {
   "default_parameters": {},
   "duration": 9.655744,
   "end_time": "2022-09-24T15:15:44.484502",
   "environment_variables": {},
   "exception": null,
   "input_path": "__notebook__.ipynb",
   "output_path": "__notebook__.ipynb",
   "parameters": {},
   "start_time": "2022-09-24T15:15:34.828758",
   "version": "2.3.4"
  }
 },
 "nbformat": 4,
 "nbformat_minor": 5
}
