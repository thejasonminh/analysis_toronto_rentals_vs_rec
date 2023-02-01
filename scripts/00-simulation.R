#### Simulating 3 datasets:
# 1) No. of apartments built between 2015-2022
# 2) No. of bike paths built between 2015-2022
# 3) Count per status of active condo application plans
# Since we are only concerned with years 2015 - 2022, we simulate 8 x-axis points, with 1 = 2015 and going upwards

# Realistically, let's assume that in one year, at most 30 apartments can be built
runif(n = 8, min = 1, max = 30) |> floor() 

# Similarly, lets assume that in one year, at most 70 bike paths can be built
runif(n = 8, min = 1, max = 70) |> floor() 

# Lastly, let's simulate the condo application plans. 
# x = 1 can represent Under Review, x = 2 will represent Application Received
# x = 3 can represent Draft Plan Approved, x = 4 will represent Final Approval Completed
# Since this represents the current amount, let's set 100 as a arbitrary limit for concurrent applications
runif(n = 4, min = 1, max = 100) |> floor() 

## Now we need to test our simulations. ##
##If you need to refresh values, run these again
sample_apt_set <- runif(n = 8, min = 1, max = 30) |> floor()
sample_bike_set <- runif(n = 8, min = 1, max = 70) |> floor()
sample_appl_set <- runif(n = 4, min = 1, max = 100) |> floor()

# Are there actually 8 points? Are we testing years 2015 - 2022?
sample_apt_set |> length()
sample_bike_set |> length()
# Are there 4 points?
sample_appl_set |> length()

# Is the minimum amount 1? Or is it higher/lower?
sample_apt_set |> min()
sample_bike_set |> min()
sample_appl_set |> min()

# Despite the upper limits being arbitarily set, let's test them.
sample_apt_set |> max()
sample_bike_set |> max()
sample_appl_set |> max()


