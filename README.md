# ADM_HW3 -Recommendation systems and clustering everywhere
Algorithmic Methods of Data Mining (Sc.M. in Data Science) Academic year 2023–2024. [Homewok 4](https://github.com/Sapienza-University-Rome/ADM/tree/master/2023/Homework_4)
---

## Team members
* Laura Concari 1890490
* Rebecca Conti 1896168 
* Yousef Kanj 2113258
* Umut Altun 

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

    ### 2. Grouping Users together
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

