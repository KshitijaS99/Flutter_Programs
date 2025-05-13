import 'package:flutter/material.dart';

class FacultyPage extends StatelessWidget {
  FacultyPage({super.key});

  final List<Faculty> _faculties = [
    Faculty(
      name: "Prof. Dr. Dhananjay Kalbande",
      position: "Head Of Department",
      imageUrl: "assets/images/ddk.jpeg",
      qualification: "Post-Doctorate (TISS), Ph.D.,M.E.(I.T.),",
      additionalInfo:
          "Senior Research Fellow (NCW-TISS Project,T.I.S.S., Mumbai)",
    ),
    Faculty(
      name: "Prof. Dr. Pooja Raundale",
      position: "Professor",
      imageUrl: "assets/images/dpr.jpg",
      qualification: "PH.D. (Comp. Sci. & Tech) SNDT Women’s University",
      additionalInfo: "Area of Interest: AI/ML, Data Science",
    ),
    Faculty(
      name: "Prof. Dr. Aarti Karande",
      position: "Assistant Professor",
      imageUrl: "assets/images/dak.png",
      qualification: "Ph.D (Computer engineering from S.P.I.T.)",
      additionalInfo:
          "Additional Qualifications: Agile Foundation Certified, COBIT 5 Certified",
    ),
    Faculty(
      name: "Prof. Harshil Kanakia",
      position: "Assistant Professor",
      imageUrl: "assets/images/HK.png",
      qualification: "Executive PG in Data Science (IIIT Bangalore)",
      additionalInfo:
          "Area of Interest: Data Structures & Algorithms, Automation Programming",
    ),
    Faculty(
      name: "Prof. Nikhita Mangaonkar",
      position: "Assistant Professor",
      imageUrl: "assets/images/nm.jpg",
      qualification: "Master in Computer Application",
      additionalInfo:
          "Area of Interest: Software Project Management, Software Testing & Quality Assurance",
    ),
    Faculty(
      name: "Prof. Sakina Shaikh",
      position: "Assistant Professor",
      imageUrl: "assets/images/ss.png",
      qualification: "M.E. Computers (DJSCOE)",
      additionalInfo:
          "Area of Interest: Cyber Security, User Experience Design",
    ),
    Faculty(
      name: "Prof. Pallavi Thakur",
      position: "Assistant Professor",
      imageUrl: "assets/images/pt.png",
      qualification: "M.E. IT",
      additionalInfo: "Area of Interest: Computer Networks, Web Technology",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: double.infinity,
          alignment: Alignment.center,
          padding: const EdgeInsets.all(20),
          color: const Color.fromARGB(255, 126, 177, 228),
          child: const Text(
            "Our Faculty",
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
        Expanded(
          child: ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: _faculties.length,
            itemBuilder: (context, index) {
              return FacultyCard(faculty: _faculties[index]);
            },
          ),
        ),
      ],
    );
  }
}

class Faculty {
  final String name;
  final String position;
  final String imageUrl;
  final String qualification;
  final String additionalInfo;

  Faculty({
    required this.name,
    required this.position,
    required this.imageUrl,
    required this.qualification,
    required this.additionalInfo,
  });
}

class FacultyCard extends StatelessWidget {
  final Faculty faculty;

  const FacultyCard({required this.faculty, super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      margin: const EdgeInsets.symmetric(vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              radius: 40,
              backgroundImage: AssetImage(faculty.imageUrl),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    faculty.name,
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    faculty.position,
                    style: TextStyle(fontSize: 16, color: Colors.grey[600]),
                  ),
                  const SizedBox(height: 8),
                  Text("Qualification: ${faculty.qualification}"),
                  const SizedBox(height: 4),
                  Text("Additional Info: ${faculty.additionalInfo}"),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
