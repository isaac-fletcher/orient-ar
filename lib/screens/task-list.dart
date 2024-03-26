import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:orientation/widgets/task-card.dart';

class TaskList extends StatefulWidget {
  const TaskList({super.key});

  @override
  State<TaskList> createState() => _TaskListState();
}

class _TaskListState extends State<TaskList> {
  late TextEditingController textController;
  final isSelected = <bool>[true, false];

  // Example list of location names
  static const List<String> names = [
    "Visit Tillman Hall", //Tillman Hall
    "Visit Death Valley", //Clemson Memorial Stadium
    "Visit McAdams Hall", // McAdams Hall
    "Visit Strode Tower", //Strode Tower
    "Visit College of Business", // Willbur O and Ann Power College of Business
    "Visit Historic Cooper Library", //Cooper Library
    "Visit Fluor Daniel", //Fluor Daniel Engineering Innovation Building
    "Visit Freeman Hall" //Freeman Hall
  ];

  // Example list of location names
  static const List<String> destinations = [
    "Tillman Hall", //Tillman Hall
    "Memorial Stadium", //Clemson Memorial Stadium
    "McAdams Hall", // McAdams Hall
    "Strode Tower", //Strode Tower
    "College of Business", // Willbur O and Ann Power College of Business
    "Cooper Library", //Cooper Library
    "Fluor Daniel", //Fluor Daniel Engineering Innovation Building
    "Freeman Hall" //Freeman Hall
  ];

  // Example list of descriptions
  static const List<String> descriptions = [
    """Tillman Hall is a historic building located on the campus of Clemson University. Constructed in the early 20th century, it stands as a symbol of the university's rich heritage and academic tradition. With its iconic clock tower and elegant architecture, Tillman Hall is a focal point of campus life, hosting administrative offices and serving as a gathering place for students and faculty alike.
  \nStep into the heart of Clemson University's history and academia by visiting Tillman Hall. Explore its majestic architecture and learn about its significance to the university's past and present.""",
    
    """Known affectionately as 'Death Valley,' Clemson Memorial Stadium is the legendary home of the Clemson Tigers football team. With a seating capacity of over 80,000, it is one of the largest stadiums in the Atlantic Coast Conference. The stadium pulsates with energy on game days as fans come together to cheer on their team amidst a sea of orange and purple.
  \nImmerse yourself in the electrifying atmosphere of college football by attending a game at Clemson Memorial Stadium. Join the roaring crowd and experience the passion and excitement of Tigers football firsthand.""",
    
    """McAdams Hall is a bustling hub of student life and academic activity at Clemson University. As one of the university's residence halls, it provides a vibrant community for students to live, learn, and grow together. With modern amenities and a welcoming atmosphere, McAdams Hall offers a supportive environment where students can thrive both academically and socially.
  \nExperience the vibrant community spirit of Clemson University by visiting McAdams Hall. Take a stroll through its halls, engage with students, and get a taste of campus life firsthand.""",
    
    """Strode Tower is a prominent academic building located on the campus of Clemson University. Housing classrooms, lecture halls, and academic offices, it serves as a vital hub for learning and education. With its distinctive architecture and central location, Strode Tower stands as a beacon of academic excellence, providing students with the resources and facilities they need to succeed in their studies.
  \nImmerse yourself in the academic environment of Clemson University by visiting Strode Tower. Attend a lecture, participate in a seminar, or simply explore its corridors to experience firsthand the energy and enthusiasm of learning on campus.""",
    
    """The Wilbur O and Ann Power College of Business is a prestigious academic institution dedicated to excellence in business education and research. Housed in modern facilities equipped with cutting-edge technology, it offers a comprehensive range of undergraduate and graduate programs designed to prepare students for success in the dynamic world of business. With world-class faculty, innovative curriculum, and extensive networking opportunities, the College of Business provides students with the knowledge, skills, and resources they need to thrive in today's global marketplace.
  \nExplore the exciting world of business and entrepreneurship by visiting the Wilbur O and Ann Power College of Business. Attend a lecture, meet with faculty members, and learn about the diverse array of academic and professional opportunities available to students pursuing a career in business.""",
    
    """Cooper Library is the academic heart of Clemson University, providing students and faculty with access to a vast collection of resources, services, and study spaces. From books and journals to digital archives and research databases, the library offers comprehensive support for learning, research, and scholarship across a wide range of disciplines. With its welcoming atmosphere and knowledgeable staff, Cooper Library is a place where students can explore, discover, and excel.
  \nEmbark on a journey of learning and discovery by visiting Cooper Library. Dive into its extensive collection of resources, find a quiet corner to study or collaborate with peers, and take advantage of the support and expertise available to help you succeed academically.""",
    
    """The Fluor Daniel Engineering Innovation Building is a state-of-the-art facility dedicated to advancing education and research in engineering and technology. With its cutting-edge laboratories, collaborative workspaces, and advanced equipment, it provides students and faculty with the tools and resources they need to tackle complex engineering challenges and drive innovation in their fields. From mechanical and electrical engineering to computer science and bioengineering, the building fosters interdisciplinary collaboration and hands-on learning experiences that prepare students for successful careers in engineering.
  \nExplore the frontiers of engineering and technology by visiting the Fluor Daniel Engineering Innovation Building. Engage with faculty and students, tour the facilities, and discover the exciting research and innovation happening within its walls.""",
    
    """Freeman Hall is a dynamic center for education and research in the sciences at Clemson University. Home to multiple academic departments and research centers, it offers a wide range of programs and opportunities for students interested in exploring the natural and physical sciences. With its state-of-the-art laboratories, cutting-edge research facilities, and dedicated faculty, Freeman Hall provides students with hands-on learning experiences and prepares them for careers in fields such as chemistry, biology, physics, and environmental science.
  \nDive into the world of science and discovery by visiting Freeman Hall. Explore its laboratories, attend a seminar or lecture, and learn about the groundbreaking research being conducted by faculty and students in fields ranging from chemistry and biology to physics and environmental science.""",
  ];

