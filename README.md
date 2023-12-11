# ADM_HW4 -Recommendation systems and clustering everywhere
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

    * **Choose your features (variables)!** 

        in this task the focus is on managing the abundance of features by reducing dimensionality, i.e., decreasing the number of variables to work with. 
        The method chosen for dimensionality reduction and applied to the data is **PCA** (_Principal Component Analysis_) creating a reduced dataset ```numeric_features_pca.csv```. 

    <a id="section-2.3"></a>
    * **Clustering!**

        This section involves a comprehensive exploration of clustering techniques, including the implementation of **K-means with MapReduce**, determination of the optimal number of clusters, and comparison of K-means with different initializations. Additionally, it introduces the exploration and implementation of alternative clustering algorithms based on ChatGPT recommendations.

    * **Analysing your results!**

        Here we guides the analysis by breaking down the process into specific steps, including variable selection, categorization, pivot table creation, percentage calculation, and evaluation of clustering algorithm performance using appropriate metrics.
    
    ### 3. Bonus Question 
    In this paragraph, we delve into the density-based clustering approach. This method identifies clusters as regions in the data space with high point density, which are separated from other clusters by regions of low point density. Data points in these low-density separating regions are typically considered noise or outliers. Typical algorithms falling into this category include OPTICS and DBSCAN.

    We instruct ChatGPT (or any other natural language processing tool) to provide a list of three algorithms for density-based clustering. We then choose one and apply it to the same dataset used in [section 2.3](#section-2.3). Following this, we analyze the results obtained and assess how different they are from the centroid-based version.

    <a id="command-line-question"></a>
    ### 4. Command Line Question
    Answered the questions below using **only** Linux command line tools and created a script named ```CommandLine.sh``` for execution.

    - What is the most-watched Netflix title?
    - Report the average time between subsequent clicks on Netflix.com
    - Provide the ID of the user that has spent the most time on Netflix

    ### 5. Algorithmic Question 
    In this section, we address an Algorithmic Question (AQ) presented by Federico, a university student facing a unique exam scenario. Federico can choose the order of exams, and their scores impact each other based on whether they are considered "easy" or "hard." The tasks include providing a recursive code solution, formally proving its slowness with big-O notation, optimizing the code if necessary and demonstrating the improvement in time complexity, and finally, requesting an optimized implementation from ChatGPT and analyzing its time complexity.


* __`CommandLine.sh`__: 
    > Script that performs several operations using Linux command line tools to answer the proposed questions. 

* __`output.png`__: 
    > Output image for [Command Line Question](#command-line-question).

* __`numeric_features_pca.csv`__: 
    > New DataFrame numeric_features_pca_df using the results of [PCA](#section-2.3). The columns of this DataFrame are labeled as PC1, PC2, ..., PCn, representing the principal components obtained from PCA. 