create database project;
use project;
select * from movies_cleaned1;
# Compare average gross for blockbuster, hit, and flop movies
select final_status,avg(gross) as avg_gross,avg(budget) as avg_budget from movies_cleaned1 group by final_status;
# Find rating categories that are common among blockbusters
select rating,count(*) as blockbuster_count from movies_cleaned1 where final_status='blockbuster' group by rating order by blockbuster_count desc;
# Analyze genres with higher blockbuster rates
select genre,count(*) as genre_count,sum(case when final_status='blockbuster' then 1 else 0 end) as blockbuster_count from movies_cleaned1 group by genre order by blockbuster_count desc;
# Find the most successful director-writer combinations
select director,writer,count(*) as movie_count,sum(case when final_status='blockbuster' then 1 else 0 end) as blockbuster_count from movies_cleaned1 group by director,writer order by blockbuster_count desc,movie_count desc;
# Overall count of movies made by each director-writer combo
select director,writer,count(*) as total_movies from movies_cleaned1 group by director,writer order by total_movies desc;
# Calculate average revenue by rating category
select rating,avg(gross) as avg_gross from movies_cleaned1 group by rating order by avg_gross desc;
# Count movies by final status and release year
select year,final_status,count(*) as movie_count from movies_cleaned1 group by year,final_status order by year;
# Average gross revenue by year
select year,avg(gross) as avg_gross from movies_cleaned1 group by year order by avg_gross;
# Average gross and budget by genre
select genre,avg(gross) as avg_gross,avg(budget) as avg_budget from movies_cleaned1 group by genre order by avg_gross desc;
# Calculate ROI for each director
select director,avg((gross-budget)/budget) as avg_roi from movies_cleaned1 group by director order by avg_roi desc;
# Calculate what is the average gross of each Movie Era
select Movie_Era,avg(gross) from movies_cleaned1 group by Movie_Era;
select max(score) as avg_score,final_status from movies_cleaned1 group by final_status order by avg_score;

desc movies_cleaned1;