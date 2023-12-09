# ADM_HW3 -Recommendation systems and clustering everywhere
Algorithmic Methods of Data Mining (Sc.M. in Data Science) Academic year 2023–2024. [Homewok 4](https://github.com/Sapienza-University-Rome/ADM/tree/master/2023/Homework_4)
---

## Team members
* Laura Concari 1890490
* Rebecca Conti 1896168 
* Yousef Kanj 2113258
* Altun Umut

# Contents
* __`main.ipynb`__: 
	> A Jupyter notebook which provides the solutions to all research questions.

    ### 1. Recommendation sytem
    
    In this section, our goal is to implement a recommendation system. Specifically, we are tasked with implementing our version of the **Locality-Sensitive Hashing (LSH)** algorithm. This algorithm takes the user's preferred movie genre as input, identifies users with similar preferences, and recommends the most-watched movies among those who are most similar to the user in focus.

    The dataset provided for this task contains information for each user regarding the movies they clicked on. Our objective is to extract the titles and genres of the top **10 movies** clicked by each user, based on the number of clicks. 

    * **Minhash Signatures**
    
        Using the movie genre and user_ids, we implement our min-hash signatures so that users with similar interests in a genre appear in the same bucket (storage).
        The minhash function is written from scratch. no other already implemented hash functions have been used.

    * **Locality-Sensitive Hashing (LSH)**

        Now that the buckets are ready, in this section we recommend at most five movies to the user to watch based on the movies clicked by similar users.

        To recommend at most five movies given a user_id, is used the following procedure:

        1. Identify the two most similar users to this user.
        2. If these two users have any movies in common, recommend those movies based on the total number of clicks by these users.
        3. If there are no more common movies, try to propose the most clicked movies by the most similar user first, followed by the other user.

    ### Grouping Users together
    At this stage, clustering algorithms will provide groups of Netflix users that are similar among them

    * **Getting your data + feature engineering** 

        In this section, the goal is to obtain data from the dataset and apply feature engineering. Here's what you will find:

        _Access to Data:_ the section begins with accessing the data present in [the dataset](https://www.kaggle.com/datasets/vodclickstream/netflix-audience-behaviour-uk-movies). This involves getting familiar with the information contained in the provided dataset.

        _Feature Engineering:_ the concept of feature engineering is introduced, which involves creating new features (variables, fields) from the existing dataset. Examples are provided on how grouping data based on the user_id can allow the creation of new features for each user.
        The proposed new features include:

            - Favorite genre (i.e., the genre on which the user spent the most time)
            - Average click duration
            - Time of the day (Morning/ Afternoon/ Night) when the user spends the most time on the platform (the time spent is tracked through the duration of the clicks)
            - Is the user an old movie lover, or is he into more recent stuff (content released after 2010)?
            - Average time spent a day by the user (considering only the days he logs in)

        _Additional Features:_ using ChatGPT tools we suggest  10 additional features that can be generated for each user_id. Each of these features is described and added to the previous dataset created (the one with five features). 

    * **Conjunctive query**

        Given a user-input query (e.g., "advanced knowledge"), the Search Engine performs a conjunctive query (AND operation). It returns a list of documents that contain all the words in the query. For each selected document, the output includes:

            courseName
            universityName
            description
            URL
    
    <a id="define-new-score"></a>
    ### 3. Define a new score!
    Build a novel scoring metric to rank MSc degrees based on user queries, considering multiple variables beyond the description field.
    
    ### 4. Visualizing the most relevant MSc degrees
    Create a map showcasing MSc degree courses based on the defined score in point 3. We used our engine to query the phrase ```data science```. The top 1000 results based on the predefined score in question 3 were returned. We used geopandas and geopy libraries to encode the results into geo-referenced data. The folium library is also used to visualize this data. The map provides insights into the name of each course, location (city and country), a representation of associated fees (using a range of coloured symbols), and a filtering gadget based on the ranges in fees. The map is saved as ```interactive_map.html``` in the repository so that it can be downloaded and opened on any web browser.

    <a id="command-line-question"></a>
    ### 6. Command Line Question
    Answered the questions using **only** Linux command line tools and created a script named ```CommandLine.sh``` for execution.

    - Which country offers the most Master's Degrees? Which city?
    - How many colleges offer Part-Time education?
    - Print the percentage of courses in Engineering (the word "Engineer" is contained in the course's name).

    ### 7. Algorithmic Question 
    This algorithm tackles the problem of assisting Leonardo in determining if he can create a fictitious report of daily work hours that adheres to HR constraints. It takes input parameters such as the number of days worked (d), the total hours worked (sumHours), and the minimum and maximum hour constraints for each day. The algorithm sorts the constraints based on minimum hours and then distributes the remaining hours to meet the total required hours, ensuring compliance with both minimum and maximum constraints. If it's feasible to generate a report within the given constraints, the algorithm prints 'YES' followed by the daily hours; otherwise, it prints 'NO'. The algorithm provides a solution that respects HR limitations and contributes to the overall requested hours worked.


* __`CommandLine.sh`__: 
    > Script that performs several operations using Linux command line tools to concatenate all TSV files created in point 1 into a single file named ```merged_courses.tsv``` and to answer the proposed questions. 


* __`images`__: 
    > Folder with the output images for [Command Line Question](#command-line-question) and  [Define a New Score!](#define-new-score).

* __`modules`__: 
    > Folder with the following Python files: 
    * __`currency.py`__: contains a module that handles currency conversion. 
    * __`engine_v1.py`__: contains a module for implementing a search engine based on a dataset of master's degree courses. 
    * __`engine_v2.py`__: extends the search engine from the previous version (__`engine_v1.py`__). It introduces the concept of term frequency-inverse document frequency (tf-idf) for each word in the dataset, aiming to improve information retrieval. The script leverages the scikit-learn TfidfVectorizer to compute tf-idf scores for each term in the vocabulary across all documents.
    * __`engine_v3.py`__: extends the search engine from the previous version (__`engine_v1.py`__). It introduces a new scoring mechanism for each word in each document, combining term frequency (TF) and inverse document frequency (IDF). 

* __`merged_courses.tsv`__: 
    > tsv file with the merge of the all 60.000 courses, created in [Command Line Question](#command-line-question). 