  // Example list of destinations
  static const List<LatLng> coordinates = [
    LatLng(34.93444, -81.02444), //Tillman Hall
    LatLng(34.67861, -82.84306), //Clemson Memorial Stadium
    LatLng(34.675556, -82.8345), // McAdams Hall
    LatLng(34.679333, -82.835194), //Strode Tower
    LatLng(34.680306, -82.834694), // Willbur O and Ann Power College of Business
    LatLng(34.676639, -82.836444), //Cooper Library
    LatLng(34.675389, -82.839361), //Fluor Daniel Engineering Innovation Building
    LatLng(34.676139, -82.838) //Freeman Hall
  ];

    // Example list of destinations
  static const List<String> imgs = [
    "assets/img/tillman.jpg", //Tillman Hall
    "assets/img/stadium.jpg", //Clemson Memorial Stadium
    "assets/img/mcadams.jpg", // McAdams Hall
    "assets/img/strode.jpg", //Strode Tower
    "assets/img/business.jpg", // Willbur O and Ann Power College of Business
    "assets/img/cooper.jpg", //Cooper Library
    "assets/img/fluor.jpg", //Fluor Daniel Engineering Innovation Building
    "assets/img/freeman.jpg" //Freeman Hall
  ];
  
  @override
  void initState() {
    super.initState();
    textController = TextEditingController(text: '');
  }

  @override
  void dispose() {
    textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return (CupertinoPageScaffold(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Container(
              padding: const EdgeInsets.only(top: 20.0),
              alignment: Alignment.topCenter,
              child: const Text("Task List",
                  style: TextStyle(
                    fontSize: 32,
                    color: CupertinoColors.black,
                  ))),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: CupertinoSearchTextField(
              controller: textController,
              placeholder: 'Search',
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ToggleButtons(
                color: Colors.black.withOpacity(0.60),
                selectedColor: CupertinoColors.activeBlue,
                selectedBorderColor: CupertinoColors.activeBlue,
                fillColor: CupertinoColors.activeBlue.withOpacity(0.08),
                splashColor: CupertinoColors.activeBlue.withOpacity(0.12),
                hoverColor: CupertinoColors.activeBlue.withOpacity(0.04),
                borderRadius: BorderRadius.circular(4.0),
                constraints:
                    const BoxConstraints(minHeight: 36.0, minWidth: 20.0),
                isSelected: isSelected,
                onPressed: (index) {
                  // Respond to button selection
                  setState(() {
                    isSelected.fillRange(0, isSelected.length, false);
                    isSelected[index] = true;
                  });
                },
                children: const [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.0),
                    child: Text('Active'),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.0),
                    child: Text('Completed'),
                  ),
                ],
              )
            ],
          ),
          Expanded(
            child: Column(
              children: [
                Visibility(
                  visible: isSelected[0],
                  child: CupertinoScrollbar(
                    child: SingleChildScrollView(
                      child: Column(
                        children: List.generate(8, (index) {
                          return TaskCard(
                            taskName: names[index],
                            taskDescription: descriptions[index],
                            taskImg: imgs[index],
                            value: 100,
                            coordinates: coordinates[index],
                            destination: destinations[index],
                          );
                        })),
                    ),
                  ),
                )
              ],
            )
          ),
        ],
      ),
    ));
  }
}
