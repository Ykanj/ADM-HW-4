import pandas as pd

netflix = pd.read_csv(r"Data\vodclickstream_uk_movies_03.csv").sort_values("user_id")                                        

def top_movies_sort(dataframe):
    prefrences = pd.DataFrame(columns=["user_id", "movie_id", "title", "click_count", "genre", "total_duration"])
    x=0
    for user in list(dataframe["user_id"].unique()):
        splice = dataframe[dataframe["user_id"] == user]
        splice = splice.sort_values(by=["movie_id", "datetime", "duration"], ascending= False).drop_duplicates(subset=['datetime'])
        for movie in list(splice["movie_id"].unique()):
            prefrences.loc[len(prefrences)] = [user, movie, splice[splice["movie_id"]== movie]["title"][0], splice["movie_id"].apply(lambda x: movie in x).sum(), splice[splice["movie_id"]== movie]["genre"][0], splice[splice["movie_id"]== movie]["duration"].sum()]
        x+=1
        if x==2:
            print(prefrences)
            break
        
top_movies_sort(netflix)


