# Your turn 1
#===============================================
corn.agg <- data.table(corn)
corn.agg2 <- corn.agg[,
	mean(Value), 
	by = "Year,State,StateFIPS,County,CountyCode,Crop,SubCrop,Measurement"
	]


# Your turn 2
#===============================================
yt2summary <- crime[
    i = !is.na(charges) &
        !is.na(booking_date) &
        !is.na(bail_amount),
    j = list(
        count = .N,
        bailave = mean(bail_amount),
        bailsd = sd(bail_amount),
        bailmin = min(bail_amount),
        bailmax = max(bail_amount)
        ),
    by = list(race,gender,age_at_booking)
    ]