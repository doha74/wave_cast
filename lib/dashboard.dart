import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DashboardWidget extends StatefulWidget {
  const DashboardWidget({super.key});

  @override
  State<DashboardWidget> createState() => _DashboardWidgetState();
}

class _DashboardWidgetState extends State<DashboardWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: Colors.grey[50], // Light grey background
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                const LocationHeader(),
                const CurrentWeatherCard(),
                const HourlyForecastSection(),
                const FishingConditionsCard(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class LocationHeader extends StatelessWidget {
  const LocationHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8),
                    child: Icon(
                      Icons.location_on_outlined,
                      color: Colors.black87,
                      size: 24,
                    ),
                  ),
                  Text(
                    'Lake Michigan, MI',
                    style: GoogleFonts.interTight(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: Colors.black87,
                    ),
                  ),
                ],
              ),
              const Padding(
                padding: EdgeInsets.only(top: 4),
                child: Text(
                  'Monday, June 10 • 9:45 AM',
                  style: TextStyle(fontSize: 14, color: Colors.grey),
                ),
              ),
            ],
          ),
          IconButton(
            style: IconButton.styleFrom(
              backgroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            icon: const Icon(
              Icons.settings_outlined,
              color: Colors.black87,
              size: 24,
            ),
            onPressed: () => print('Settings pressed'),
          ),
        ],
      ),
    );
  }
}

//card of weather ouiiiii

class CurrentWeatherCard extends StatelessWidget {
  const CurrentWeatherCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 4,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              const WeatherSummaryRow(),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 8),
                child: Divider(height: 1, color: Colors.grey),
              ),
              const WeatherDetailsRow(),
            ],
          ),
        ),
      ),
    );
  }
}

class WeatherSummaryRow extends StatelessWidget {
  const WeatherSummaryRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              // temperature
              '72°F',
              style: GoogleFonts.interTight(
                fontSize: 36,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 4),
              child: Text(
                'Partly Cloudy',
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class WeatherDetailsRow extends StatelessWidget {
  const WeatherDetailsRow({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        WeatherDetailItem(
          icon: Icons.air,
          label: 'Wind',
          value: '8 mph',
          valueIcon: Icons.arrow_upward,
        ),
        WeatherDetailItem(
          icon: Icons.water_drop,
          label: 'Humidity',
          value: '65%',
        ),
        WeatherDetailItem(icon: Icons.umbrella, label: 'Rain', value: '15%'),
      ],
    );
  }
}

class WeatherDetailItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;
  final IconData? valueIcon;

  const WeatherDetailItem({
    super.key,
    required this.icon,
    required this.label,
    required this.value,
    this.valueIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4),
              child: Icon(icon, color: Colors.black87, size: 20),
            ),
            Text(
              label,
              style: const TextStyle(fontSize: 14, color: Colors.black87),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(top: 4),
          child: Row(
            children: [
              if (valueIcon != null)
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4),
                  child: Icon(valueIcon, color: Colors.black87, size: 16),
                ),
              Text(
                value,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.black87,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class HourlyForecastSection extends StatelessWidget {
  const HourlyForecastSection({super.key});

  final List<HourlyForecast> forecasts = const [
    HourlyForecast(time: 'Now', temp: '72°F', icon: Icons.wb_cloudy),
    HourlyForecast(time: '10 AM', temp: '74°F', icon: Icons.wb_sunny),
    HourlyForecast(time: '11 AM', temp: '76°F', icon: Icons.wb_sunny),
    HourlyForecast(time: '12 PM', temp: '78°F', icon: Icons.wb_sunny),
    HourlyForecast(time: '1 PM', temp: '77°F', icon: Icons.wb_cloudy),
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(bottom: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Hourly Forecast',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Colors.black87,
                  ),
                ),
                Text(
                  'See Detailed Forecast',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Colors.blue,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 120,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children:
                  forecasts
                      .map((forecast) => HourlyForecastCard(forecast: forecast))
                      .toList(),
            ),
          ),
        ],
      ),
    );
  }
}

class HourlyForecast {
  final String time;
  final String temp;
  final IconData icon;

  const HourlyForecast({
    required this.time,
    required this.temp,
    required this.icon,
  });
}

class HourlyForecastCard extends StatelessWidget {
  final HourlyForecast forecast;

  const HourlyForecastCard({super.key, required this.forecast});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(12),
      child: SizedBox(
        width: 90,
        height: 130, // Add a fixed height
        child: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly, // Better spacing
            children: [
              Text(
                forecast.time,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Colors.black87,
                ),
              ),
              Icon(forecast.icon, size: 30, color: Colors.amber),
              Text(
                forecast.temp,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Colors.black87,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class FishingConditionsCard extends StatelessWidget {
  const FishingConditionsCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.green[700],
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 4,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(right: 8),
                    child: Icon(Icons.anchor, color: Colors.white, size: 24),
                  ),
                  Text(
                    'Fishing Conditions',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 8),
                child: Text(
                  'EXCELLENT',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(bottom: 8),
                child: Text(
                  'Light winds and stable barometric pressure make for ideal fishing conditions. '
                  'Fish are likely to be active near the surface in the morning hours.',
                  style: TextStyle(fontSize: 14, color: Colors.white),
                ),
              ),
              Row(
                children: [
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 4),
                    child: Icon(
                      Icons.tips_and_updates,
                      color: Colors.white,
                      size: 16,
                    ),
                  ),
                  Text(
                    'TIP: Try using lighter lures in the shallow areas',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
