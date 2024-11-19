import 'package:flutter/material.dart';

class Apptheme {
  static const Color white = Colors.white;
  static const Color black = Colors.black;
  static const Color grey = Color.fromARGB(255, 119, 119, 119);
  static const Color darkBlue = Color.fromARGB(255, 32, 42, 102);
  static const Color softAmber = Color.fromARGB(255, 243, 162, 65);
  static const Color paleAmber = Color.fromARGB(255, 246, 193, 119);
  static const Color paleCoral = Color.fromARGB(255, 211, 242, 240);
  static const Color teal = Color.fromARGB(255, 97, 193, 182);
  static const Color ogTeal = Colors.teal;
  static const Color darkTeal = Color.fromRGBO(0, 77, 64, 1);
  static const Color deepPurple = Colors.deepPurple;
}

class AppColors {}

class AppRoutes {
  static const String intro = '/intro';
}

class AssetPaths {
  static const String introPage1 = "assets/introduction/intro5.png";
  static const String introPage2 = "assets/introduction/intro6.png";
  static const String introPage3 = "assets/introduction/intro7.png";
  static const String selfPortrait = "assets/self_portrait.jpg";
  static const String flutterIcon = "assets/techStacks/flutter.png";
  static const String dartIcon = "assets/techStacks/dart.png";
  static const String firebaseIcon = "assets/techStacks/firebase.png";
  static const String appStoreIcon = "assets/techStacks/appstore.png";
  static const String awsIcon = "assets/techStacks/aws.png";
  static const String azureIcon = "assets/techStacks/azure.png";
  static const String jiraIcon = "assets/techStacks/jira.png";
  static const String playStoreIcon = "assets/techStacks/playstore.png";
  static const String pythonIcon = "assets/techStacks/python.png";
  static const String eclipseIcon = "assets/techStacks/eclipse.png";
  static const String htmlIcon = "assets/techStacks/html.png";
  static const String mySqlIcon = "assets/techStacks/mysql.png";
  static const String rStudioIcon = "assets/techStacks/r.png";
  static const String androidStudioIcon =
      "assets/techStacks/android-studio.png";
  static const String currentCompanyLogo = "assets/company_logos/cruxule.png";
}

