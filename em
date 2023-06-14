import math

days = [70, 65, 90, 55, 100, 75, 80, 55, 30, 80]
std = 10
variance = std**2
k = 2 # sunny and cloudy days
avg_sunny = 80
avg_cloudy = 55

for n in range(1000):
    # estimator step
    E_sunny = []
    E_cloudy = []
    for i in range(len(days)):
        val_sunny = math.pow(math.e, (-0.5)/(variance) *
                             math.pow(days[i]-avg_sunny, 2))
        val_cloudy = math.pow(math.e, (-0.5)/(variance)
                              * math.pow(days[i]-avg_cloudy, 2))
        E_sunny.append(val_sunny/(val_sunny + val_cloudy))
        E_cloudy.append(val_cloudy/(val_sunny + val_cloudy))

    # maximization step
    sunny_numerator = 0
    sunny_denominator = sum(E_sunny)
    cloudy_numerator = 0
    cloudy_denominator = sum(E_cloudy)

    for i in range(len(days)):
        sunny_numerator += E_sunny[i]*days[i]
        cloudy_numerator += E_cloudy[i]*days[i]
    if (sunny_numerator/sunny_denominator) - avg_sunny <= 0.1 and (cloudy_numerator/cloudy_denominator) - avg_cloudy <= 0.1:
        break
    avg_sunny = sunny_numerator/sunny_denominator
    avg_cloudy = cloudy_numerator/cloudy_denominator

    print(avg_sunny, avg_cloudy)
