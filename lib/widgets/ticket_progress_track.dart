import 'package:flutter/material.dart';
import 'package:timelines/timelines.dart';

class TicketProgressTrack extends StatefulWidget {
  const TicketProgressTrack({super.key});

  @override
  State<TicketProgressTrack> createState() => _TicketProgressTrackState();
}

class _TicketProgressTrackState extends State<TicketProgressTrack> {
  @override
    Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    var screenWidth = mediaQuery.size.width;
    var screenHeight = mediaQuery.size.height;

    double _getIndicatorSize(int index) {
      switch (index) {
        case 0:
          return screenWidth * 0.16;
        case 1:
          return screenWidth * 0.14;
        case 2:
          return screenWidth * 0.12;
        default:
          return screenWidth * 0.12; // Default size
      }
    }

    Widget _buildIndicator(int index) {
      if (index == 0) {
        // Render a tick icon for the first index
        return Icon(
          Icons.check_circle,
          color: Colors.green,
          size: screenWidth * 0.12,
        );
      } else {
        // Render the default outlined dot indicator for other indices
        return OutlinedDotIndicator(
          size: _getIndicatorSize(index),
          color: _getIndicatorColor(index),
        );
      }
    }

      return Center(
        child: Container(
          //color: Colors.red,
          //margin: EdgeInsets.symmetric(vertical: screenHeight*0.02),
          width: double.infinity,
          height: screenHeight*0.16,
          child: FixedTimeline.tileBuilder(
            direction: Axis.horizontal,  // Change to horizontal
            builder: TimelineTileBuilder.connected(
              itemCount: 3,
              indicatorBuilder: (context, index) => _buildIndicator(index),
              connectorBuilder: (context, index, _) => Container(
                width: screenWidth * 0.09,  // Set a custom width for the connector
                height: screenHeight * 0.01,  // Set the height of the connector
                color: Colors.green,  // Customize connector color
              ),
              contentsBuilder: (context, index) {
                // Custom labels based on the index
                List<String> labels = ["Created", "WIP", "Completed"];
                return Padding(
                  padding:  EdgeInsets.all(8.0),
                  child: Text(
                    labels[index],
                    style: TextStyle(
                      fontSize: 18.0,  // Increase font size for labels
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                );
              },
              indicatorPositionBuilder: (context, index) => 0.5,  // Adjust the position of the indicator
            ),
          ),
        ),
      );
  }
}




Color _getIndicatorColor(int index) {
  switch (index) {
    case 0:
      return Colors.green;
    case 1:
      return Colors.orange;
    case 2:
      return Colors.blue;
    default:
      return Colors.grey; // Default color if index out of range
  }
}