class AppText {
  static const String colabContent =
      "I'm so glad you are here. Get to know me and do drop me an email if you would like to collab or hire me for your next project! ✨";
  static const String aboutMe =
      "I am a highly organized and detail-oriented professional known for consistently exceeding deadlines in fast-paced environments. As a collaborative team player, I leverage adaptability and precision to drive success. Committed to delivering outstanding results, I thrive on tackling challenges with determination, discipline, and expertise.";
  static const String currentCompanyName = "Cruxule Solutions";
  static const String currentPosition = "Full Stack Mobile App Developer";
  static const String currentCompanyLocation = "Chennai, Tamil Nadu, India";
  static const String currentCompanyWorkType = "Full Time";
  static const String currentCompanyWorkExp = "2 yrs 11 mos";
  static const List<String> cruxuleSolutions = [
    'Develops Android and iOS apps using Flutter and Dart, with expertise in Google Map APIs, RESTful APIs, Firestore, and Cloud Functions.',
    'Skilled in Python for web scraping, data manipulation, and handling JSON data.',
    'Manages seamless deployments to the Google Play Store and Apple App Store.',
    'Leads projects as Scrum Master, using Agile with JIRA for requirement gathering and product development.',
    'Mentors team members, oversees code tracking in GitHub, and reviews/approves code merges for quality control.',
  ];
  static const List<String> softwareEngineer = [
    'Mastered Flutter to build high-quality cross-platform apps with advanced architectural patterns.',
    'Created multiple apps focused on intuitive UI/UX, efficient state management, and smooth backend integration.',
    'Led cross-functional teams to solve technical challenges, optimizing app performance and user experience.',
    'Developed innovative solutions in Flutter, consistently achieving project goals and surpassing client expectations.',
  ];
  static const List<String> softwareEngineerTrainee = [
    'Gained hands-on Flutter experience in cross-platform app development.',
    'Performed end-to-end testing with detailed test scenarios and cases.',
    'Built an initial app, focusing on UI design, state management, and backend integration.',
    'Collaborated with team to resolve issues, enhancing app quality and user experience.',
  ];
  static const List<String> tutor = [
    'Managed all aspects of student learning, teaching, and discipline, ensuring educational standards.',
    'Fostered academic growth across all subjects, creating a supportive learning environment.',
    'Provided personalized instruction and mentorship, helping students achieve significant academic progress.',
  ];
  static const List<String> wetract = [
    "Developed the application using the Dart language within the Flutter framework, adhering closely to specified requirements.",
    "Employed third-party libraries and APIs in Flutter effectively to enhance the application's functionality as per requirements.",
    "Played a pivotal role in implementing equipment addition functionality, integrating data storage and retrieval using Google Cloud's Firestore, and ensuring seamless user authentication."
        "Demonstrated extensive proficiency in utilizing Dart to transform data into complex data structures and object mappings, facilitating efficient data rendering on-screen.",
    "Implemented booking functionality based on various parameters such as date-time and location, incorporating detailed pricing information for the user convenience.",
    "Established and enforced coding standards, meticulously documented existing code, and conducted refactoring as necessary to accommodate evolving requirements.",
    "Categorized end-to-end bookings into distinct segments, distinguishing between Booking History (past dates) and Upcoming Bookings (future dates) for clarity and organization.",
    "Introduced additional features to optimize the application's functionality and user experience, ensuring a seamless and intuitive user interface.",
    "Employed Python to extract real-time data and convert it into JSON format, enhancing data processing capabilities within the application.",
    "Facilitated open testing by deploying multiple versions of the application on Android and iOS platforms, including distribution via Google Play Store and App Store."
        "Conducted comprehensive data comparison with external sources, standardizing the format of tractor specifications across the application for consistency and accuracy.",
  ];
  static const List<String> cruxin = [
    "Led the full project lifecycle for Cruxin, ensuring smooth execution and delivery.",
    "Enabled iOS compatibility, configuring settings and optimizations for seamless operation.",
    "Established production environments for Google Play Store and App Store, supporting both testing and production modes.",
    "Resolved platform-specific bugs and implemented design improvements to enhance user experience.",
    "Contributed to the Project Management feature",
    "  Sprint Management: Built JIRA-like sprint board with stages (To-do, In-progress, Review, Completed) and calculated user story points for employees.",
    "  Scheduler Management: Enabled task scheduling and assignment by admins.",
    "Managed complex bug fixes and functionality enhancements across the app.",
  ];
  static const List<String> unitrics = [
    "Implemented the innovative 2D Cutter feature within the Unitrics application, leveraging Dart language within the Flutter framework.",
    "This cutting-edge functionality optimizes material usage by providing precise cutting instructions based on input parameters such as total rod length, quantity, and size. The 2D Cutter minimizes wastage and ensures efficient utilization of materials.",
    "Setup the iOS app environment and configured a production environment in Firestore database. Implemented these setups within the app to support deployment in both production and testing modes for Android and iOS.",
  ];
  static const List<String> voicescribe = [
    "Developed the VOICESCRIBE application, revolutionizing audio transcription.",
    "Seamlessly integrated Dart language within the Flutter framework for optimal performance.",
    "Utilized Firebase Cloud Storage for secure audio file uploads.",
    "Employed Google Cloud Speech-to-Text for precise transcriptions, ensuring accuracy and reliability.",
    "Leveraged advanced machine learning algorithms to refine transcription accuracy and adapt to user preferences.",
    "Incorporated natural language processing (NLP) systems for intelligent analysis and interpretation of audio content.",
    "Designed user-friendly interfaces with intuitive search functionality and responsive navigation.",
    "Offered additional features including a feedback mechanism, Gateway API integration, and options for responses in text and audio formats.",
    "Upheld best coding practices and underwent rigorous testing procedures for reliability.",
    "Continuously evolved to meet user needs, standing as a testament to innovation in voice recognition and collaborative functionality.",
  ];
  static const List<String> ejalMini = [
    "Implemented map integration within the Ejal Mini Test application, enabling users to view and interact with geographical locations.",
    "Users can conveniently access the current latitude and longitude or select a specific location through search or drag-and-drop functionality. This feature enhances user experience and facilitates seamless integration with other functionalities of the application.",
    "Set up the iOS app environment and configured a production environment in Firestore database. Implemented these setups within the app to support deployment in both production and testing modes for Android and iOS."
  ];
  static const List<String> proq = [
    "Developed a high-performance, cross-platform MLM application utilizing RESTful APIs and MySQL database.",
    "Designed and implemented a user-friendly, infographic UI to effectively showcase app features.",
    "Ensured efficient data rendering and high performance by leveraging robust API integration.",
    "Implemented features to support user subscriptions, binary and hierarchical tree structures, and financial transactions.",
    "Enabled secure withdrawal and deposit of funds through cryptocurrency APIs.",
    "Managed user registration and login functionalities, ensuring a seamless user experience.",
    "Deployed the application as an APK file available on the corresponding website, rather than on the Play Store or App Store.",
  ];
  static const List<String> tracker = [
    "It is an University Project for my Bachelor's Degree.",
    "The main aim of the “TRACKER” is to detect the real-timeobject.",
    "Due to object detection’s close relationship with video analysis and image understanding, it has attracted much research attention in recent years.",
    "Their performance easily stagnates by constructing complex ensembles which combine multiple low-level image features with high-level context from object detectors and scene classifiers.",
    "We have used the latest technology including TensorFlow, ObjectDetection, API framework for AI part & HTML, CSS & JS.",
    "We have taken data from COCOSSD. The entire project can be run online on any PC/Laptop."
  ];
}
